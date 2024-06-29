// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:novavison_test/models/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    // Dictionnaire pour stocker les quantités de chaque produit
    Map<String, int> productQuantities = {};

    // Calculer les quantités totales de chaque produit
    for (var product in products) {
      if (productQuantities.containsKey(product.productName)) {
        productQuantities[product.productName] =
            productQuantities[product.productName]! + product.quantity;
      } else {
        productQuantities[product.productName] = product.quantity;
      }
    }

    return Scaffold(
      body: ListView(
        children: [
          // Conteneur avec ombre
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),

          // Espace vide
          const SizedBox(height: 20),

          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: productQuantities.length,
            itemBuilder: (context, index) {
              final product = products[index];
              int totalQuantity = productQuantities[product
                  .productName]!; // la total du quantite pour chaque prduits

              // Widget pour chaque produit
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: ListTile(
                      title: Text(
                        '${product.productName}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '$totalQuantity',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
