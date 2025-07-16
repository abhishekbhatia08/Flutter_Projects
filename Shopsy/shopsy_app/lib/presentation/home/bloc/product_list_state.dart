part of 'product_list_cubit.dart';

@freezed
class ProductListState with _$ProductListState {
  // Initial state before any action has been taken.
  const factory ProductListState.initial() = _Initial;
  // State when products are being loaded.
  const factory ProductListState.loading() = _Loading;
  // State when products have been successfully loaded.
  const factory ProductListState.loaded(List<Product> products) = _Loaded;
  // State when an error has occurred.
  const factory ProductListState.error(String message) = _Error;
}
