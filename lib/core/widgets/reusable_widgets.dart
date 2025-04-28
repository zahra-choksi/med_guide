import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget eleButton({
  required VoidCallback func,
  required String text,
}){
  return Container(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Colors.blue, Colors.purple, Colors.pink], // Customize your colors
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
      onPressed: func,
      child:  Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget gradient(){
  return Container(
      decoration: BoxDecoration(
      gradient: const LinearGradient(
      colors: [Colors.blue, Colors.purple, Colors.pink], // Customize your colors
  ),
  borderRadius: BorderRadius.circular(12),
  ));
}