class Product {
  final int productId;
  final String productName;
  final int price;
  final int quantity;

  Product(
      {required this.productId,
      required this.productName,
      required this.price,
      required this.quantity});

  static List<Product> fromJson(List<Map<String, dynamic>> data) {
    return data.map((item) {
      return Product(
        productId: item['productId'],
        productName: item['productName'],
        price: item['price'],
        quantity: item['quantity'],
      );
    }).toList();
  }
}
