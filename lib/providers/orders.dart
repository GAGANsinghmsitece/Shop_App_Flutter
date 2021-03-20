import 'package:flutter/foundation.dart';

import '../models/cartitem.dart';
import '../models/order_item.dart';

class Orders with ChangeNotifier {
  List<OrderItem> _products = [];

  List<OrderItem> get products {
    return [..._products];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _products.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            products: cartProducts,
            amount: total,
            timeStamp: DateTime.now()));
    notifyListeners();
  }
}
