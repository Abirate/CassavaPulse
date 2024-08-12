import 'package:flutter/material.dart';
import 'package:flutter_chat_app/provider/weather_provider.dart';
import 'package:flutter_chat_app/screens/agro_news_articles.dart';
import 'package:flutter_chat_app/screens/agro_news_assistant.dart';
import 'package:flutter_chat_app/screens/agro_chat.dart';
import 'package:flutter_chat_app/screens/cassava_disease_detection.dart';
import 'package:flutter_chat_app/screens/cassava_doctor.dart';
import 'package:flutter_chat_app/screens/chat_screen.dart';
import 'package:flutter_chat_app/screens/video_farming_hub.dart';
import 'package:flutter_chat_app/screens/login_page.dart';
import 'package:flutter_chat_app/screens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chat_app/screens/start_page.dart';
import 'package:flutter_chat_app/screens/video_home_screen.dart';
import 'package:flutter_chat_app/screens/video_player_screen.dart';
import 'package:flutter_chat_app/screens/weather_conditions_screen.dart';
import 'package:flutter_chat_app/screens/weather_for_farming_expert.dart';
import 'package:flutter_chat_app/screens/weather_screen_no_data.dart';
import 'package:flutter_chat_app/screens/weather_search_screen.dart';
import 'package:flutter_chat_app/screens/weather_smart_cassava_care.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create:(context)
      {
        return WeatherProvider();
      },
      child: CassavaPulse()));
}

class CassavaPulse extends StatelessWidget {
  const CassavaPulse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        StartPage.id: (context) =>  StartPage(), 
        AgroChat.id: (context) =>  AgroChat(),
        AgroChatScreen.id: (context) =>  AgroChatScreen(),
        CassavaDoctor.id:(context) => CassavaDoctor(),
        CassavaDiseaseDetection.id: (context) =>  CassavaDiseaseDetection(),
        AgroNewsAssistant.id: (context) =>  AgroNewsAssistant(),
        AgroNewsArticles.id: (context) =>  AgroNewsArticles(),
        WeatherForFarmingExpert.id: (context) =>  WeatherForFarmingExpert(),
        WeatherConditions.id: (context) =>  WeatherConditions(),
        WeatherSmartCassavaCare.id: (context) =>  WeatherSmartCassavaCare(),
        WeatherSearchScreen.id :  (context) =>  WeatherSearchScreen(),
        WeatherNoDataScreen.id : (context) =>  WeatherNoDataScreen(),
        FarmingVideoHub.id:(context) => FarmingVideoHub(),
        VideoHomeScreen.id: (context) =>  VideoHomeScreen(),
        VideoPlayerScreen.id: (context) =>  VideoPlayerScreen(),

        
      },
      initialRoute: LoginPage.id,
    );
  }
}


