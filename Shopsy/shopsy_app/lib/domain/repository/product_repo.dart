import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shopsy_app/data/model/product_model.dart';

class ProductRepository {
  Future<List<Product>> getProducts() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = json.decode(response);
    return data.map((item) => Product.fromJson(item)).toList();
  }
}