import 'package:flutter/material.dart';
import '../models/order.dart';

class ProductsPage extends StatelessWidget {
  final List<Order> data;

  ProductsPage({required this.data});

  Map<String, int> getProductQuantities(List<Order> data) {
    Map<String, int> productQuantities = {};
    for (var order in data) {
      for (var item in order.items) {
        if (productQuantities.containsKey(item.productName)) {
          productQuantities[item.productName] =
              (productQuantities[item.productName]! + item.quantity);
        } else {
          productQuantities[item.productName] = item.quantity;
        }
      }
    }
    return productQuantities;
  }

  @override
  Widget build(BuildContext context) {
    var productQuantities = getProductQuantities(data);

    return ListView(
      children: productQuantities.entries.map((entry) {
        return ListTile(
          title: Text(entry.key),
          trailing: Text('${entry.value}'),
        );
      }).toList(),
    );
  }
}
