import 'package:dio/dio.dart';
import 'package:meragi/bloc/models/product_model.dart';
import 'package:meragi/bloc/repositories/api.dart';

class ProductRepo {
  API api = API();
  Future loadProducts() async {
    try {
      Response response = await api.sendRequest.get("products");
      List<dynamic> productMaps = response.data;
      return productMaps.map((e) => ProductModel.fromJson(e)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}
