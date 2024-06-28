import 'package:get/get.dart';
import 'package:novavison_test/constants/contants.dart';
import 'package:novavison_test/models/order_model.dart';

class OrderController extends GetxController {
  RxList<Order?> ordersList = RxList<Order?>([]);

  @override
  void onInit() async {
    super.onInit();

    fetchUserOrders();
  }

  void fetchUserOrders() {
    try {
      ordersList.value = listOrders.map((e) => Order.fromJson(e)).toList();
    } catch (e) {
      printError(info: '$e');
    }
  }
}
