import 'package:myshop/models/product.dart';

import 'package:flutter/foundation.dart';
import '../../models/product.dart';
import '../../models/cart_item.dart';

class CartManager with ChangeNotifier {
  //Map là kiểu Collection chứa cặp key/value
  //giúp làm việc với các Data Provider vì cần làm việc với JSON
  Map<String, CartItem> _items = {
    'p1': CartItem(
      id: 'c1',
      title: 'Red Shirt',
      price: 29.99,
      quantity: 2,
    ),
  };

  //Lấy số lượng sản phẩm
  int get productCount {
    return _items.length;
  }

  List<CartItem> get products {
    return _items.values.toList();
  }

  //Product Entries
  //Iterable là một loại Colection, có thể duyệt qua từng element một
  Iterable<MapEntry<String, CartItem>> get productEntries {
    return {..._items}.entries;
  }

  //Tổng số tiền
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, CartItem) {
      total += CartItem.price * CartItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      //Thay đổi số lượng
      _items.update(
        product.id!,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: 'c${DateTime.now().toIso8601String()}',
          title: product.title,
          price: product.price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]?.quantity as num > 1) {
      _items.update(
        productId,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
