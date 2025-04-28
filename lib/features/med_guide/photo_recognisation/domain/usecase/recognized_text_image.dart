
import 'dart:io';
import '../entity/recognized_text.dart';
import '../repository/ocr_repository.dart';

class RecognizeTextFromImage {
  final OCRRepository repository;

  RecognizeTextFromImage(this.repository);

  Future<RecognizedText> call(File image) {
    return repository.recognizeTextFromImage(image);
  }
}
