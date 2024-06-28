import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novavison_test/controllers/order_controller.dart';
import 'package:novavison_test/screens/list_orders.dart';
import 'package:novavison_test/screens/list_products.dart';

///
///J'utilise Getx pour la gestion de l'état des applications
///
///
void main() {
  Get.put(OrderController(), permanent: true);
  runApp(const StartMain());
}

// thme color from figma design
ThemeData _lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: const Color(0xFFFFAD25),
  colorScheme: ColorScheme.fromSeed(
      // surface: lightBg,
      seedColor: const Color(0xFFFFAD25),
      brightness: Brightness.light,
      primary: const Color(0xFFFFAD25)),
);

class BottomNavController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}

class StartMain extends StatelessWidget {
  const StartMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: _lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Application de Commandes'),
      ),
      body: Obx(() {
        if (bottomNavController.tabIndex.value == 0) {
          return ListOrders(); // orders screen
        } else {
          return const ListProducts(); // products screen
        }
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: bottomNavController.tabIndex.value,
            onTap: (index) {
              bottomNavController.changeTabIndex(index);
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Commandes',
              ),
              BottomNavigationBarItem(
                  label: '',
                  icon: SizedBox(
                    child: Image.asset(
                      'assets/images/botom_img.png',
                      width: 50,
                      height: 60,
                    ),
                  )),
              const BottomNavigationBarItem(
                icon: Icon(Icons.store),
                label: 'Produits',
              ),
            ],
          )),
    );
  }
}
