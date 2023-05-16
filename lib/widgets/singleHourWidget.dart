import 'package:flutter/material.dart';
import 'package:weatherman/services/constants.dart';
class singleHourWidget extends StatelessWidget {

  String hourTime=''; String temperature=''; String chance_of_rain='';
  singleHourWidget(this.hourTime, this.temperature, this.chance_of_rain);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(this.hourTime,
          style: TextStyle(
              fontSize: hourlyTimeFontSize,
              color: hourlyTimeFontColor
          ),
        ),
        Text('${this.temperature}°C',
            style: TextStyle(
              fontSize: hourlyTempFontSize,
              color: hourlyFontColor,
            )
        ),
        Text('rain:${this.chance_of_rain}%',
          style: TextStyle(
              fontSize: hourlyFontSize,
              color: hourlyFontColor
          ),
        ),

      ],
    );
  }
}