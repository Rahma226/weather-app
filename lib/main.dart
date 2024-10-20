import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_Weather_Cubit/get_weather_states.dart';
import 'package:weather_app/cubits/get_Weather_Cubit/get_wether_cubit.dart';
import 'package:weather_app/views/WeatherView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (context) => GetWetherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWetherCubit, GetWeatherStates>(
          builder: (context, state) {
            final color = getThemeColor(state is WeatherLoadedState
                ? state.weathermodel.weatherCondition
                : null);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: color,
                appBarTheme: AppBarTheme(backgroundColor: color),
                primaryColor: color,
                primarySwatch: color,
              ),
              home: WeatherView(),
            );
          },
        ),
      ),
    );
  }
}


MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.lightBlue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;

    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;

    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;

    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Patchy light rain':
      return Colors.lightBlue;

    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Blizzard':
      return Colors.blue;

    case 'Thundery outbreaks possible':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepOrange;

    default:
      return Colors.blue;
  }
}
