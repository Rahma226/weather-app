import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_Weather_Cubit/get_weather_states.dart';
import 'package:weather_app/cubits/get_Weather_Cubit/get_wether_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWetherCubit, GetWeatherStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text(
              'Search a city',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Colors.white), // Custom back icon
              onPressed: () {
                Navigator.pop(context); 
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: TextField(
                cursorColor: Colors.white,
                onSubmitted: (value) async {
                  var getWeatherCubit =
                      BlocProvider.of<GetWetherCubit>(context);
                  getWeatherCubit.getWeather(cityName: value);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  labelText: 'Search',
                  labelStyle: const TextStyle(color: Colors.white),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Enter city name',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
