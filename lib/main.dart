// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:novavison_test/Produits.dart';
import 'package:novavison_test/commandes.dart';

// Données des commandes
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

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Index de la screen sélectionné
  int _selectedIndex = 0;

  // Widgets pour chaque screen
  static List<Widget> _widgetOptions = <Widget>[
    Commandes(
      data: data,
    ),
    Text(''),
    Produits(
      data: data,
    ),
  ];

  // Titres pour chaque screen
  List<Widget> _titles = [
    // Shader pour appliquer un LinearGradient à un texte
    ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Color(0xFFFFAD25),
          Color(0xFF50CE56),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: const Text(
        'Liste des commandes',
        style: TextStyle(
          color: Colors.white, // Cette couleur sera masquée par le shader
        ),
      ),
    ),
    Text(''),
    ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Color(0xFFFFAD25),
          Color(0xFF50CE56),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: const Text(
        'Liste des produits',
        style: TextStyle(
          color: Colors.white, // Cette couleur sera masquée par le shader
        ),
      ),
    ),
  ];

  // Fonction pour gérer le changement du screen
  void _onItemTapped(int index) {
    if (index == 1) {
      // Ne rien faire lorsque l'icône à l'index 1 est cliquée
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar avec élévation et titre centré
      appBar: AppBar(
        elevation: 2.0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Container(
            margin: EdgeInsets.only(top: 20), child: _titles[_selectedIndex]),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 10, right: 25),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'images/sac.png',
                width: 60,
                height: 60,
              ),
            ),
          )
        ],
      ),
      // Contenu de la page correspondant à l'onglet sélectionné
      body: _widgetOptions.elementAt(_selectedIndex),
      // Barre de navigation en bas
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp), label: "Commands"),
          BottomNavigationBarItem(
              icon: Image.asset(
                  fit: BoxFit.cover,
                  'images/forchet.png',
                  width: 25,
                  height: 60),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Produits")
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
