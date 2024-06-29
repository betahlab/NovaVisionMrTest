import 'product.dart';

class Order {
  final String userName;
  final List<Product> items;

  Order({
    required this.userName,
    required this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    var items = json['items'] as List;
    List<Product> productItems =
        items.map((item) => Product.fromJson(item)).toList();

    return Order(
      userName: json['userName'],
      items: productItems,
    );
  }
}
