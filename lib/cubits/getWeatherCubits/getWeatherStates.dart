import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class GetWeatherState extends WeatherState {
  final WeatherModel weatherModel;

  GetWeatherState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errMessage;

  WeatherFailureState(this.errMessage);
}
