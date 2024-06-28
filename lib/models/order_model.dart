class Order {
  List<Items> items = [];
  String? userName;

  Order({required this.items, this.userName});

  Order.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(Items.fromJson(v));
      });
    }
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items'] = items.map((v) => v.toJson()).toList();

    data['userName'] = userName;
    return data;
  }
}

class Items {
  int? productId;
  String? productName;
  int price = 0;
  int quantity = 0;

  Items(
      {this.productId,
      this.productName,
      required this.price,
      required this.quantity});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['productName'] = productName;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}
