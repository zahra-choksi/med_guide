import 'package:flutter/material.dart';

import 'package:med_guide/features/med_guide/photo_recognisation/presentation/pages/photo_recognisation.dart';


import '../../../search_medicine/presentation/pages/medicine_pages.dart';
import '../../../search_medicine/presentation/widgets/appbar_widgets.dart';
import '../../../search_medicine/presentation/widgets/reusable_widgets.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  reusableTitle(),
      ) ,
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


          ],
        ),
      ),
    );
  }
}
