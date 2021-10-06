import 'package:firebase_snslogin/src/DataBase/database.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

part 'TablePersonalInfo.g.dart';

class PersonalInfo extends Table {

  TextColumn get email => text().withLength(min: 1)();

  TextColumn get nickname => text().withLength(min:1, max: 20)();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

@UseDao(tables: [PersonalInfo])
class DBDao extends DatabaseAccessor<Database> with _$DBDaoMixin {
  DBDao(Database db) : super(db);
//
  Stream<List<PersonalInfoData>> streamPersonInfoes() => select(personalInfo).watch();

  Stream<PersonalInfoData> streamPersonInfo(String email) =>
      (select(personalInfo)..where((tbl) => tbl.email.equals(email))).watchSingle();

  Future insertPersonalInfo(PersonalInfoCompanion data) =>
      into(personalInfo).insert(data);
//
//   Stream<List<DiaryWithTagModel>> streamDiariesWithTags() {
//     final diariesStream = select(diary).watch();
//
//     return diariesStream.switchMap((diaries) {
//       final idToDiary = {for (var diary in diaries) diary.id: diary};
//
//       final diaryIds = idToDiary.keys;
//
//       final tagQuery = select(diaryWithTag).join([
//         innerJoin(tag, tag.id.equalsExp(diaryWithTag.tagId)),
//       ])
//         ..where(diaryWithTag.diaryId.isIn(diaryIds));
//
//       return tagQuery.watch().map((rows) {
//         final idToTags = <int, List<TagData>>{};
//
//         for (var row in rows) {
//           final tags = row.readTable(tag);
//           final id = row.readTable(diaryWithTag).diaryId;
//
//           idToTags.putIfAbsent(id, () => []).add(tags);
//         }
//
//         return [
//           for (var id in diaryIds)
//             DiaryWithTagModel(diary: idToDiary[id]!, tags: idToTags[id]!)
//         ];
//       });
//     });
//   }
//
//   Stream<List<DiaryData>> streamDiaries() => select(diary).watch();
//
//   Stream<DiaryData> streamDiary(int id) =>
//       (select(diary)..where((tbl) => tbl.id.equals(id))).watchSingle();
//
//   Future insertDiary(DiaryCompanion data, String diaryTags) async {
//     return transaction(() async {
//       final tags = diaryTags.split(',').length > 0
//           ? diaryTags.split(',')
//           : [
//         diaryTags,
//       ];
//       final tagIds = [];
//
//       for (var diaryTag in tags) {
//         final tagCompanion = TagCompanion(
//           name: Value(diaryTag),
//         );
//         await into(tag).insert(
//           tagCompanion,
//           mode: InsertMode.insertOrIgnore,
//         );
//
//         final tagInst = await (select(tag)
//           ..where((tbl) => tbl.name.equals(diaryTag)))
//             .getSingle();
//
//         tagIds.add(tagInst.id);
//       }
//
//       final diaryId = await into(diary).insert(data);
//
//       for (var tagId in tagIds) {
//         await into(diaryWithTag).insert(
//           DiaryWithTagCompanion(
//             diaryId: Value(diaryId),
//             tagId: Value(tagId),
//           ),
//         );
//       }
//     });
//   }
}