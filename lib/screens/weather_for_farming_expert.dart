import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/provider/weather_provider.dart';
import 'package:flutter_chat_app/screens/weather_conditions_screen.dart';
import 'package:flutter_chat_app/screens/weather_smart_cassava_care.dart';
import 'package:provider/provider.dart';

class WeatherForFarmingExpert extends StatelessWidget {
  const WeatherForFarmingExpert({super.key});

  static String id = "WeatherForfarmingExpert";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "WeatherForFarmingExpert",
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: Container(
        color: kPrimaryColor.withOpacity(0.3),
        child: ListView(
          children: [
          headingCoverWeather(context), 
          const SizedBox(height: 35),
          const Center(
            child: Text(
              "Hi Farmer !", 
            style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Pacifico'),
            ),
          ),
        const Center(
          child: Text(
              "Let's weatherproof your farm plan!", 
            style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold, fontFamily: 'Pacifico'),
            ),
        ),
        
          const SizedBox(height: 40),
        SizedBox(
            height:50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 53, 233, 59).withOpacity(0.5),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              ),  
              onPressed: () {
                Navigator.pushNamed(context, WeatherConditions.id);
              }, 
              child: const Text("Weather Update"),
              ),
          ),
        
            const SizedBox(height: 12),
          SizedBox(
            height:50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 53, 233, 59).withOpacity(0.5),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              ),  
              onPressed: () { 
                final weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
                if (weatherProvider.dataFetched) {
                  Navigator.pushNamed(context, WeatherSmartCassavaCare.id);
                } else {
                  // Display a message within this snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please Press On 'Weather Update' first to get weather data."),
                    ),
                  );
                }
              },
              child: const Text("Cassava Weather-Tailored Tips",),
              ),
          ),
          ],
          ),
      ),
    );
  }


  Widget headingCoverWeather(context){
    return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height *0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(imageWeatherForFarming),
              fit: BoxFit.cover)
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 200, left:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Weather-Wise Cassava Cultivation!", style: TextStyle(color:Colors.white,fontSize: 30,fontFamily: 'Pacifico' ,fontWeight: FontWeight.bold),),
                ],),
            ),
          ],
        );
  }
}
