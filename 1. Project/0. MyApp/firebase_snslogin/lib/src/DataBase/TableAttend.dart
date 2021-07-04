import 'package:firebase_snslogin/src/DataBase/database.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

part 'TableAttend.g.dart';

class Attend extends Table {

  TextColumn get email => text().withLength(min: 1)();

  TextColumn get attend_date => text()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}