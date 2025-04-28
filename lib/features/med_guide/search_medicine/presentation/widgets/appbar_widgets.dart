import 'package:flutter/material.dart';

import '../../../auth/presentation/pages/sign_in.dart';
import '../../../auth/presentation/pages/sign_up_page.dart';


AppBar richText() {
  return AppBar(
      title: reusableTitle());
}

AppBar btn(BuildContext context){

  return AppBar(
     title:  reusableTitle(),
     actions: [
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20.0),
         child: ElevatedButton(
           onPressed: () {
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) => const SignInPage()));
           },
           style: ElevatedButton.styleFrom(
             backgroundColor: Colors.transparent, // Transparent background
             foregroundColor: Colors.black, // Text color
             elevation: 0, // No shadow
             shape: const StadiumBorder(), // Rounded shape
             side: const BorderSide(color: Colors.blue, width: 2), // Blue border
           ),
           child: const Text(
               "Sign In",
             style: TextStyle(
               fontWeight: FontWeight.w500,
               fontSize: 20
             ),
           ),
         ),
       ),

     ],

  );

}

Widget reusableTitle(){
  return RichText(
      text: const TextSpan(
          text: "Med",
          style: TextStyle(
              fontSize: 35,
              color: Colors.blue,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: 'Guide',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.pinkAccent
                )),
          ]));
}


