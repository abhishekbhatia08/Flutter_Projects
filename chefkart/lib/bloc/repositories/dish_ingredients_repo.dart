import 'dart:convert';

import 'package:chefkart/bloc/models/dish_ingredients_model.dart';
import 'package:chefkart/bloc/repositories/api.dart';
import 'package:dio/dio.dart';

class DishIngredientsRepo {
  API api = API();
  Future dishIngredients() async {
    try {
      Response response = await api.sendRequest.get("1");
      // Map<String, dynamic> dishIngredientsDataMaps = response.data;
      // DishIngredientsModel dishIngredientsModel = DishIngredientsModel.fromJson(response.data);
      return DishIngredientsModel.fromJson(json.decode(response.data));
    } catch (ex) {
      rethrow;
    }
  }
}
