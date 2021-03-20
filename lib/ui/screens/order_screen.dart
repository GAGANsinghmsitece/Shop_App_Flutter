import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemBuilder: (ctx, i) => OrderItem(orderData.products[i]),
          itemCount: orderData.products.length,
        ));
  }
}
