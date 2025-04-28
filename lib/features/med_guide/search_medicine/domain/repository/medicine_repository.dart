
import '../../../../../core/entity/medicine.dart';

abstract class MedicineRepository {
  Medicine? getMedicineByName(String name);
}

