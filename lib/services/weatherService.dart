import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weatherModel.dart';

class Weatherservice {
  final String baseURL = 'https://api.weatherapi.com/v1';
  final String apiKey = 'd73d38d250ce4bb984d114134240809';

  final Dio dio;
  Weatherservice( this.dio);

  Future<Weathermodel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1');

      Weathermodel weathermodel = Weathermodel.fromJson(response.data);

      return weathermodel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'opps there was an error, try again';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('try later');
    }
  }
}
