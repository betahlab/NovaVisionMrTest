// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Commandes extends StatefulWidget {
  // Liste de données de commandes
  final List<Map<String, dynamic>>? data;
  const Commandes({super.key, this.data});

  @override
  State<Commandes> createState() => _CommandesState();
}

class _CommandesState extends State<Commandes> {
  // Fonction pour afficher les détails d'un utilisateur
  void _showUserDetails(BuildContext context, Map<String, dynamic> user) {
    // Afficher une boîte de dialogue avec les détails des produits
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var items = user['items'] as List<Map<String, dynamic>>;
        // Retourner une boîte de dialogue
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
          // Contenu de la boîte de dialogue
          content: Container(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre centré
                const Center(
                  child: Text(
                    'LISTE DES PRODUITS',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFF9900)),
                  ),
                ),

                // Espace vide
                const SizedBox(height: 10),

                // Liste des produits
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      var item = items[i];
                      // Conteneur pour chaque produit
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Color(0xFFEEF8F2),
                        ),

                        // Détails du produit
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${item['productName']}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              '${item['quantity']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${item['price']} MRU',
                              style: TextStyle(
                                  color: Color(0xFFFF9900),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Liste des commandes
      body: ListView(
        children: [
          // Conteneur avec ombre
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
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

          // Ligne de séparation
          const Divider(),

          // Liste des utilisateurs
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.data?.length ?? 0,
              itemBuilder: (context, i) {
                var user = widget.data![i]; // Utilisateur actuel
                var items = user['items']
                    as List<Map<String, dynamic>>; // Produits de l'utilisateur

                // Calculer le prix total des produits de l'utilisateur
                double totalPrice = items.fold(
                    0,
                    (sum, item) =>
                        sum +
                        (item['price'] as int) * (item['quantity'] as int));

                // Widget pour chaque utilisateur
                return GestureDetector(
                  // Afficher les détails de l'utilisateur lorsqu'il est cliqué
                  onTap: () => _showUserDetails(context, user),
                  child: Column(
                    children: [
                      // Conteneur avec les détails de l'utilisateur
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${user['userName']}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${totalPrice} MRU',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.chevron_right_outlined)
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
