import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/models/weatherModel.dart';

class Weatherservice {
  final String baseURL = 'https://api.weatherapi.com/v1';

  final Dio dio;
  Weatherservice( this.dio);

  Future<Weathermodel> getWeather({required String cityName}) async {
    try {
      String apiKey = dotenv.env['API_KEY']!;
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
