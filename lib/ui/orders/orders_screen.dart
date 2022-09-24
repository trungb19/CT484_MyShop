import 'package:flutter/material.dart';

import 'order_item_card.dart';
import 'order_manager.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building orders');
    final ordersManager = OrderManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      body: ListView.builder(
        itemCount: ordersManager.orderCount,
        itemBuilder: (ctx, i) => OrderItemCard(ordersManager.orders[i]),
      ),
    );
  }
}
