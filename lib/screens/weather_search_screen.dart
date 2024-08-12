import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/provider/weather_provider.dart';
import 'package:flutter_chat_app/services/weather_services.dart';
import 'package:provider/provider.dart';

class WeatherSearchScreen extends StatelessWidget {
  WeatherSearchScreen({super.key});

  static String id = "WeatherSearchScreen";
  String? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Search for Weather Conditions',
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            children: [
              TextField(
                onChanged: (data) {
                  location = data;
                },
                onSubmitted: (data) async {
                  location = data;
                  ApiServices services = ApiServices();
                  final weatherData =
                      await services.getWeather(location: location);

                  // Handle potential errors
                  if (weatherData != null) {
                    Provider.of<WeatherProvider>(context, listen: false)
                        .getWeatherData(weatherData);
                    Navigator.pop(context);
                  } else {
                    // Show a snackbar for invalid city
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('City not found. Please try again.'),
                      ),
                    );
                  }
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Enter the nearest city to your farm",
                  labelText: "search",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                animationBeaut,
                height: 200,
                fit: BoxFit.fill,
              )
            ],
          ),
        ),
      ),
    );
  }
}
