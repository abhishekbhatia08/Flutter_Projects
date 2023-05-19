import 'package:chefkart/bloc/cubit/dish_ingredients_state.dart';
import 'package:chefkart/bloc/models/dish_ingredients_model.dart';
import 'package:chefkart/bloc/repositories/dish_ingredients_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishIngredientsCubit extends Cubit<DishIngredientsState> {
  DishIngredientsCubit() : super(DishIngredientsInitial()) {
    dishIngredients();
  }

  DishIngredientsRepo dishIngredientsRepo = DishIngredientsRepo();

  void dishIngredients() async {
    try {
      DishIngredientsModel dishIngredientsDetails =
          await dishIngredientsRepo.dishIngredients();
      emit(DishIngredientsLoaded(dishIngredientsDetails));
    } catch (ex) {
      emit(DishIngredientsError(ex.toString()));
    }
  }
}
