import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meragi/bloc/cubit/product_state.dart';
import 'package:meragi/bloc/models/product_model.dart';
import 'package:meragi/bloc/repositories/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial()) {
    loadProducts();
  }

  ProductRepo productRepo = ProductRepo();

  void loadProducts() async {
    try {
      List<ProductModel> productDetails = await productRepo.loadProducts();
      emit(ProductLoaded(productDetails));
    } catch (ex) {
      emit(ProductError(ex.toString()));
    }
  }
}
