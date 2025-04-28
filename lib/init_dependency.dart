import 'package:get_it/get_it.dart';

import 'features/med_guide/auth/data/auth_data_repository_impl.dart';
import 'features/med_guide/auth/domain/repository/auth_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}

