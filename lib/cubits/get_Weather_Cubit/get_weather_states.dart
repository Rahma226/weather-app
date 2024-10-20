
import 'package:weather_app/models/weatherModel.dart';

class GetWeatherStates{}

class WeatherInitialState extends GetWeatherStates{}

class WeatherLoadedState extends GetWeatherStates{
  final Weathermodel weathermodel;
  WeatherLoadedState(this.weathermodel);
}

class WeatherFailureState extends GetWeatherStates{
  final String errMessage;
  WeatherFailureState(this.errMessage);
}
