import 'package:flutter/material.dart';
import 'produits_page.dart';
import 'commandes_page.dart';

//here is the data
var data = [
  {
    "items": [
      {"productId": 1, "productName": "product1", "price": 260, "quantity": 3},
      {"productId": 2, "productName": "product2", "price": 500, "quantity": 2},
      {"productId": 3, "productName": "product3", "price": 320, "quantity": 5}
    ],
    "userName": "Mohamed"
  },
  {
    "items": [
      {"productId": 2, "productName": "product2", "price": 260, "quantity": 8},
    ],
    "userName": "Sidi"
  },
  {
    "items": [
      {"productId": 1, "productName": "product1", "price": 260, "quantity": 5},
      {"productId": 3, "productName": "product3", "price": 320, "quantity": 1}
    ],
    "userName": "Ahmed"
  },
  {
    "items": [
      {"productId": 1, "productName": "product1", "price": 260, "quantity": 7},
    ],
    "userName": "Brahim"
  },
  {
    "items": [
      {"productId": 1, "productName": "product1", "price": 260, "quantity": 4},
      {"productId": 2, "productName": "product2", "price": 500, "quantity": 6},
      {"productId": 3, "productName": "product3", "price": 320, "quantity": 7}
    ],
    "userName": "Abdellahi"
  },
];
void main() {
  runApp(const MyApp());
}

//Delete this and start your project
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          CommandesPage(data: data),
          ProduitsPage(data: data),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Commandes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Produits',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}