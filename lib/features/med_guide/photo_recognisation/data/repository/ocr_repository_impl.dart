
import 'dart:io';

import '../../domain/entity/recognized_text.dart';
import '../../domain/repository/ocr_repository.dart';
import '../datasource/ocr_data_source.dart';

class OCRRepositoryImpl implements OCRRepository {
  final OCRDataSource dataSource;

  OCRRepositoryImpl(this.dataSource);

  @override
  Future<RecognizedText> recognizeTextFromImage(File image) async {
    final text = await dataSource.recognizeText(image);
    return RecognizedText(text);
  }
}
