import 'dart:convert';

import 'package:get/get.dart';

import 'package:labapp/config/server_config.dart';

import '../../model/test_model.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  var message;
  var _tests = {}.obs;
  List<int> testIdsInCart = [];

  void addTest(Test test) {
     if (_tests.containsKey(test)) {
       _tests[test] += 1;
     } else {
       _tests[test] = 1;
     }
    testIdsInCart.add(test.id);
    Get.snackbar(
      "Product Added",
      "You have added the ${test.name} to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void removeTest(Test test) {
    if (_tests.containsKey(test) && _tests[test] == 1) {
      _tests.remove(test); //
      testIdsInCart.remove(test.id);
      // Simply remove the element from the map
    }; // Decrease the count if greater than 1
    // If the test is not in the map, do nothing
    Get.snackbar(
      "Product removed",
      "You have remove the ${test.name} to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  get tests => _tests;

  get testSubtotal =>
      _tests.entries.map((test) => test.key.price * test.value).toList();

  get total {
    if (_tests.isEmpty) {
      return '0.00'; // Return 0 as string when the cart is empty
    }

    return _tests.entries
        .map((test) => test.key.price * test.value)
        .toList()
        .reduce((value, element) => value + element)
        .toStringAsFixed(2);
  }

    Future<void> postTestIdsToServer(String token) async {
    var url = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.Postappointment);
    try {
      final response = await http.post(
        url,
        body: {
          'id': testIdsInCart.join(',')
        }, //
        // Join IDs as a
      headers: {
          'Accept':'application/json',
        'Authorization':'Bearer $token'
      }
        // comma-separated string
      );
      print('asas');
      print(response.statusCode);
      print(response.body);
      print('lanaa');

      if (response.statusCode == 200) {
        var jsonResponse= jsonDecode(response.body);
        // Order placed successfully
        Get.snackbar(
          "Order Placed",
          "Your order has been placed successfully",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
        );

        // Clear the cart
        _tests.clear();
      } else {
        var jsonResponse= jsonDecode(response.body);
        message=jsonResponse['errors'];
        // Handle the error
        Get.snackbar(
          "Error",
          "Failed to place the order",
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
        );
      }
    } catch (error) {
      print(error);
      // Handle the exception
      Get.snackbar(
        "Error",
        "An error occurred while placing the order",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
      );
    }
  }
}
