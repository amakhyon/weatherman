import 'package:flutter/material.dart';
import 'package:weatherman/services/constants.dart';


class singleDayWidget extends StatelessWidget {

  String day_of_week = '';
  double dayMaxTemp = 0.0;
  double dayMinTemp = 0.0;
  double day_chance_of_rain = 0.0;
  double day_wind_speed = 0.0;
  String day_wind_direction = '';
  String day_wmo = '';
  int day_humidity = 0;
  singleDayWidget(this.day_of_week, this.dayMaxTemp, this.dayMinTemp,
      this.day_chance_of_rain,this.day_wind_speed,this.day_wind_direction,
      this.day_wmo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.day_of_week,
            style:TextStyle(
              color: dailyAreaFontColor,
            )),
        Text('max: ${this.dayMaxTemp}°C',
            style:TextStyle(
              color: dailyAreaFontColor,
            )),
        Container(
          height:(this.dayMaxTemp - this.dayMinTemp )* 5,
          width:10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4C4C4C), Color(0xFF999999)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Text('min: ${this.dayMinTemp}°C',
            style:TextStyle(
              color: dailyAreaFontColor,
            )),
        Text('rain:${this.day_chance_of_rain}%',
            style:TextStyle(
              color: dailyAreaFontColor,
            )),

        Text('wind: ${this.day_wind_direction}',
            style:TextStyle(
              color: dailyAreaFontColor,
            )),
        Text('${this.day_wind_speed} km/h',
            style:TextStyle(
              color: dailyAreaFontColor,
            )),

      ],
    );
  }
}