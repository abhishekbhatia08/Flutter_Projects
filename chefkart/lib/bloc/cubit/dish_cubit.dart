import 'package:chefkart/bloc/cubit/dish_state.dart';
import 'package:chefkart/bloc/models/dish_model.dart';
import 'package:chefkart/bloc/repositories/dish_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishCubit extends Cubit<DishState> {
  DishCubit() : super(DishInitial()) {
    dishAtHome();
  }

  DishRepo dishRepo = DishRepo();

  void dishAtHome() async {
    try {
      DishModel dishDetails = await dishRepo.dishAtHome();
      emit(DishLoaded(dishDetails));
    } catch (ex) {
      emit(DishError(ex.toString()));
    }
  }
}
