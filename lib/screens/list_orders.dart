import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novavison_test/controllers/order_controller.dart';
import 'package:novavison_test/models/order_model.dart';
import 'package:novavison_test/widgets/list_header.dart';

class ListOrders extends StatelessWidget {
  ListOrders({super.key});

  final OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return const OrdersListWidget();
  }
}

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({super.key});
  void showOrderDetails(Order order, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Détails de la commande',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: order.items.map((item) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${item.productName}'),
                      Text('${item.quantity}'),
                      Text(
                        '${item.price} MRU',
                        style: TextStyle(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.find<OrderController>();

    return Obx(() {
      if (orderController.ordersList.isEmpty) {
        return const Center(child: Text('Aucune commande trouvée.'));
      }

      return ListView.builder(
        itemCount: orderController.ordersList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const ListHeader(title: 'Lite des commandes');
          }
          final order = orderController.ordersList[index - 1];
          if (order == null) return Container();

          final total = order.items
              .fold(0, (sum, item) => sum + (item.price * item.quantity));

          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${order.userName}'),
                Text(
                  '${total.toStringAsFixed(2)} MRU',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => showOrderDetails(order, context),
          );
        },
      );
    });
  }
}
