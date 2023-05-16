import 'package:weatherman/models/Hour.dart';
import 'package:weatherman/services/get_weather_information.dart';


import 'package:weatherman/models/Day.dart';
import 'package:intl/intl.dart';


class DaysController {


  static List<dynamic> days = [];

  static String get_wmo(Day day){
    return day.wmo;
  }
  static double get_max_temperature(Day day){
    return day.max_temp;
  }
  static double get_min_temperature(Day day){
    return day.min_temp;
  }

  static String get_sunrise(Day day){
    String hourString = day.sunrise;
    DateTime parsedDate = DateTime.parse(hourString); // Parse the date and time string
    String daySunRise = DateFormat.Hm().format(parsedDate).toString();
    return daySunRise;
  }

  static String get_sunset(Day day){
    String hourString = day.sunset;
    DateTime parsedDate = DateTime.parse(hourString); // Parse the date and time string
    String daySunSet = DateFormat.Hm().format(parsedDate).toString();
    return daySunSet;
  }

  static double get_wind_speed(Day day){
    return day.wind_speed;
  }
  static String get_wind_direction(Day day){
    return day.wind_direction;
  }

  static double get_chance_of_rain(Day day){
    return day.chance_of_rain;
  }

  static String get_date(Day day){
    return day.date;
  }
  static String get_day_of_week(Day day){
    return day.day_of_week;
  }

 static var degreesToCompass = {  //To convert degrees to compass directions, I first divide the compass into 16 sectors of 22.5 degrees each. The sectors are like slices of pie, centered on the compass points.
    1 : 'N',
    2: 'NNE',
    3: 'NE',
    4: 'ENE',
    5: 'E',
    6: 'ESE',
    7: 'SE',
    8: 'SSE',
    9: 'S',
    10: 'SSW',
    11: 'SW',
    12: 'WSW',
    13: 'W',
    14: 'WNW',
    15: 'NW',
    16: 'NNW',
    17: 'N',
  };
  static var wmoToString = {
    00:	'clear sky',
    01	: 'clear sky',
    02:	'clear sky',
    03	: 'Clouds forming',
    04:	'Visibility'
        ' reduced  smoke',
    05	: 'Haze',
    06	: 'dust in '
        'suspension',
    07	: 'sand  wind ',
    08	:' sand whirl(s) ',
    09	:'sandstorm '
        'within sight',
    10:	'Mist',
    11:	'shallow fog',
    12:	'shallow fog',
    13:	'Lightning visible',
    14: 'Precipitation '
        'within sight',
    15:	'Precipitation'
        ' within sight,',
    16:	'Precipitation'
        ' within sight',
    17:	'Thunderstorm',
    18:	'Squalls',
    19 : 'Funnel clouds',
    20	:'Drizzle'
        ' (not freezing)',
    21:	'Rain '
        '(not freezing)',
    22:	'Snow',
    23:	'Rain and snow',
    24:	'Freezing  rain',
    25:	'Shower(s) of rain',
    26:	'Shower(s) of snow',
    27:	'Shower(s) of hail',
    28:	'Fog ',
    29:	'Thunderstorm ',
    30:	'Slight sandstorm',
    31:	'Slight sandstorm',
    32:	'Slight sandstorm',
    33:	'Severe sandstorm',
    34:	'Severe sandstorm',
    35:	'Severe  sandstorm',
    36:	'Slight'
        ' blowing snow',
    37:	'Heavy '
        'drifting snow',
    38:	'Slight '
        'blowing snow',
    39:	'Heavy '
        'drifting snow',
    40:	'Fog ',
    41:	'Fog '
        ' patches',
    42:	'Fog '
        'sky visible',
    43:	'Fog  '
        'sky invisible',
    44:	'Fog  '
        'sky visible',
    45:	'Fog'
        ' sky invisible',
    46:	'Fog '
        'sky visible',
    47:	'Fog '
        'sky invisible',
    48:	'Fog,'
        ' sky visible',
    49:	'Fog, '
        'sky invisible',
    50:	'slight drizzle ',
    51:	'continuous drizzle',
    52:	'moderate drizzle',
    53:	'continuous drizzle',
    54:	'heavy drizzle',
    55:	'continuous Drizzle',
    56:	'freezing drizzle',
    57:	'heavy drizzle',
    58:	'slight rain',
    59:	'heavy rain',
    60:	'slight rain',
    61:	'continuous rain',
    62:	'moderate rain',
    63:	'continuous rain',
    64:	'heavy rain',
    65:	'Rain, continuous',
    66:	'Rain, '
        'freezing, slight',
    67:	'freezing rain',
    68:	'slight '
        'rain & snow',
    69:	'heavy rain',
    70:	'slight snow',
    71:	'Continuous snow',
    72:	'heavy snow',
    73:	'Continuous snow',
    74:	'heavy snow',
    75:	'Continuous snow',
    76:	'fog',
    77:	'fog',
    78:	'fog',
    79:	'Ice pellets',
    80:	'Rain showers',
    81:	'Rain showers',
    82:	'Rain showers',
    83:	'Rain showers ',
    84:	'Rain showers',
    85:	'Snow shower(s),'
        ' slight',
    86:	'Snow shower(s),'
        ' heavy',
    87:	'Shower(s) '
        'of snow ',
    88:	'Shower(s)'
        ' of snow ',
    89:	'Shower(s) '
        'of hail ',
    90: 'Shower(s) '
        'of hail',
    91:	'Slight rain',
    92:	'Moderate or '
        'heavy rain ',
    93:	'Moderate or '
        'heavy snow',
    95:	'Thunderstorm',
    96:	'Thunderstorm',
    97:	'Thunderstorm',
    98:	'Thunderstorm',
    99:	'Thunderstorm',
  };

