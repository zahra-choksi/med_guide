import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class OCREvent extends Equatable {
  const OCREvent();
}

class RecognizeTextEvent extends OCREvent {
  final File image;

  const RecognizeTextEvent(this.image);

  @override
  List<Object?> get props => [image];
}
