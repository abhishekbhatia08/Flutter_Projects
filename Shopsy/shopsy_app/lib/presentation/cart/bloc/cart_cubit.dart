import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopsy_app/data/model/cart_item_model.dart';
import 'package:shopsy_app/data/model/product_model.dart';
import 'package:shopsy_app/presentation/cart/utils/cart_count_stream.dart';
import 'package:shopsy_app/service/storage_service.dart';
import 'package:shopsy_app/utils/app_snackbar.dart';

part 'cart_state.dart';

part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState()) {
    loadCart();
  }

  void loadCart() {
    final items = StorageService.getCart();
    emit(CartState(items: items));
    CartStreamService().updateItemsCount(items.length);
  }

  Future<void> _saveCart(List<CartItem> items) async {
    await StorageService.setCart(items);
  }

  void addItem(Product product) {
    AppSnackBar.showSnackBar(message: '${product.name} added to cart!');

    final List<CartItem> updatedItems = List.from(state.items);
    final index = updatedItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (index != -1) {
      final oldItem = updatedItems[index];
      // Use copyWith for an immutable update
      updatedItems[index] = oldItem.copyWith(quantity: oldItem.quantity + 1);
    } else {
      updatedItems.add(CartItem(product: product));
    }

    emit(CartState(items: updatedItems));
    CartStreamService().updateItemsCount(updatedItems.length);
    _saveCart(updatedItems);
  }

  void removeItem(CartItem cartItem) {
    AppSnackBar.showSnackBar(
      message: '${cartItem.product.name} removed from cart!',
    );

    final List<CartItem> updatedItems = List.from(state.items);
    updatedItems.removeWhere((item) => item.product.id == cartItem.product.id);

    emit(CartState(items: updatedItems));
    CartStreamService().updateItemsCount(updatedItems.length);
    _saveCart(updatedItems);
  }

  void increaseQuantity(CartItem cartItem) {
    final updatedItems = List<CartItem>.from(state.items);
    final index = updatedItems.indexWhere(
      (item) => item.product.id == cartItem.product.id,
    );

    if (index != -1) {
      updatedItems[index] = cartItem.copyWith(quantity: cartItem.quantity + 1);
      emit(CartState(items: updatedItems));
      _saveCart(updatedItems);
    }
  }

  void decreaseQuantity(CartItem cartItem) {
    final updatedItems = List<CartItem>.from(state.items);
    final index = updatedItems.indexWhere(
          (item) => item.product.id == cartItem.product.id,
    );

    if (index != -1) {
      final newQuantity = cartItem.quantity - 1;
      if (newQuantity <= 0) {
        updatedItems.removeAt(index);
      } else {
        updatedItems[index] = cartItem.copyWith(quantity: newQuantity);
      }

      emit(CartState(items: updatedItems));
      CartStreamService().updateItemsCount(updatedItems.length);
      _saveCart(updatedItems);
    }
  }
}
