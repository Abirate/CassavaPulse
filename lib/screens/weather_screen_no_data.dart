import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';

class WeatherNoDataScreen extends StatelessWidget {
  const WeatherNoDataScreen({super.key});

  static String id = "WeatherNoDataScreen";

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
        Image.asset(animationSamallOne,height: 250,width: 250,fit: BoxFit.fill,),
        const Text('Searching 🔍',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
      ]),
      ),
    );

  }
}
