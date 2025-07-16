import 'package:get_storage/get_storage.dart';
import 'package:shopsy_app/data/model/cart_item_model.dart';

class StorageService {
  StorageService._privateConstructor();

  static final _box = GetStorage();

  /// Cart
  static Future<void> setCart(List<CartItem> cart) async {
    final cartData = cart.map((item) => item.toJson()).toList();
    await _box.write(StorageKeys.CART, cartData);
  }

  static List<CartItem> getCart() {
    final rawData = _box.read(StorageKeys.CART);
    if (rawData == null || rawData is! List) return [];

    return rawData
        .map((item) => CartItem.fromJson(Map<String, dynamic>.from(item)))
        .toList();
  }

  static Future<void> clearCart() => _box.remove(StorageKeys.CART);

  static Future<void> clearDatabase() => _box.erase();
}

class StorageKeys {
  StorageKeys._privateConstructor();

  static const CART = 'CART';
}
