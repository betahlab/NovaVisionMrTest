import 'package:flutter/material.dart';

class CommandesPage extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  CommandesPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 70.0), // Espace above the title
          Center(
            child: Text(
              'Liste des commandes',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(230, 230, 0, 1),
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
              itemCount: data.length,
              itemBuilder: (context, index) {
                final order = data[index];
                final totalAmount = order['items']
                    .fold(0, (sum, item) => sum + item['price'] * item['quantity']);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0), // Ajout du padding horizontal
                      child: ListTile(
                        title: Text(order['userName']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$totalAmount MRU',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 8), // Espace entre le texte et l'icône
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                        onTap: () {
                          _showOrderDetails(context, order);
                        },
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

  void _showOrderDetails(BuildContext context, Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Détails de la commande',
            style: TextStyle(color: Color.fromARGB(255, 238, 149, 16)),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: order['items'].map<Widget>((item) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(item['productName']),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${item['quantity']}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${item['price']} MRU',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Color.fromARGB(255, 238, 149, 16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
