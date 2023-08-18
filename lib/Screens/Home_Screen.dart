import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Screens/Search_Screen.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/cubit/weather_state.dart';
import 'package:weather/model/weather_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      if (state is WeatherLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is WeatherSuccessState) {
        weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: weatherData!.getThemeColor(),
              elevation: 0.0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
              title: const Text("Weather App"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  icon: const Icon(Icons.search),
                )
              ],
              centerTitle: false,
            ),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      weatherData!.getThemeColor(),
                      weatherData!.getThemeColor()[300]!,
                      weatherData!.getThemeColor()[100]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                   weatherData!.name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        weatherData!.avgtemp.toInt().toString(),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text('maxTemp :${weatherData!.maxtemp.toInt()}'),
                          Text('minTemp : ${weatherData!.mintemp.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherData!.condition,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Weather APP'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(),
                        ));
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start \n searching now 🔍',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
