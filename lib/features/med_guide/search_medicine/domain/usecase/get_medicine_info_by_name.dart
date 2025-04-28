

import '../../../../../core/entity/medicine.dart';
import '../repository/medicine_repository.dart';

class GetMedicineInfo {
  final MedicineRepository repository;
  GetMedicineInfo(this.repository);

  Medicine? call (String name) {
    return repository.getMedicineByName(name);
  }
}

