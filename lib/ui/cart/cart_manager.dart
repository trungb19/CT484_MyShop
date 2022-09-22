import 'package:myshop/models/product.dart';

import '../../models/cart_item.dart';

class CartManager {
  //Map là kiểu Collection chứa cặp key/value
  //giúp làm việc với các Data Provider vì cần làm việc với JSON
  final Map<String, CartItem> _items = {
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
}
