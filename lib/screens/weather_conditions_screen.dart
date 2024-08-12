import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/provider/weather_provider.dart';
import 'package:flutter_chat_app/screens/weather_screen_no_data.dart';
import 'package:flutter_chat_app/screens/weather_search_screen.dart';
import 'package:provider/provider.dart';

class WeatherConditions extends StatelessWidget {
   WeatherConditions({super.key});

  static String id = "WeatherConditionsScreen";
  String? location;

  @override
  Widget build(BuildContext context) {
    var weatherData =
        Provider.of<WeatherProvider>(context, listen: true).weatherProvider;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Search , Go to ====> ',
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, WeatherSearchScreen.id);
            },
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: weatherData == null
          ? const WeatherNoDataScreen()
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.network(
                        "https:${weatherData.icon}",
                        fit: BoxFit.contain,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "${weatherData.temp} °C",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 36),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${weatherData.name}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Weather Conditions',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Card(
                          color:Colors.white ,
                          elevation: 0,
                          child: Column(
                            children: [
                              Text(
                                "${weatherData.windSpeed} (km/h)",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
                              ),
                              Image.asset(windSpeedIcon, height: 30,
                                width: 30,),
                              const Text(
                                "Wind Speed",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Card(
                          color:Colors.white ,
                          elevation: 0,
                          child: Column(
                            children: [
                              Text(
                                "${weatherData.pressure} (inHg)",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
                              ),
                              Image.asset(pressureIcon, height: 30,
                                width: 30,),
                              const Text(
                                "Pressure",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ),
                  const SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Card(
                          color:Colors.white ,
                          elevation: 0,
                          child: Column(
                            children: [
                              Text(
                                "${weatherData.humidity} %",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
                              ),
                              Image.asset(humidityIcon, height: 30,
                                width: 30,),
                              const Text(
                                "Humidity",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Card(
                          color:Colors.white ,
                          elevation: 0,
                          child: Column(
                            children: [
                              Text(
                                "${weatherData.maxTemp} °C",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
                              ),
                              Image.asset(maxTempIcon, height: 30,
                                width: 30,),
                              const Text(
                                "Max temp",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ),

                ],
              ),
            
    ));
  }
}
