import 'package:flutter/material.dart';
import 'package:novavison_test/models/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];

  OrderProvider() {
    var data = [
      {
        "items": [
          {
            "productId": 1,
            "productName": "product1",
            "price": 260,
            "quantity": 3
          },
          {
            "productId": 2,
            "productName": "product2",
            "price": 500,
            "quantity": 2
          },
          {
            "productId": 3,
            "productName": "product3",
            "price": 320,
            "quantity": 5
          }
        ],
        "userName": "Mohamed"
      },
      {
        "items": [
          {
            "productId": 2,
            "productName": "product2",
            "price": 260,
            "quantity": 8
          }
        ],
        "userName": "Sidi"
      },
      {
        "items": [
          {
            "productId": 1,
            "productName": "product1",
            "price": 260,
            "quantity": 5
          },
          {
            "productId": 3,
            "productName": "product3",
            "price": 320,
            "quantity": 1
          }
        ],
        "userName": "Ahmed"
      },
      {
        "items": [
          {
            "productId": 1,
            "productName": "product1",
            "price": 260,
            "quantity": 7
          }
        ],
        "userName": "Brahim"
      },
      {
        "items": [
          {
            "productId": 1,
            "productName": "product1",
            "price": 260,
            "quantity": 4
          },
          {
            "productId": 2,
            "productName": "product2",
            "price": 500,
            "quantity": 6
          },
          {
            "productId": 3,
            "productName": "product3",
            "price": 320,
            "quantity": 7
          }
        ],
        "userName": "Abdellahi"
      },
    ];

    _orders = parseOrders(data);
    notifyListeners();
  }

  List<Order> get orders => _orders;

  List<Order> parseOrders(List<Map<String, dynamic>> data) {
    return data.map((order) => Order.fromJson(order)).toList();
  }
}
