// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:novavison_test/widgets/product_list.dart';
import 'package:provider/provider.dart';
import '../providers/order_provider.dart';

class ProduitsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final products =
        orderProvider.orders.expand((order) => order.items).toList();

    return ProductList(products: products);
  }
}
