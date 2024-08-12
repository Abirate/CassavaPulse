import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherProvider;
  bool dataFetched = false;

  void getWeatherData(WeatherModel weatherData) {
    weatherProvider = weatherData;
    dataFetched = true;
    notifyListeners();
  }
}
