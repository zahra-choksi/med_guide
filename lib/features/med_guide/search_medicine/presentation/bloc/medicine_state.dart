import '../../../../../core/entity/medicine.dart';

class MedicineState {}

final class MedicineInitial extends MedicineState {}

final class MedicineLoading extends MedicineState {}

final class MedicineLoaded extends MedicineState {
  final Medicine medicine;
  MedicineLoaded(this.medicine);
}

final class MedicineFailure extends MedicineState {
  final String message;
  MedicineFailure(this.message);
}
