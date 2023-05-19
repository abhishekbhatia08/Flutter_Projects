import 'dart:convert';

import 'package:chefkart/bloc/models/dish_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      'https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/';

  Future<DishModel?> fetchDishList() async {
    try {
      Response response = await _dio.get(_url);
      return DishModel.fromJson(json.decode(response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
    }
  }
}
