import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:flutter/material.dart';

InputDecoration customInputDecoration(String hintText){
  return InputDecoration(
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: subtitleAndFormTextStyles,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(
            color: customTopaze,
            width: 2
        ),

      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(
            color: customTopaze,
            width: 2
        ),
      ),


     border: OutlineInputBorder(
       borderRadius: BorderRadius.circular(4.0),
       borderSide: BorderSide(
          color: customTopaze,
          width: 2
       ),
    ),

  );
}