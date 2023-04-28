import 'package:sign_up_app/data/model/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final UserModel userDetails;
  UserLoaded(this.userDetails);
}

class UserError extends UserState {
  final String error;
  UserError(this.error);
}