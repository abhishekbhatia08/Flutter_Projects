
import 'package:meragi/bloc/models/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> productDetails;
  ProductLoaded(this.productDetails);
}

class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}
