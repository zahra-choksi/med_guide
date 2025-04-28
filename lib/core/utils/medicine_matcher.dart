import '../entity/medicine.dart';
import '../model/medicine_info.dart';


Medicine? findMedicineFromText(String text) {
  for (var med in medicines) {
    if (text.toLowerCase().contains(med.name.toLowerCase())) {
      return med;
    }
  }
  return null;
}
