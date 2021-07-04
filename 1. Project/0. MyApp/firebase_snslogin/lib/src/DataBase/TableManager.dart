import 'package:firebase_snslogin/src/DataBase/database.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

part 'TableManager.g.dart';

class Manager extends Table {

  TextColumn get email => text().withLength(min: 1)();

  IntColumn get attend_date => integer()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}