import 'package:chefkart/bloc/models/dish_ingredients_model.dart';

abstract class DishIngredientsState {}

class DishIngredientsInitial extends DishIngredientsState {}

class DishIngredientsLoaded extends DishIngredientsState {
  final DishIngredientsModel ingredientsDetails;
  DishIngredientsLoaded(this.ingredientsDetails);
}

class DishIngredientsError extends DishIngredientsState {
  final String error;
  DishIngredientsError(this.error);
}
