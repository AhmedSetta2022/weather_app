import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/weather_Model.dart';

class WeatherService {
  String apikey = "36358ce7a96d4ade8da20413230803";
  String baseUrl = "http://api.weatherapi.com/v1";
  Future<weatherModel> getweather({required String cityName}) async {
    String Url = "$baseUrl/forecast.json?key=$apikey&q=$cityName&days=10";
    http.Response response = await http.get(Uri.parse(Url));
    Map<String, dynamic> data = jsonDecode(response.body);

    weatherModel weather = weatherModel.fromJson(data);
    return weather;
  }
}
