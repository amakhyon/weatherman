import 'package:intl/intl.dart';
import 'package:weatherman/models/Hour.dart';
import 'package:weatherman/services/get_weather_information.dart';
import'package:weatherman/services/constants.dart';
class HourController {

  static  List<dynamic> hours = [];

  static String get_time(Hour hour){
    return (hour.time);
  }
  static int get_humidity(Hour hour){
    return(hour.humidity);
  }
  static double get_temperature(Hour hour){
    return(hour.temperature);
  }
  static int get_chance_of_rain(Hour hour){
    return(hour.chance_of_rain);
  }
  static double get_uv_index(Hour hour){
    return(hour.uv_index);
  }


  static void createHourObjects(){

    if(hours.isEmpty) {
      decodeJsonFromLocalFile().then(
              (result) {
            // parsedJson['hourly']['time'][0]
            int hoursLength = result['hourly']['time'].length;
            for (int i = 0; i < hoursLength; i++) {
              String hourTimeDate = result['hourly']['time'][i];

              DateTime dateTime = DateTime.parse(hourTimeDate);
              String hourTime = dateTime.hour
                  .toString();

              DateTime parsedDate = DateTime.parse(hourTimeDate);
              String currentHourDate = DateFormat('yyyy-MM-dd').format(
                  parsedDate).toString();

              DateTime now = DateTime.now();
              String nowString = DateFormat('yyyy-MM-dd')
                  .format(now)
                  .toString();

              if (currentHourDate == nowString) {
                int hourHumidity = result['hourly']['relativehumidity_2m'][i];
                double hourTemperature = result['hourly']['apparent_temperature'][i];
                int hourChanceOfRain = result['hourly']['precipitation_probability'][i];
                double hourUv = result['hourly']['uv_index_clear_sky'][i];
                hours.add(Hour(
                    hourTime, hourHumidity, hourTemperature, hourChanceOfRain,
                    hourUv));
              }
            }
          });
    }
  }


}
