import 'package:flutter/material.dart';
import 'package:weatherman/controllers/DaysController.dart';
import 'package:weatherman/services/constants.dart';
import 'package:weatherman/widgets/singleDayWidget.dart';
import 'package:weatherman/models/Day.dart';

class DailyWidget extends StatelessWidget {

  List<Widget> createDayWidgets(){
    List<Widget> dayWidgets = [];
    for(Day day in DaysController.days){
      dayWidgets.add(singleDayWidget(DaysController.get_day_of_week(day),
          DaysController.get_max_temperature(day), DaysController.get_min_temperature(day),
          DaysController.get_chance_of_rain(day),
          DaysController.get_wind_speed(day),
          DaysController.get_wind_direction(day),
          DaysController.get_wmo(day),
          ));
      dayWidgets.add(SizedBox(width:20));
    }
    return dayWidgets;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> dayWidgets = createDayWidgets();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dayWidgets
      ),
    );
  }
}