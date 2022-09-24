//OrderItemCard hiển thị thông của một đặt hàng

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../models/order_item.dart';

class OrderItemCard extends StatefulWidget {
  final OrderItem order;

  const OrderItemCard(this.order, {super.key});

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  //Expanded mở rộng
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildOrderSummary(),
          if (_expanded) builsOrderDetails()
        ],
      ),
    );
  }

  //Widget hiển thị tổng kết lại đặt hàng
  Widget buildOrderSummary() {
    return ListTile(
      title: Text('\$${widget.order.amount}'),
      subtitle: Text(
        DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
      ),
      //trailing là widget hiển thị sau tiêu đề
      trailing: IconButton(
        icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
        onPressed: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
      ),
    );
  }

  //Chi tiết đặt hàng sản phẩm
  Widget builsOrderDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      height: min(widget.order.productCount * 20.0 + 100, 100),
      child: ListView(
        children: widget.order.products
            .map(
              (prod) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    prod.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${prod.quantity}x \$${prod.price}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
