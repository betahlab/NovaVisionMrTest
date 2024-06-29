// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Produits extends StatefulWidget {
  // Liste de données des produits
  final List<Map<String, dynamic>>? data;
  const Produits({super.key, this.data});

  @override
  State<Produits> createState() => _ProduitsState();
}

class _ProduitsState extends State<Produits> {
  @override
  Widget build(BuildContext context) {
    // Dictionnaire pour stocker les quantités de chaque produit
    Map<String, int> productQuantities = {};

    // Calculer les quantités totales de chaque produit
    if (widget.data != null) {
      for (var user in widget.data!) {
        var items = user['items']
            as List<Map<String, dynamic>>; // Produits de l'utilisateur
        for (var item in items) {
          String productName = item['productName']; // Nom du produit
          int quantity = item['quantity']; // Quantité du produit
          if (productQuantities.containsKey(productName)) {
            productQuantities[productName] =
                productQuantities[productName]! + quantity;
          } else {
            productQuantities[productName] = quantity;
          }
        }
      }
    }

    return Scaffold(
      // Liste des produits
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

          // Liste des produits avec leurs quantités totales
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: productQuantities.length,
            itemBuilder: (context, index) {
              String productName =
                  productQuantities.keys.elementAt(index); // Nom du produit
              int totalQuantity =
                  productQuantities[productName]!; // Quantité totale du produit

              // Widget pour chaque produit
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: ListTile(
                      title: Text(
                        '${productName}',
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
