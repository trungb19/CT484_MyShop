//UserProductScreen hiển thị sản phẩm người dùng

import 'package:flutter/material.dart';
import 'package:myshop/ui/products/edit_product_screen.dart';
import 'package:myshop/ui/shared/app_drawer.dart';
import 'package:provider/provider.dart';
import 'user_product_list_tile.dart';
import 'products_manager.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      //Thêm ở lab2
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async => print('Refresh products'),
        child: buildUserProductListView(),
      ),
    );
  }

  Widget buildUserProductListView() {
    return Consumer<ProductsManager>(builder: (ctx, productsManager, child) {
      return ListView.builder(
        itemCount: productsManager.itemCount,
        itemBuilder: (ctx, i) => Column(children: [
          UserProductListTile(
            productsManager.items[i],
          ),
          const Divider(),
        ]),
      );
    });
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            EditProductScreen.routeName,
          );
          //print('Go to edit product screen');
        },
        icon: const Icon(Icons.add));
  }
}
