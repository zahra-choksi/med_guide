import 'package:flutter/material.dart';
import 'package:med_guide/features/med_guide/auth/presentation/pages/auth_page.dart';
import 'package:med_guide/features/med_guide/auth/presentation/pages/sign_up_page.dart';
import 'package:med_guide/features/med_guide/photo_recognisation/presentation/pages/photo_recognisation.dart';


import '../widgets/appbar_widgets.dart';
import '../widgets/reusable_widgets.dart';
import 'medicine_pages.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: btn(context),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                  "Key Features",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50
              ),
              ),
            ),
              card(
                  text: "Photo Recognisation",
                  text1: "Simply take a photo of your medicine of prescription and get instant information",
                  icon: Icons.camera_alt,
                  color: Colors.blue,
                  func: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const PhotoRecognitionPage()));
                  }
              ),
            card(
                text: "Multiple Languages",
                text1: "Supports Hindi, Tamil , Bengali  and many others regional languages of india. ",
                icon: Icons.language_rounded,
                color: Colors.pink,
              func: (){}
            ),
            card(
                text: "Patient Safety",
                text1: "Ensures correct medication usuage with simple explanation of dosage and side effects.",
                icon: Icons.health_and_safety_rounded,
                color: Colors.blue,
              func:() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MedicinePage()));
              }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    "Don't Have An Account ??",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink
                  ),
                ),
                TextButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()));
                },
                    child: const Text(
                        "Sign Up",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),
                    ))
              ],
            )
            
          ],
        ),
      ),
    );
  }
}
