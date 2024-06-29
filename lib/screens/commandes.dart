// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:novavison_test/models/order.dart';
import 'package:novavison_test/providers/order_provider.dart';
import 'package:provider/provider.dart';

class CommandesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final orders = orderProvider.orders;

    return ListView(
      children: [
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
        SizedBox(height: 20),
        Divider(),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: orders.length,
          itemBuilder: (context, i) {
            var order = orders[i];
            var items = order.items;

            // calculer la prix total du commandes
            double totalPrice = items.fold(
              0,
              (sum, item) => sum + (item.price) * (item.quantity),
            );

            return GestureDetector(
              onTap: () => _showUserDetails(context, order),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 70,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.userName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '$totalPrice MRU',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.chevron_right_rounded)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // pour afficher les details du commades
  void _showUserDetails(BuildContext context, Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: order.items.map((item) {
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
                            Text('${item.productName}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              '${item.quantity}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${item.price} MRU',
                              style: TextStyle(
                                  color: Color(0xFFFF9900),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
