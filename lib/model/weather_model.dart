import 'package:flutter/material.dart';

class WeatherModel {
  String name;
  DateTime  date;
  double maxtemp;
  double mintemp;
  double  avgtemp;
  String condition;
  String Icon ;

  WeatherModel({
    required this.name ,
    required this.date,
    required this.avgtemp,
    required this.condition,
    required this.maxtemp,
    required this.mintemp,
    required this.Icon,
});

 factory WeatherModel.fromjson(dynamic data)
 {
   var getdata = data ['forecast']['forecastday'][0]['day'] ;
   return WeatherModel(
       name: data['location']['name'],
       date:DateTime.parse( data['current']['last_updated']),
       avgtemp: getdata['avgtemp_c'],
       condition: getdata['condition']['text'],
       maxtemp: getdata['maxtemp_c'],
       mintemp: getdata['mintemp_c'],
       Icon: getdata['condition']['icon'],
   );
 }
  @override
  String toString() {
    return 'minTemp = $mintemp  date = $date';
  }
  String getImage() {
    if (condition == 'Sunny' || condition == 'Clear' ||  condition == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (

    condition == 'Blizzard' ||  condition == 'Patchy snow possible'  ||  condition == 'Patchy sleet possible' || condition == 'Patchy freezing drizzle possible' || condition == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (condition == 'Freezing fog' || condition == 'Fog' ||  condition == 'Heavy Cloud' || condition == 'Mist' || condition == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (condition == 'Thundery outbreaks possible' || condition == 'Moderate or heavy snow with thunder' || condition == 'Patchy light snow with thunder'|| condition == 'Moderate or heavy rain with thunder' || condition == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
  MaterialColor getThemeColor() {
    if (condition == 'Sunny' || condition == 'Clear' ||  condition == 'partly cloudy') {
      return Colors.orange;
    } else if (

    condition == 'Blizzard' ||  condition == 'Patchy snow possible'  ||  condition == 'Patchy sleet possible' || condition == 'Patchy freezing drizzle possible' || condition == 'Blowing snow') {
      return Colors.blue;
    } else if (condition == 'Freezing fog' || condition == 'Fog' ||  condition == 'Heavy Cloud' || condition == 'Mist' || condition == 'Fog') {
      return Colors.blueGrey;
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return Colors.blue;
    } else if (condition == 'Thundery outbreaks possible' || condition == 'Moderate or heavy snow with thunder' || condition == 'Patchy light snow with thunder'|| condition == 'Moderate or heavy rain with thunder' || condition == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }


}


