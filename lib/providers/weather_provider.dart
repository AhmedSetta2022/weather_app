import 'package:flutter/material.dart';
import 'package:weatherapp/Models/weather_Model.dart';

class weatherprovider extends ChangeNotifier {
  weatherModel? _weatherdata;
  String? cityName;
  set weatherData(weatherModel? weather) {
    _weatherdata = weather;
    notifyListeners();
  }

  weatherModel? get weatherdata => _weatherdata;
}
