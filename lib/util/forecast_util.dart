import 'package:intl/intl.dart';

class Util{
  static String appId = "ba28ed71fb45110eda230cede8eaeb66";

  static String getFormattedDate(DateTime dateTime) {
    //... 2021
    return new DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}