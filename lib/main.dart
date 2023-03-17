import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Models/weather_Model.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/views/HomePage.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  weatherModel? weathermodel;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => weatherprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: HomePage(),
      ),
    );
  }
}
