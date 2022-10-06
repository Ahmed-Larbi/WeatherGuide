import 'dart:convert';

import "package:http/http.dart" as http;
import "package:weatherapp/models/weathermodel.dart";

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=d7c9240ce3db4112b56140952220610&q=${location}&aqi=no");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
