// ignore: file_names
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCubits/getWeatherStates.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit(super.NoWeatherState);

  WeatherModel? weatherModel;

  getWeather({required cityname}) async {
    try {
      weatherModel = await WeatherServices(dio: Dio())
          .getCurrentWeather(cityname: cityname);
      emit(GetWeatherState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
