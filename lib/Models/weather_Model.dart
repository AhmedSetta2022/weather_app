class weatherModel {
  String Date;
  double Temp;
  String weatherstate;
  weatherModel({
    required this.Date,
    required this.Temp,
    required this.weatherstate,
  });

  factory weatherModel.fromJson(Map<String, dynamic> jsonData) {
    return weatherModel(
      Date: jsonData['forecast']['forecastday'][0]['date'],
      Temp: jsonData['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherstate: jsonData['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }

  String getImage() {
    if (weatherstate == "Thunderstorm") {
      return 'assets/images/thunderstorm.png';
    } else if (weatherstate == "Clear" || weatherstate == "Light Cloud") {
      return 'assets/images/clear.png';
    } else if (weatherstate == "Snow" ||
        weatherstate == "Sleet" ||
        weatherstate == "Hail") {
      return 'assets/images/snow.png';
    } else if (weatherstate == "Heavy Cloud") {
      return 'assets/images/cloudy.png';
    } else if (weatherstate == "Heavy rain" ||
        weatherstate == "Patchy rain possible" ||
        weatherstate == "Showers") {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
