

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherman/controllers/HourController.dart';
import 'package:weatherman/services/constants.dart';
import 'package:weatherman/services/main_service.dart';
import 'package:weatherman/controllers/DaysController.dart';
import '../models/Day.dart';
import '../models/Hour.dart';




class heroWidget extends StatelessWidget {

  final callBackUpdateWeather;
  heroWidget({required this.callBackUpdateWeather});
  @override
  Widget build(BuildContext context) {
    // MainService.create_day_and_hour_objects();
    Day today =  MainService.get_today_info();
    Hour nowHour = MainService.get_hour_now();

    return Column(

      children: [
        GestureDetector(
          onTap: callBackUpdateWeather,
          child: Icon(
            Icons.refresh,
            color: realodButtonColor,
            size: kreloadButtonSize,
            semanticLabel: 'reload button',

          ),
        ),
        Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      '${HourController.get_temperature(nowHour)}°',
                      style: TextStyle(
                        fontSize: kMainTempFontSize,
                        color: mainTempColor,
                      ),
                    ),
                  ],
                ), //main temperature
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                            'rain %: ${DaysController.get_chance_of_rain(today)}',
                          style: TextStyle(
                            fontSize: kLeftSectionFontSize,
                            color: heroFontColor,
                          ),
                        ),
                        Text('sunrise: ${DaysController.get_sunrise(today)}',
                          style: TextStyle(
                            fontSize: kLeftSectionFontSize,
                            color: heroFontColor,
                          ),
                        ),
                        Text('sunset: ${DaysController.get_sunset(today)}',
                          style: TextStyle(
                            fontSize: kLeftSectionFontSize,
                            color: heroFontColor,
                          ),),
                      ],
                    ), //left section
                    Spacer(),//
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                     //main temperature
                        Text(
                          'max: ${DaysController.get_max_temperature(today)}°C ',
                          style: TextStyle(
                            fontSize: kmaxAndMinTempFontSize,
                            color: heroFontColor,
                          ),
                        ),
                        Text(
                          'min: ${DaysController.get_min_temperature(today)}°C ',
                          style: TextStyle(
                            fontSize: kmaxAndMinTempFontSize,
                            color: heroFontColor,
                          ),
                        ), //min & max temp
                        Text(
                          'wind: ${DaysController.get_wind_direction(today)} ${DaysController.get_wind_speed(today)} km/h',
                          style: TextStyle(
                            fontSize: kmaxAndMinTempFontSize,
                            color: heroFontColor,
                          ),
                        ), //wind
                      ],
                    ), //middle section
                    Spacer(),
                    Column(
                      children: [
                        Text(
                            '${DaysController.get_wmo(today)}',
                          style: TextStyle(
                            color: heroFontColor,
                            fontSize: kRightSectionFontSize,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),//right section

                  ],
                ),
              ],
            ),
          ],
        ),

      ],
    );
  }
}