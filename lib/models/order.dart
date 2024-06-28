import 'package:novavison_test/models/product.dart';

class Order {
  final List<Product> items;
  final String userName;

  Order({required this.items, required this.userName});

  static List<Order> fromJson(List<Map<String, dynamic>> data) {
    return data.map((order) {
      return Order(
        items: Product.fromJson(order['items']),
        userName: order['userName'],
      );
    }).toList();
  }
}
