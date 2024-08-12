

import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({super.key,this.onChanged, this.hintText});

  Function(String)? onChanged;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
              style: const TextStyle(color: Colors.white),
              validator:(data){
                if(data!.isEmpty){
                  return "Required";
                }
              } ,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText ,
                hintStyle:  TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                     width: 1.0
                     ),  
                ) ,

                //border general
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                     width: 1.0
                     ),  
                ),
              ),

            );
  }
}