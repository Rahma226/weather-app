import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_Weather_Cubit/get_weather_states.dart';
import 'package:weather_app/cubits/get_Weather_Cubit/get_wether_cubit.dart';
import 'package:weather_app/views/searchView.dart';
import 'package:weather_app/widgets/NoWeather.dart';
import 'package:weather_app/widgets/WeatherInfo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
       backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(color: Colors.white, Icons.search),
          ),
        ],
      ),
      body: 
        BlocBuilder<GetWetherCubit, GetWeatherStates>(
            builder: (context, state) {
          if (state is WeatherInitialState){
            return  NoWeatherBody();
          }
          else if (state is WeatherLoadedState){
            return  Weatherinfo(
              weather: state.weathermodel,
            );
          }
          else{
            return  Text('OOPS! There was an error.');
          }
        })
    );
  }
}
