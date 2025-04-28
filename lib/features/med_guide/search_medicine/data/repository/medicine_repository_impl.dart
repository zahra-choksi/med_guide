

import '../../../../../core/entity/medicine.dart';
import '../../domain/repository/medicine_repository.dart';
import '../datasources/medicine_local_data_source.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final MedicineLocalDataSource localDataSource;
  MedicineRepositoryImpl(this.localDataSource);

  @override
  Medicine? getMedicineByName(String name) {
    return localDataSource.getMedicineByName(name);
  }

}