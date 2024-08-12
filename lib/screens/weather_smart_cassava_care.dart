import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/models/weather_model.dart';
import 'package:flutter_chat_app/provider/weather_provider.dart';
import 'package:flutter_chat_app/util/config.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:provider/provider.dart';

// I can access the weather data from here (after fetching them by forcing the user to do it)
// in the WeatherForFarmingExpert.dart (press first on "Weather Update")
// final weatherData =Provider.of<WeatherProvider>(context, listen: false).weatherProvider;

class WeatherSmartCassavaCare extends StatefulWidget {
  const WeatherSmartCassavaCare({super.key});

  static String id = "WeatherSmartCassavaCareScreen";

  @override
  State<WeatherSmartCassavaCare> createState() =>
      _WeatherSmartCassavaCareState();
}

class _WeatherSmartCassavaCareState extends State<WeatherSmartCassavaCare> {
  String? advice;
  bool isLoading = false;

  Future<void> getAdvice() async {
    setState(() {
      isLoading = true; // Set to true before the API call
    });
    final weatherData =
        Provider.of<WeatherProvider>(context, listen: false).weatherProvider!;
    final adviceText = await getWeatherCassavaGeminiAdvice(weatherData);
    setState(() {
      advice = adviceText;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Cassava Weather-Tailored Tips",
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 53, 233, 59).withOpacity(0.5),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                textStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )
              ),  
              onPressed: getAdvice,
              child: const Text('Get Cassava Weather-Wise Advice',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
          child: Container(
            decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(16),
            child: ListView(
        children: [
          if (isLoading) const Center(child: CircularProgressIndicator())
          else if (advice != null)
            MarkdownBody(
              data: advice!,
              selectable: true,
            )
          else
          const Text('Tap on the button for Tailored Casava Care !',
          style: TextStyle(fontFamily: 'Pacifico', fontSize: 20, fontWeight: FontWeight.bold)),
        ],
            ),
          ),
        ),
        
            //isLoading ? const CircularProgressIndicator() : (advice != null ? Text(advice!) : const Text('No advice available')),
          ],
        ),
      ),
    );
  }
}

Future<String?> getWeatherCassavaGeminiAdvice(WeatherModel weatherData) async {
  final model = GenerativeModel(model: geminiModel, apiKey: apiKey);
  final systemPrompt =
      '$weatherCassavaSystemPrompt temperature ${weatherData.temp}°C, humidity ${weatherData.humidity}%, pressure ${weatherData.pressure} inHg, wind speed ${weatherData.windSpeed} km/h.';
  final response = await model.generateContent([Content.text(systemPrompt)]);
  return response.text;
}
