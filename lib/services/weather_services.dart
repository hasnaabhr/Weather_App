import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final apiKey = '9720dfde420649f48f2162715230412';
  WeatherServices({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=1');

      WeatherModel weatherModel = WeatherModel.Fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error,try again!';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error,try again!');
    }
  }
}
