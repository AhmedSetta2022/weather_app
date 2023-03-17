import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weatherapp/Models/weather_Model.dart';
import 'package:weatherapp/Services/weatherservices.dart';
import 'package:weatherapp/providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a City",
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onSubmitted: (value) async {
            cityName = value;
            WeatherService weatherService = WeatherService();
            weatherModel weather =
                await weatherService.getweather(cityName: cityName!);
            Provider.of<weatherprovider>(context, listen: false).weatherData =
                weather;
            Provider.of<weatherprovider>(context, listen: false).cityName =
                cityName;
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 27),
            labelText: "Search a City",
            labelStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            suffixIcon: const Icon(
              Icons.search,
              size: 28,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade50),
                borderRadius: const BorderRadius.all(
                  Radius.circular(14),
                )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade50),
                borderRadius: const BorderRadius.all(
                  Radius.circular(14),
                )),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade50),
                borderRadius: const BorderRadius.all(
                  Radius.circular(14),
                )),
          ),
        ),
      )),
    );
  }
}
