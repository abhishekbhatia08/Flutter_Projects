part of 'cart_cubit.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItem> items,
}) = _CartState;

  // A private constructor allows us to add custom methods and getters.
  const CartState._();

  // Custom getter to calculate the total price of all items in the cart.
  double get totalPrice => items.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  // Custom getter to calculate the total number of individual items in the cart.
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
}
