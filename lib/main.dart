import 'package:flutter/material.dart';
import 'package:weatherman/controllers/DaysController.dart';
import 'package:weatherman/controllers/HourController.dart';
import 'package:weatherman/services/constants.dart';
import 'package:weatherman/services/get_weather_information.dart';
import 'package:weatherman/widgets/heroWidget.dart';
import 'package:weatherman/widgets/hourlyWidget.dart';
import 'package:weatherman/widgets/dailyWidget.dart';
import 'package:weatherman/services/main_service.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
var weatherInfo;
var hourly = '';
var testyVariable;

void initState() {


  // MainService.create_day_and_hour_objects();
  print('init state called');

  fetchData().then(
      (result){
        DaysController.createDayObjects();
        HourController.createHourObjects();
        print("api responded ${result}");
      }
  );

}




class _MyAppState extends State<MyApp>  {
  void updateWeather(){

    DaysController.days = [];
    HourController.hours = [];
    fetchData();
    DaysController.createDayObjects();
    HourController.createHourObjects();
    Future.delayed(Duration(seconds: 2),(){
      setState(() {  });
    });

    // createHourObjects();

    // DaysController.createDayObjects();
    // HourController.createHourObjects();
    // MainService.create_day_and_hour_objects();

    // hourly = HourController.hours.elementAt(15).time;
    print('update weather called');
  }



  @override
  Widget build(BuildContext context) {
    initState();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF011930), Color(0xFF018F71)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height:40),


                heroWidget(callBackUpdateWeather: updateWeather),
                SizedBox(height:80),
                hourlyWidget(),
                SizedBox(height:80),
                DailyWidget(),
              ],
            ),
          ),
        )
      ),
    );
  }
}










