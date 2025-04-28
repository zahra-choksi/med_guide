
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/user.dart';
import 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser (User? user){
    if(user == null){
      emit(AppUserInitial());
    }
    else {
      emit(AppUserLogIn(user));
    }
  }
}