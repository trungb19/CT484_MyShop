//UserProductScreen hiển thị sản phẩm người dùng

import 'package:flutter/material.dart';
import 'user_product_list_tile.dart';
import 'products_manager.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productManager = ProductManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product'),
        actions: <Widget>[
          buildAddButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => print('Refresh products'),
        child: buildUserProductListView(productManager),
      ),
    );
  }

  Widget buildUserProductListView(ProductManager productManager) {
    return ListView.builder(
      itemCount: productManager.itemCount,
      itemBuilder: (ctx, i) => Column(children: [
        UserProductListTile(
          productManager.items[i],
        ),
        const Divider(),
      ]),
    );
  }

  Widget buildAddButton() {
    return IconButton(
        onPressed: () {
          print('Go to edit product screen');
        },
        icon: const Icon(Icons.add));
  }
}
