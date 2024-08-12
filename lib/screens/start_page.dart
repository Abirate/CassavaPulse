import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/screens/agro_news_assistant.dart';
import 'package:flutter_chat_app/screens/agro_chat.dart';
import 'package:flutter_chat_app/screens/cassava_doctor.dart';
import 'package:flutter_chat_app/screens/video_farming_hub.dart';
import 'package:flutter_chat_app/screens/weather_for_farming_expert.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  static String id = "StartPage";

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int page = 0;
  GlobalKey cassavakey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      AgroChat(),
      CassavaDoctor(),
      AgroNewsAssistant(),
      WeatherForFarmingExpert(),
      FarmingVideoHub(),
    ];

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: cassavakey,
        index: 0,
        items: const [
          Icon(Icons.chat, color: Colors.white, size: 20,),
          Icon(Icons.medical_services, color: Colors.white, size: 20,),
          Icon(Icons.newspaper, color: Colors.white, size: 20,),
          Icon(Icons.sunny, color: Colors.white, size: 20,),
          Icon(Icons.tv, color: Colors.white, size: 20,),

        ],
        color: kPrimaryColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        onTap: (index){
          setState(() {
            page = index;
          });
        },

      ),
      body: screens[page],

    );
  }
}