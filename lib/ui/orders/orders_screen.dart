import 'package:flutter/material.dart';
import 'package:myshop/ui/shared/app_drawer.dart';
import 'package:provider/provider.dart';

import 'order_item_card.dart';
import 'order_manager.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building orders');
    final ordersManager = OrderManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      //Thêm ở lab2
      drawer: const AppDrawer(),
      body: Consumer<OrderManager>(builder: (ctx, OrderManager, child) {
        return ListView.builder(
          itemCount: ordersManager.orderCount,
          itemBuilder: (ctx, i) => OrderItemCard(ordersManager.orders[i]),
        );
      }),
    );
  }
}
