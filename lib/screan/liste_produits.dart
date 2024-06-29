import 'package:flutter/material.dart';
import 'package:novavison_test/main.dart';
import 'package:novavison_test/screan/footer.dart';

class Produits extends StatefulWidget {
  const Produits({Key? key}) : super(key: key);

  @override
  State<Produits> createState() => _ProduitsState();
}

class _ProduitsState extends State<Produits> {
  Color colorEEF8F2 = const Color(0xFFEEF8F2);
  static const Color colorFF9900 = const Color(0xFFFF9900);

  // Méthode pour obtenir les IDs des produits uniques dans les données
  List<int> getUniqueProductIds() {
    Set<int> productIds = {};

    for (var order in data) {
      if (order['items'] is List) {
        for (var item in order['items'] as List) {
          productIds.add(item['productId'].toInt());
        }
      }
    }

    return productIds.toList();
  }

  // Méthode pour obtenir le nom d'un produit par son ID
  String getProductName(int productId) {
    String productName = '';

    for (var order in data) {
      if (order['items'] is List) {
        for (var item in order['items'] as List) {
          if (item['productId'] == productId) {
            productName = item['productName'];
            break;
          }
        }
      }
      if (productName.isNotEmpty) {
        break;
      }
    }

    return productName;
  }

  // Méthode pour calculer la quantité totale d'un produit par son ID
  int calculateTotalQuantityForProduct(int productId) {
    int totalQuantity = 0;
    for (var order in data) {
      if (order['items'] is List) {
        (order['items'] as List).forEach((item) {
          if (item['productId'] == productId) {
            int quantity = item['quantity'].toInt();
            totalQuantity += quantity;
          }
        });
      }
    }
    return totalQuantity;
  }

  @override
  Widget build(BuildContext context) {
    List<int> uniqueProductIds = getUniqueProductIds();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: Column(
          children: [
            AppBar(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 80, 189, 30),
                            Color.fromARGB(218, 250, 222, 37),
                            Color.fromARGB(255, 152, 204, 30),
                            Color.fromARGB(255, 152, 204, 30),
                            Color(0xFF68998c),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: const Text(
                          'Liste des Produits',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/Logotst.png',
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              elevation: 0,
            ),
            Container(
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Utiliser Expanded pour que la liste prenne l'espace restant
          Expanded(
            child: ListView.separated(
              itemCount: uniqueProductIds.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 1,
                color: Color.fromARGB(105, 100, 99, 99),
              ),
              itemBuilder: (context, index) {
                int productId = uniqueProductIds[index];
                String productName = getProductName(productId);
                int totalQuantity = calculateTotalQuantityForProduct(productId);

                return Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 0.0),
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      productName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '$totalQuantity',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          // Le Footer est maintenant en dehors de la liste et en bas
          Container(
            height: 80.0,
            child: const Footer(),
          ),
        ],
      ),
    );
  }
}