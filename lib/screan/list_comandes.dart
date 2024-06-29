import 'package:flutter/material.dart';
import 'package:novavison_test/main.dart';
import 'footer.dart'; // Assurez-vous d'avoir importé correctement votre widget Footer

class Commandes extends StatefulWidget {
  const Commandes({Key? key}) : super(key: key);

  @override
  State<Commandes> createState() => _CommandesState();
}

class _CommandesState extends State<Commandes> {
  Color colorEEF8F2 = const Color(0xFFEEF8F2);
  static const Color colorFF9900 = const Color(0xFFFF9900);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            AppBar(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ShaderMask(
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
                            'Liste des Commandes',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors
                                  .white, // La couleur blanche est un espace réservé pour le dégradé
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/Logotst.png',
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              elevation: 0,
            ),
            Container(
              height: 2.0, // Hauteur de l'espace entre l'AppBar et le body
              decoration: BoxDecoration(
                color: Colors.white, // Couleur de l'espace
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.5), // Couleur de l'ombre (ligne sombre)
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4), // Décalage de l'ombre
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          var order = data[index];
          int totalPrice = 0;

          if (order['items'] is List) {
            (order['items'] as List).forEach((item) {
              int price = item['price'].toInt();
              int quantity = item['quantity'].toInt();
              totalPrice += price * quantity;
            });
          }

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(255, 175, 175, 175),
                width: 0.5,
              ),
            ),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${order["userName"]}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$totalPrice MRU',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        width: 600,
                        height: 300,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios,
                                    color: Color.fromARGB(255, 1, 1, 1)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0.6, left: 30.0, right: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 1.0),
                                    child: Center(
                                      child: Text(
                                        'LISTE DES PRODUITS',
                                        style: TextStyle(
                                          color: colorFF9900,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (order['items'] is List)
                                    for (var item in order['items'] as List)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(
                                                        139, 0, 0, 0)
                                                    .withOpacity(0.5),
                                                spreadRadius: 0,
                                                blurRadius: 3,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                            color: colorEEF8F2,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  '${item["productName"]}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Center(
                                                  child: Text(
                                                    '${item["quantity"]}',
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  '${item["price"]} MRU',
                                                  style: const TextStyle(
                                                    color: colorFF9900,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}