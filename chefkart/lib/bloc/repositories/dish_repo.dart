import 'dart:convert';

import 'package:chefkart/bloc/models/dish_model.dart';
import 'package:chefkart/bloc/repositories/api.dart';
import 'package:dio/dio.dart';

class DishRepo {
  API api = API();
  Future dishAtHome() async {
    try {
      Response response = await api.sendRequest.get("");
      // Map<String, dynamic> dishDataMaps = response.data;
      // DishModel dishModel = DishModel.fromJson(response.data);
      return DishModel.fromJson(json.decode(response.data));
    } catch (ex) {
      rethrow;
    }
  }
}
