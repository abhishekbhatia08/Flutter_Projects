import 'package:chefkart/bloc/models/dish_model.dart';

import 'api.provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<DishModel?> fetchDishList() {
    return _provider.fetchDishList();
  }
}
