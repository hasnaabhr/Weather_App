// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screens/SearchPage.dart';
import 'package:weather_app/cubits/getWeatherCubits/getWeatherCubit.dart';
import 'package:weather_app/cubits/getWeatherCubits/getWeatherStates.dart';
import 'package:weather_app/widgets/NoWeatherApp.dart';

import 'package:weather_app/widgets/WeatherInfo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else if (state is GetWeatherState) {
            return WeatherInfo(
              weather: state.weatherModel,
            );
          } else {
            return const Text('opps there was an error');
          }
        },
      ),
    );
  }
}
