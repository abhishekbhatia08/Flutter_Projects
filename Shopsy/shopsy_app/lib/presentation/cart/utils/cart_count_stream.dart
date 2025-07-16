import 'dart:async';

class CartStreamService {
  static final CartStreamService _instance = CartStreamService._internal();
  factory CartStreamService() => _instance;
  CartStreamService._internal();

  final _totalItemsCount = StreamController<int>.broadcast();

  Stream<int> get itemsCountStream => _totalItemsCount.stream;

  void updateUnreadCount(int newCount) {
    _totalItemsCount.add(newCount);
  }

  void dispose() {
    _totalItemsCount.close();
  }
}
