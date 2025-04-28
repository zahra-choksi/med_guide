import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_guide/features/med_guide/photo_recognisation/presentation/pages/photo_recognisation.dart';

import '../../../../../core/app_user/app_user_cubit.dart';
import '../../../../../core/app_user/app_user_state.dart';
import '../pages/landing_page.dart';

Widget txtButton(String text) {
  return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black45),
      ));
}

Widget gradient(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.purple, Colors.pink], // Two colors to mix
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Centered Image
          SizedBox(
            child: Image.asset(
              'assets/images/med.jpg', // Replace with your image asset
              fit: BoxFit.contain,
            ),
          ),
          const Text(
            'Understand Your Medicine In Your Language ',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'MedGuide helps patients understand prescriptions,dosage and side effects in their local language . just snap a photo or type the medicine name!!... ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LandingPage()));

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              // Blue background color
              foregroundColor: Colors.white,
              // Text color
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21), // Rounded corners
              ),
              elevation: 5, // Button shadow
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}

Widget card(
    {
      required String text,
    required String text1,
    required IconData icon,
    required Color color,
  required VoidCallback func,
    }) {
  return InkWell(
    onTap: func,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: SizedBox(
        width: 300,
        height: 300, // Square dimensions
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
    
              children: [
                Icon(icon, color: color, size: 40),
                const SizedBox(height: 10),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Text(
                    text1,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                                 ),
                 )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget gradientBtn(){
  return Container(
      decoration: const BoxDecoration(
      gradient: LinearGradient(
      colors: [Colors.blue, Colors.purple, Colors.pink], // Two colors to mix
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
  ),
      )
  );
}
