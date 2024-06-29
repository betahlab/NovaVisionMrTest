class Product {
  final int productId;
  final String productName;
  final double price;
  final int quantity;

  Product({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      productName: json['productName'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
