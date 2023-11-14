import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:upsky/model/weather_model.dart';

class WeatherController {
  static const BASE_URL = "http://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherController(this.apiKey);

  Future<Weather> getWeather(String city) async {
    final response = await http
        .get(Uri.parse("$BASE_URL?q=$city&appid=$apiKey&units=metric"));

    if (response.statusCode == 200) {
      print("Weather Controller: ${response.body}");
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(" Failed to load data ");
    }
  }

  Future<String> getCurrentCity() async {
    // get user location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // convert location into list of placemarks
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // get city name from placemarks list
    String? city = placemarks[0].locality;
    print("This is my City: $city");
    return city ?? "City not found";
  }
}
