import 'dart:convert';
import '../model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServices{
String baseUrl = 'http://api.weatherapi.com/v1'    ;
String apiKey  = 'b9f1c0de6fbd45a2959232606231408' ;

Future<WeatherModel> getWeather({required String cityName})async {
  Uri url = Uri.parse(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
  var response = await http.get(url);
  if (response.statusCode == 400) {
    var data = jsonDecode(response.body);
    throw Exception(data['error']['message']);
  }
  Map<String, dynamic> data = jsonDecode(response.body);
  WeatherModel weather = WeatherModel.fromjson(data);
  return weather;
}
}