import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up_app/data/bloc/user_state.dart';
import 'package:sign_up_app/data/model/user_model.dart';
import 'package:sign_up_app/data/repositories/user_repo.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial()) {
   getUser();
  }

  UserRepo userRepo = UserRepo();

  void getUser() async {
    try {
      UserModel userDetails =
          await userRepo.getUser();
      emit(UserLoaded(userDetails));
    } catch (ex) {
      emit(UserError(ex.toString()));
    }
  }
}