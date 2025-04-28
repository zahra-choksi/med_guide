import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/medicine_matcher.dart';
import '../../domain/usecase/recognized_text_image.dart';
import 'ocr_event.dart';
import 'ocr_state.dart';


class OCRBloc extends Bloc<OCREvent, OCRState> {
  final RecognizeTextFromImage recognizeTextFromImage;

  OCRBloc(this.recognizeTextFromImage) : super(OCRInitial()) {
    on<RecognizeTextEvent>((event, emit) async {
      emit(OCRLoading());
      try {
        final result = await recognizeTextFromImage(event.image);
        final medicine = findMedicineFromText(result.text);
        emit(OCRSuccess(result.text, medicine));
      } catch (e) {
        emit(OCRFailure('Failed to recognize text: $e'));
      }
    });
  }
}
