// ProductGirdTile trình bày thông tin một sản phẩm

import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'product_detail_screen.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    // ClipRRect cho phép cắt một vùng hcn ra khỏi một hcn lớn với các góc bo tròn
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: buildGridFooterBar(context),
        // GestureDetector xử lý thao tác người dùng: chạm, vuốt, lắc,...
        child: GestureDetector(
          onTap: () {
            // Liên kết đến trang chi tiết sản phẩm
            //Navigator.of(context).push(MaterialPageRoute(
            //
            //  builder: (ctx) => ProductDetailScreen(product),

            //Thay đổi ở ví dụ 2
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );

            //print('Go to product detail screen');
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      leading: IconButton(
        icon: Icon(
          product.isFavorite ? Icons.favorite : Icons.favorite_border,
        ),
        color: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          print('Toggle a favorite product');
        },
      ),
      title: Text(
        product.title,
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          print('Add item to cart');
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
