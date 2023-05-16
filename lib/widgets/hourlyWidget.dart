import 'package:weatherman/controllers/HourController.dart';
import 'package:weatherman/widgets/singleHourWidget.dart';
import 'package:weatherman/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:weatherman/services/main_service.dart';

import '../models/Hour.dart';
class hourlyWidget extends StatelessWidget {

List<Widget>  createHourList(){

  List<dynamic> hours = MainService.get_hours_after_now();
  List<Widget> hourWidgets = [];
  for(Hour hour in hours){
    hourWidgets.add(singleHourWidget(HourController.get_time(hour),
        HourController.get_temperature(hour).toString(),
        HourController.get_chance_of_rain(hour).toString()));
    hourWidgets.add(SizedBox(width:20));

  }
  return hourWidgets;
}

  @override
  Widget build(BuildContext context) {
    List<Widget> hourList = createHourList();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: hourList,
      ),
    );
  }
}