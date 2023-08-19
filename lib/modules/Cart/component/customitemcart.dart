import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labapp/model/test_model.dart';
import 'package:labapp/modules/Cart/cart_controller.dart';
import 'package:labapp/modules/test_details/test_details.dart';

class CustomItemcartList extends StatelessWidget {
  final CartController controller;
  final Test test;
  final int quantity;
  final int index;

  const CustomItemcartList({Key? key,  required this.controller, required this.test, required this.quantity, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
                child: Image.asset(
                  'asset/images/cbc-test-abnormalities-red-blood-260nw-2198061033.webp',
                  height: 90,
                )),
            Expanded(
              flex: 2,
              child:
                 ListTile(
                  title: Text(
                    test.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoSlab',
                    ),
                  ),
                  subtitle: Text(
                    test.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoSlab',
                    ),
                  ),
                ),
            ),
            Expanded(
                child: Column(
                  children: [
                    Container(
                        height: 30,
                      child: GestureDetector(
                         onTap: (){
                           controller.removeTest(test);
                           print(quantity);
                           },
                          child: Text('Delete')),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
