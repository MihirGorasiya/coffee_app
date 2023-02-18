import 'package:get/get.dart';

class Controller extends GetxController {
  var coffeeType = (-1).obs;
  var cartList = <Map<String, int>>[].obs;

  var specialProducts = <Map<String, dynamic>>[
    {
      'index': 0,
      'name': 'Espresso Cappuccino',
      'price': '60',
      'image': 'assets/0.png',
      'catagory': 'our special, strong, without milk, hot',
    },
    {
      'index': 1,
      'name': 'Flat White',
      'price': '45',
      'image': 'assets/1.png',
      'catagory': 'our special, light, milk, cold',
    },
    {
      'index': 2,
      'name': 'Long Black',
      'price': '50',
      'image': 'assets/2.png',
      'catagory': 'our special, strong, without milk, hot',
    },
    {
      'index': 3,
      'name': 'Latte',
      'price': '70',
      'image': 'assets/3.png',
      'catagory': 'our special, light, without milk, cold',
    },
  ];
}
