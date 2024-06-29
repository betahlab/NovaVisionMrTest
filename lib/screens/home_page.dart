// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:novavison_test/screens/Produits.dart';
import 'package:novavison_test/screens/commandes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    CommandesPage(),
    Text(''),
    ProduitsPage(),
  ];

  List<Widget> _titles = [
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
          color: Colors.white, // This color will be masked by the shader
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
          color: Colors.white, // This color will be masked by the shader
        ),
      ),
    ),
  ];

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
      body: _widgetOptions.elementAt(_selectedIndex),
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
