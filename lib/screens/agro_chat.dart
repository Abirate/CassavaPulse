import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/screens/chat_screen.dart';

class AgroChat extends StatelessWidget {
  const AgroChat({super.key});

  static String id = "AgroChat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "AgroChat",
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: Container(
        color: kPrimaryColor.withOpacity(0.3),
        child: ListView(
          children: [
          headingCoverAgroChat(context), 
          const SizedBox(height: 35),
          const Center(
            child: Text(
              "Hi Farmer !", 
            style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Pacifico'),
            ),
          ),
        const Center(
          child: Text(
              "How can I help you today?", 
            style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Pacifico'),
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
                Navigator.pushNamed(context, AgroChatScreen.id);
              }, 
              child: const Text("Chat with AgroChat"),
              ),
          ),
        
            const SizedBox(height: 12),
          
          ],
          ),
      ),

    );
  }

  // Widget headingCoverAgroChat 
  Widget headingCoverAgroChat(context){
    return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height *0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(imageAgroChat),
              fit: BoxFit.cover)
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 260, left:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Welcome to AgroChat!", style: TextStyle(color:Colors.white,fontSize: 30,fontFamily: 'Pacifico' ,fontWeight: FontWeight.bold),),
                ],),
            ),
          ],
        );
  }


}
