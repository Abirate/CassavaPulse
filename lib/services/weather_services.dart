import 'dart:convert';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/models/weather_model.dart';
import 'package:flutter_chat_app/util/config.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String baseUrl = baseUrlWeatherApi;
  String apiKey = weatherApiKey;

  Future<WeatherModel?> getWeather({required String? location}) async {
    try {
      final url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$location');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final weatherData = jsonDecode(response.body);
        return WeatherModel.fromJson(weatherData);
      } else {
        throw Exception('API error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle general errors and display user-friendly message
      // print('Error fetching weather data: $e');
      // Instead of throwing an exception, return null
      return null;
    }
  }
}





