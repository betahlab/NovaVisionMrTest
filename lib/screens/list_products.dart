import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novavison_test/controllers/order_controller.dart';
import 'package:novavison_test/widgets/list_header.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductSummaryWidget();
  }
}

class ProductSummaryWidget extends StatelessWidget {
  const ProductSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.find<OrderController>();

    // Calculer la somme des quantités pour chaque produit
    final Map<String, int> productQuantities = {};
    for (var order in orderController.ordersList) {
      for (var item in order!.items) {
        if (!productQuantities.containsKey(item.productName)) {
          productQuantities['${item.productName}'] = item.quantity;
        } else {
          productQuantities['${item.productName}'] =
              (productQuantities[item.productName] ?? 0) + item.quantity;
        }
      }
    }

    final List<MapEntry<String, int>> productList =
        productQuantities.entries.toList();

    return ListView.builder(
      itemCount: productList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const ListHeader(title: 'Lite des produits');
        }
        final product = productList[index - 1];

        return ListTile(
          title: Text(product.key),
          trailing: Text('${product.value}'),
        );
      },
    );
  }
}
