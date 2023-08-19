
import 'package:get/get.dart';
import 'package:labapp/model/test_model.dart';

class CartService{

  RxList<Test> cartItems = RxList<Test>([]);

  void addToCart(Test test) {
  cartItems.add(test);
  }

  void removeFromCart(Test test) {
  cartItems.remove(test);
  }

  int get cartItemsCount {
  return cartItems.length;
  }
  }
