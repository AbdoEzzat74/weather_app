import 'package:bloc/bloc.dart';
import 'package:weather/cubit/weather_state.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/weather_services/weather_services.dart';


class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherServices):super(WeatherInitialState());
  WeatherServices weatherServices ;
  String? cityName ;
  WeatherModel? weatherModel ;
  void getWeather({required String cityName}) async{
    emit(WeatherLoadingState());
    try {
      weatherModel =  await weatherServices.getWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch(e){
      emit(WeatherErrorState());
    }

    }
}