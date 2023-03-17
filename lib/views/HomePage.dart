import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/weather_provider.dart';

import 'package:weatherapp/views/searchPage.dart';

import '../Models/weather_Model.dart';

import '../widgets/customdefultbody.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherdata = Provider.of<weatherprovider>(context).weatherdata;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(
                Icons.search,
                size: 28,
              ))
        ],
      ),
      body: weatherdata == null
          ? const DefultBody()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    Provider.of<weatherprovider>(context).cityName!,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(" ${weatherdata!.Date}",
                      style: const TextStyle(
                        fontSize: 18,
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    weatherdata!.getImage(),
                    width: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${weatherdata!.Temp.toInt()}",
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    weatherdata!.weatherstate,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
            ),
    );
  }
}