  static void createDayObjects(){
    // days = [];
    if(days.isEmpty) {
      decodeJsonFromLocalFile().then(
              (result) {
            int daysLength = result['daily']['time'].length;
            for (int i = 0; i < daysLength; i++) {
              int dayWinddirectionDegrees = result['daily']['winddirection_10m_dominant'][i];


              dayWinddirectionDegrees = (dayWinddirectionDegrees / 22.5)
                  .round(); //convert 335 to NE, ae degrees to compass for better comprehension
              String dayWinddirectionCompass = '';
              if (degreesToCompass[dayWinddirectionDegrees] != null) {
                dayWinddirectionCompass =
                degreesToCompass[dayWinddirectionDegrees]!;
              }


              int dayWmo = result['daily']['weathercode'][i];
              String? dayWmoString = "clear skyn't";
              if (wmoToString[dayWmo] != null) {
                dayWmoString = wmoToString[dayWmo];
              }

              double dayMax_temp = result['daily']['apparent_temperature_max'][i];
              double dayMin_temp = result['daily']['apparent_temperature_min'][i];
              String daySunrise = result['daily']['sunrise'][i];
              String daySunset = result['daily']['sunset'][i];
              double dayWindspeed = result['daily']['windspeed_10m_max'][i];

              double dayChanceOfRain = result['daily']['precipitation_sum'][i];
              String dayDate = result['daily']['time'][i];
              String dayOfWeek = DateFormat('EEEE').format(
                  DateTime.parse(dayDate));

              days.add(Day(
                  dayWmoString!,
                  dayMax_temp,
                  dayMin_temp,
                  daySunrise,
                  daySunset,
                  dayWindspeed,
                  dayWinddirectionCompass,
                  dayChanceOfRain,
                  dayDate,
                  dayOfWeek));
            }
          });
    }


  }

}


// Day(this.wmo, this.max_temp, this.min_temp,
//     this.sunrise, this.sunset, this.wind_speed,
//     this.wind_direction, this.chance_of_rain, this.date,
//     this.day_of_week);



//  parsedJson['daily']['time'][0]);
//  parsedJson['daily']['weathercode'][0]);
//  parsedJson['daily']['apparent_temperature_max'][0]);
//  parsedJson['daily']['apparent_temperature_min'][0]);
//  parsedJson['daily']['sunrise'][0]);
//  parsedJson['daily']['sunset'][0]);
//  parsedJson['daily']['uv_index_clear_sky_max'][0]);
//  parsedJson['daily']['precipitation_sum'][0]);
//  parsedJson['daily']['winddirection_10m_dominant'][0]);
//  parsedJson['daily']['windspeed_10m_max'][0]);
