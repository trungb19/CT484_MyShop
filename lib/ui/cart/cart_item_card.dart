//CartItemCard hiển thị thông tin một mặt hàng trong giỏ hàng

import 'package:flutter/material.dart';
import 'package:myshop/ui/cart/cart_manager.dart';
import 'package:provider/provider.dart';

import '../../models/cart_item.dart';
import '../shared/dialog_utils.dart';

class CartItemCard extends StatelessWidget {
  //Một số thuộc tính
  final String productId;
  final CartItem cardItem;

  //Hàm xây dựng
  const CartItemCard({
    required this.productId,
    required this.cardItem,
    super.key,
  });

  //@override
  Widget build(BuildContext context) {
    //Đây là một loại widget hỗ trợ cử chỉ vuốt nhẹ để loại bỏ widget
    return Dismissible(
      key: ValueKey(cardItem.id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      //direction điều chỉnh hướng, loai bỏ bằng cách theo hướng được chỉ định
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showConfirmDialog(
          context,
          'Do you want to remove the item from the cart?',
        );
      },
      onDismissed: (direction) {
        context.read<CartManager>().removeItem(productId);
        //print('Cart item dismissed');
      },
      child: buildItemCard(),
    );
  }

  Widget buildItemCard() {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('\$${cardItem.price}'),
              ),
            ),
          ),
          title: Text(cardItem.title),
          subtitle: Text('Total: \$${cardItem.price * cardItem.quantity}'),
          trailing: Text('${cardItem.quantity} x'),
        ),
      ),
    );
  }
}
