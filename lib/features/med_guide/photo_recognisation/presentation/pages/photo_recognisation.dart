import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med_guide/core/widgets/reusable_widgets.dart';
import 'package:med_guide/features/med_guide/search_medicine/presentation/widgets/appbar_widgets.dart';
import '../bloc/ocr_bloc.dart';
import '../bloc/ocr_event.dart';
import '../bloc/ocr_state.dart';

class PhotoRecognitionPage extends StatelessWidget {
  const PhotoRecognitionPage({super.key});

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      context.read<OCRBloc>().add(RecognizeTextEvent(File(picked.path)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: richText(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            eleButton(
              func: () => _pickImage(context),
              text: 'Pick Prescription Image',
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<OCRBloc, OCRState>(
                builder: (context, state) {
                  if (state is OCRLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is OCRSuccess) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Detected Text:\n${state.recognizedText}",style: TextStyle(fontSize: 20),),
                          const SizedBox(height: 16),

                          if (state.matchedMedicine != null) ...[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            const Text(
                                "📋 Medicine:  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    fontStyle: FontStyle.italic,
                                  color: Colors.pink
                                )),
                            const SizedBox(height: 15,),
                                Center(
                                  child: Text(
                                      "   ${state.matchedMedicine!.name} ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.blue
                                      )),
                                ),
                                const SizedBox(height: 15,),

                                const Text(
                                    "💊 Uses:",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  "${state.matchedMedicine!.uses}",
                                   style: const TextStyle(
                                     fontSize: 30,
                                       color: Colors.black,
                                       fontWeight: FontWeight.w500,
                                   ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            const Text(
                                "⚠️ Side Effects: ",
                                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  ),),
                            const SizedBox(height: 15,),
                            Text(
                                    state.matchedMedicine!.sideEffects,
                  style: const TextStyle(
fontSize: 30,
fontWeight: FontWeight.w500,
color: Colors.black
),
                            ),
                          ] else
                            const Text("No matching medicine found."),
                        ],
                      ),
                    );
                  } else if (state is OCRFailure) {
                    return Text(state.message, style: const TextStyle(color: Colors.red));
                  }
                  return const Text('Upload an image to recognize medicine.');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
 }