import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/screens/cassava_disease_detection.dart';
import 'package:flutter_chat_app/screens/chat_screen.dart';

class CassavaDoctor extends StatelessWidget {
  const CassavaDoctor({super.key});

  static String id = "CassavaDoctor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "CassavaDoctor",
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: Container(
        color: kPrimaryColor.withOpacity(0.3),
        child: ListView(
          children: [
          headingCoverCassavaDoctor(context), 
          const SizedBox(height: 35),
          const Center(
            child: Text(
              "Hi Farmer !", 
            style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Pacifico'),
            ),
          ),
        const Center(
          child: Text(
              "Cassava disease expert on hand.", 
            style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold, fontFamily: 'Pacifico'),
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
                Navigator.pushNamed(context, CassavaDiseaseDetection.id);
              }, 
              child: const Text("Cassava Disease Detection",),
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
                Navigator.pushNamed(context, AgroChatScreen.id);
              }, 
              child: const Text("Consult AgroChat",),
              ),
          ),
          ],
          ),
      ),

    );
  }

  Widget headingCoverCassavaDoctor(context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageCassavaDoctorF), fit: BoxFit.cover)),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome to CassavaDoctor!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
