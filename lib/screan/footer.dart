import 'package:flutter/material.dart';
import 'package:novavison_test/screan/list_comandes.dart';
import 'package:novavison_test/screan/liste_produits.dart';


class Footer extends StatelessWidget {
  const Footer({super.key});

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, -2), // déplace l'ombre vers le haut
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Icône pour les commandes
          InkWell(
            onTap: () => _navigateToPage(context, const Commandes()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.amber[800],
                ),
                Text('Commandes'),
              ],
            ),
          ),

          // Image au centre
          Image.asset(
            'assets/images/iconTst.png',
            height: 70,
          ),

          // Icône pour les produits
          InkWell(
            onTap: () => _navigateToPage(context, const Produits()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.store,
                  color: Colors.amber[800],
                ),
                Text('Produits'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}