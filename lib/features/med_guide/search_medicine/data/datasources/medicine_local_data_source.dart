import '../../../../../core/model/medicine_info.dart';
import 'medicine_local_data_source.dart';
import '../../../../../core/entity/medicine.dart';

class MedicineLocalDataSource {
  Medicine? getMedicineByName(String name) {
    return medicines.firstWhere(
          (med) => med.name.toLowerCase() == name.toLowerCase(),
      orElse: () => Medicine(name: name, uses: 'Not Found', sideEffects: ''),
    );
  }
}