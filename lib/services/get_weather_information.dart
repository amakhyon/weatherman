import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

//apiURL = 'https://api.open-meteo.com/v1/forecast?latitude=29.97&longitude=31.02&hourly=relativehumidity_2m,apparent_temperature,precipitation_probability,rain,uv_index_clear_sky&models=best_match&daily=weathercode,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,uv_index_clear_sky_max,precipitation_sum,windspeed_10m_max,winddirection_10m_dominant&timezone=auto';


String apiUrl = 'https://api.open-meteo.com/v1/forecast?latitude=29.97&longitude=31.02&hourly=relativehumidity_2m,apparent_temperature,precipitation_probability,rain,uv_index_clear_sky&models=best_match&daily=weathercode,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,uv_index_clear_sky_max,precipitation_sum,windspeed_10m_max,winddirection_10m_dominant&timezone=auto';


void saveDataToLocalFile(String weatherInfo) async {
 final directory = await getApplicationDocumentsDirectory();
 final file = File('${directory.path}/weatherInfo.json');
 print("saving data to local file");
 await file.writeAsString(weatherInfo);
}


Future<int> fetchData() async {

 final response = await http.get(Uri.parse(apiUrl));
 if (response.statusCode == 200) {
  print(response.body);
  saveDataToLocalFile(response.body);
  return response.statusCode;
 } else {
  return response.statusCode;
 }
}

Future<String> readDataFromLocalFile() async {
 final directory = await getApplicationDocumentsDirectory();
 final file = File('${directory.path}/weatherInfo.json');
 if (await file.exists()) {
  final jsonData = await file.readAsString();
  return jsonData;

 } else {
  print('didnot read file');
  return '';
 }
}
Future<dynamic> decodeJsonFromLocalFile(){
 return readDataFromLocalFile().then(
     (result){
      // print(result);
      return jsonDecode(result);
     }
 );
}

void main() async {
 // saveToLocalFileFromApi();
 // print(readWeatherInformationFromLocalFile());

 // Directory current = Directory.current;
 // print(current.path);
 // final parsedJson = jsonDecode(info);

}



 // parsedJson['hourly']['time'][0]
 // parsedJson['hourly']['relativehumidity_2m'][0]
 // parsedJson['hourly']['apparent_temperature'][0]
 // parsedJson['hourly']['precipitation_probability'][0])
 // parsedJson['hourly']['uv_index_clear_sky'][0]


 // parsedJson['daily']['time'][0]
 //  parsedJson['daily']['time'][0]);
 //  parsedJson['daily']['weathercode'][0]);
 //  parsedJson['daily']['apparent_temperature_max'][0]);
 //  parsedJson['daily']['apparent_temperature_min'][0]);
 //  parsedJson['daily']['sunrise'][0]);
 //  parsedJson['daily']['sunset'][0]);
 //  parsedJson['daily']['uv_index_clear_sky_max'][0]);
 //  parsedJson['daily']['precipitation_sum'][0]);
 //  parsedJson['daily']['winddirection_10m_dominant'][0]);

