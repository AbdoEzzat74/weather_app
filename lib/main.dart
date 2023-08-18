import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Screens/Home_Screen.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/cubit/weather_state.dart';
import 'package:weather/weather_services/weather_services.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp  extends StatelessWidget {
   const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => WeatherCubit(WeatherServices()),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}


