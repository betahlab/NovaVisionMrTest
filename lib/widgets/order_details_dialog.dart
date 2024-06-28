import 'package:flutter/material.dart';
import '../models/product.dart';

void showOrderDetails(BuildContext context, List<Product> items) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'LIST DES PRODUITS',
          style: TextStyle(color: Colors.orange),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: items.map((item) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.productName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${item.quantity}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${(item.price * item.quantity)} MRU',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
