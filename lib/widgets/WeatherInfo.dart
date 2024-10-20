import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_Weather_Cubit/get_wether_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weatherModel.dart';

class Weatherinfo extends StatelessWidget {
  const Weatherinfo({super.key, required this.weather , });
   final Weathermodel weather;


  @override
  Widget build(BuildContext context) {
   Weathermodel weatherModel= BlocProvider.of<GetWetherCubit>(context).weathermodel!;
    return Container(
      decoration:  BoxDecoration(
          gradient: LinearGradient(
              colors: [
                getThemeColor(weatherModel.weatherCondition),
                getThemeColor(weatherModel.weatherCondition)[300]!,
                getThemeColor(weatherModel.weatherCondition)[50]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                weatherModel.cityName,
                style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
               Text(
                'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style:const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https:${weatherModel.image}"
                  ),
                   Text(
                    weatherModel.temp.toString(),
                    style:const TextStyle(
                    fontWeight: FontWeight.bold,
                     fontSize: 32),
                  ),
                   Column(
                    children: [
                      Text(
                        'MaxTemp: ${weatherModel.maxTemp.round()}',
                        style:const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'MinTemp: ${weatherModel.minTemp.round()}',
                        style:const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
               Text(
                weatherModel.weatherCondition,
                style:const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

