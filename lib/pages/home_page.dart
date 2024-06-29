import 'package:flutter/material.dart';
import 'package:novavison_test/models/product.dart';
import '../models/order.dart';
import 'products_page.dart';
import '../widgets/order_details_dialog.dart';

class HomePage extends StatefulWidget {
  final List<Order> data;

  HomePage({required this.data});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index != 1) {
        _selectedIndex = index;
      }
    });
  }

  double getTotalAmount(List<Product> items) {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          var order = widget.data[index];
          var totalAmount = getTotalAmount(order.items);
          return Card(
            child: ListTile(
              title: Text(
                order.userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${totalAmount} MRU',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ],
              ),
              onTap: () {
                showOrderDetails(context, order.items);
              },
            ),
          );
        },
      ),
      Container(),
      ProductsPage(data: widget.data),
    ];

    List<String> _titles = [
      'Liste des commandes',
      '',
      'Liste des produits',
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Adjust the height here
        child: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [Colors.orange, Colors.green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: Text(
                  _titles[_selectedIndex],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                  width: 16), // Add some space between the text and the image
              Image.asset(
                'lib/assets/images/appBar_image.png',
                height: 80, // Adjust the height to fit your design
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Commandes',
          ),
          BottomNavigationBarItem(
            icon: Center(
              child: Image.asset(
                'lib/assets/images/forshet.png',
                height: 70, // Adjust the height to fit your design
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Products',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
