import 'package:chefkart/bloc/models/dish_model.dart';

abstract class DishState {}

class DishInitial extends DishState {}

class DishLoaded extends DishState {
  final DishModel dishDetails;
  DishLoaded(this.dishDetails);
}

class DishError extends DishState {
  final String error;
  DishError(this.error);
}
