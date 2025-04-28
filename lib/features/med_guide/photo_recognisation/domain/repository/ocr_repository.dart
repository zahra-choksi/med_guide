import 'dart:io';

import '../entity/recognized_text.dart';

abstract class OCRRepository {
  Future<RecognizedText> recognizeTextFromImage(File image);
}
