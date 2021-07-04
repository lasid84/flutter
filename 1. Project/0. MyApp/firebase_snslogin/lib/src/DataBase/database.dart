import 'dart:io';

import 'package:firebase_snslogin/src/DataBase/TableAttend.dart';
import 'package:firebase_snslogin/src/DataBase/TableManager.dart';
import 'package:firebase_snslogin/src/DataBase/TablePersonalInfo.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';


part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'RPS.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [ PersonalInfo , Manager, Attend], daos: [DBDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) {
      return m.createAll();
    },
    // onUpgrade: (Migrator m, int from, int to) async {
    //   if (from == 1) {
    //     await m.createTable(Manager);
    //     await m.createTable(Attend);
    //   }
    // },
    beforeOpen: (detail) async {
      await customStatement('PRAGMA foreign_key = ON');
    },
  );
}
