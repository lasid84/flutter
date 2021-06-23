import 'package:intl/intl.dart';

class Common {
  static String getDateFormat(String? date) {
    if (date == null) {
      return '-';
    } else {
      String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
      DateTime dateTime = DateTime.parse(dateWithT);
      final f = new DateFormat('yyyy-MM-dd hh:mm:ss');
      return f.format(dateTime);
    }
  }

  static late var nickName;
  static late var name;
  static late var email;
}
