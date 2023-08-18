import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {

   SearchPage({Key? key}) : super(key: key);
   String? cityName ;
   @override
  Widget build(BuildContext context) {
     return  Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (data) async{
              cityName = data;
            BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
            Navigator.pop(context);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a City',
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              label: Text('Search'),
              suffixIcon: Icon(Icons.search),
            ),
          ),

        ),
      ),
    );
  }
}
