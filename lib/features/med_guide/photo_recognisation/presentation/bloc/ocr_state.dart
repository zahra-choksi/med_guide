import 'package:equatable/equatable.dart';
import '../../../../../core/entity/medicine.dart';

abstract class OCRState extends Equatable {
  const OCRState();
}

class OCRInitial extends OCRState {
  @override
  List<Object?> get props => [];
}

class OCRLoading extends OCRState {
  @override
  List<Object?> get props => [];
}

class OCRSuccess extends OCRState {
  final String recognizedText;
  final Medicine? matchedMedicine;

  const OCRSuccess(this.recognizedText, this.matchedMedicine);

  @override
  List<Object?> get props => [recognizedText, matchedMedicine ?? ''];
}

class OCRFailure extends OCRState {
  final String message;

  const OCRFailure(this.message);

  @override
  List<Object?> get props => [message];
}
