import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_Weather_Cubit/get_weather_states.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/services/weatherService.dart';

class GetWetherCubit extends Cubit<GetWeatherStates> {
  GetWetherCubit() : super(WeatherInitialState());

   Weathermodel? weathermodel;
    MaterialColor primaryColor = Colors.lightBlue;

  getWeather({required String cityName}) async {
    try {
      weathermodel = await Weatherservice(Dio()).getWeather(cityName: cityName);

      emit(WeatherLoadedState(weathermodel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}


