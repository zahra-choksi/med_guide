import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/entity/medicine.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;

  MedicineCard({required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  medicine.name,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 58,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink
                  )),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Uses: ',
                  style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),),
                  Text(
                     ' ${medicine.uses} ',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 20,),
                  const Text(
                    'Side Effects: ',
                    style: TextStyle(
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),),
                  Text(
                    ' ${medicine.sideEffects} ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
          
            ],
          ),
        ),
      ),
    );
  }
}
