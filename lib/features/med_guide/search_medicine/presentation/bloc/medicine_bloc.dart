
import '../../data/datasources/medicine_local_data_source.dart';
import 'medicine_event.dart';
import 'medicine_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final MedicineLocalDataSource dataSource;

  MedicineBloc(this.dataSource) : super(MedicineInitial()) {
    on<FetchMedicine>((event, emit) {
      emit(MedicineLoading());
      try {
        final medicine = dataSource.getMedicineByName(event.name);
        emit(MedicineLoaded(medicine!));
      } catch (e) {
        emit(MedicineFailure('Medicine not found'));
      }
    });
  }
  }