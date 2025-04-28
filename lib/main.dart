import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/med_guide/auth/domain/repository/auth_repository.dart';
import 'features/med_guide/auth/presentation/bloc/auth_bloc.dart';
import 'features/med_guide/photo_recognisation/data/datasource/ocr_data_source.dart';
import 'features/med_guide/photo_recognisation/data/repository/ocr_repository_impl.dart';
import 'features/med_guide/photo_recognisation/domain/usecase/recognized_text_image.dart';
import 'features/med_guide/photo_recognisation/presentation/bloc/ocr_bloc.dart';
import 'features/med_guide/search_medicine/data/datasources/medicine_local_data_source.dart';
import 'features/med_guide/search_medicine/presentation/bloc/medicine_bloc.dart';
import 'features/med_guide/search_medicine/presentation/pages/dashboard.dart';
import 'init_dependency.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   setupDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MedicineBloc(MedicineLocalDataSource())),
        BlocProvider(create: (_) => OCRBloc(RecognizeTextFromImage(OCRRepositoryImpl(OCRDataSource()),),),),
        BlocProvider(create: (_) => AuthBloc(getIt<AuthRepository>())),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedGuide',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const DashBoard(),

    );
  }
}
