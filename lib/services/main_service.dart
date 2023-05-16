
import 'package:intl/intl.dart';
import 'package:weatherman/controllers/DaysController.dart';
import 'package:weatherman/controllers/HourController.dart';
import 'package:weatherman/models/Day.dart';
import 'package:weatherman/models/Hour.dart';
List<dynamic> hours = [];
List<dynamic> days = [];


//make sure to call create_day_and_hour_controller first!==================================
class MainService {



  static Day get_today_info() {
    DateTime currentDate = DateTime.now(); // Current date
    String dateString;
    DaysController.createDayObjects();
    bool todayFound = false;
      for (Day day in DaysController.days) {
        dateString = DaysController.get_date(day);
        DateTime parsedDate = DateTime.parse(dateString);

        String currentFormattedDate = DateFormat('yyyy-MM-dd').format(
            currentDate); //reset hour to 00:00 to easily compare and find today
        String parsedDateFormatted = DateFormat('yyyy-MM-dd').format(
            parsedDate);
        parsedDate = DateTime.parse(parsedDateFormatted);
        currentDate = DateTime.parse(currentFormattedDate);

        if (parsedDate.isAtSameMomentAs(currentDate)) {
          todayFound = true;
          return day;
        }
      }

    throw Exception('today not found in dates, this may indicate that the weather.json file'
        ' is not downloaded yet, or another error in parsing data');
  }

  static Hour get_hour_now() {
    String hourString; // Hour string to compare

    DateTime now = DateTime.now(); // Current time
    String hourNow = now.hour.toString();

    for (Hour hour in HourController.hours) {
      hourString = HourController.get_time(hour); //get hour time as string

      if (hourNow == hourString) {
        return hour;
      }
    }
    throw Exception('hour not found');
  }

  static List<dynamic> get_hours_after_now() {
    List<dynamic> hours_after_now = [];
    String hourString;
    DateTime now = DateTime.now();
    String hourNowString = now.hour.toString();
    HourController.createHourObjects();




    for (Hour hour in HourController.hours) {
      hourString = HourController.get_time(hour);


      if (int.parse(hourNowString) < int.parse(hourString)) {
        hours_after_now.add(hour);
      }
    }
    return hours_after_now;
  }

}