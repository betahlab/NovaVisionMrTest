import 'package:flutter/material.dart';

class ProduitsPage extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  ProduitsPage({required this.data});

  @override
  Widget build(BuildContext context) {
    final productMap = <int, Map<String, dynamic>>{};

    // Regroupement des produits par leur ID avec la quantité totale
    for (var order in data) {
      for (var item in order['items']) {
        final productId = item['productId'];
        if (!productMap.containsKey(productId)) {
          productMap[productId] = {
            'productName': item['productName'],
            'quantity': 0,
          };
        }
        // Mise à jour de la quantité totale du produit
        productMap[productId]!['quantity'] += item['quantity'];
      }
    }

    // Conversion de la map en une liste de produits pour l'affichage
    final productList = productMap.values.toList();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 70.0), // Espace above the title
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Liste des produits',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 238, 149, 16),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),           
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Bordures rectangulaires
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0), // Padding autour du contenu de la carte
                child: ListTile(
                  // title text and trailing icon are omitted
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: ListTile(
                        title: Text(product['productName']),
                        trailing: Text(
                          '${product['quantity']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
