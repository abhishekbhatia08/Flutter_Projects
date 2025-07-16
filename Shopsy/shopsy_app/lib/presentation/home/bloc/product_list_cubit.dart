import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopsy_app/data/model/product_model.dart';
import 'package:shopsy_app/domain/repository/product_repo.dart';

part 'product_list_state.dart';
part 'product_list_cubit.freezed.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit() : super(const ProductListState.initial()) {
    fetchProducts();
  }

  final ProductRepository _productRepository = ProductRepository();

  Future<void> fetchProducts() async {
    try {
      emit(const ProductListState.loading());
      final products = await _productRepository.getProducts();
      emit(ProductListState.loaded(products));
    } catch (e) {
      emit(ProductListState.error('Failed to fetch products: ${e.toString()}'));
    }
  }
}
