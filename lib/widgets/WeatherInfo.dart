// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCubits/getWeatherCubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

// ... (imports)

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.wstatues),
            getThemeColor(weatherModel.wstatues)[300]!,
            getThemeColor(weatherModel.wstatues)[50]!
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityname,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Image.network(
                "https:${weatherModel.image}",
                height: 80,
                width: 80,
              ),
              const SizedBox(height: 8),
              Text(
                '${weatherModel.avg.toString()}°C',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTemperatureInfo(
                    label: 'Max Temp',
                    value: '${weatherModel.maxtemp.round()}°C',
                  ),
                  const SizedBox(width: 16),
                  _buildTemperatureInfo(
                    label: 'Min Temp',
                    value: '${weatherModel.mintemp.round()}°C',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                weatherModel.wstatues,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTemperatureInfo({required String label, required String value}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
