import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:upsky/controller/weather_controller.dart';

import '../model/weather_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _weatherService = WeatherController('45fef60cbcf3868583e78327fa627fad');
  Weather? _weather;

  Future<void> _fetchWeather() async {
    String city = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(city);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? condition) {
    if (condition == null) return "assets/sunny.json";

    switch (condition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/clouds.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return "assets/rain.json";
      case 'thunderstorm':
        return "assets/thunders";
      case "clear":
        return "assets/sunny.json";
      default:
        return "assets/sunny.json";
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text("HomePage"),
            Text(_weather?.city ?? "Loading City"),
            // Lottie.asset("assets/clouds.json"),
            Lottie.asset(getWeatherAnimation(_weather?.condition)),
            Text("${_weather?.temperature.round()} °C"),
            Text("${_weather?.condition}")
          ],
        ),
      ),
    );
  }
}
