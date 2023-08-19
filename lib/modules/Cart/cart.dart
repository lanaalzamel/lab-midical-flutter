import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labapp/modules/Cart/cart_controller.dart';
import 'package:labapp/modules/Cart/component/customitemcart.dart';
import 'package:labapp/modules/Cart/component/header.dart';

import '../../colors.dart';

class Cart extends StatelessWidget {
  final CartController controller = Get.find();

  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = controller.total;

    return Scaffold(
      bottomNavigationBar: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'price',
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoSlab',
                  ),
                ),

                total.isNotEmpty && double.parse(total) != 0
                    ? Text(
                 '\$${total}',
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoSlab',
                  ),
                )
                    : Text(
                  'Empty',
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoSlab',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: MaterialButton(
                color: kPrimaryColor,
                textColor: Colors.white,
                child: Text(
                  'place order',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoSlab',
                  ),
                ),
                onPressed: ()  async {
                  await controller.postTestIdsToServer('3|jBPqr9uAVHvmjuAqng9G9ppkbshjsdd4TWcy5evr');
                  // Optionally, you can clear the cart or perform other actions here
                },
              ),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 50,),
          CartHeader(
            title: 'Cart',
          ),
          Obx(()=>
             Expanded(
              child: ListView.builder(
                itemCount: controller.tests.length,
                itemBuilder: (BuildContext context, int index) {
                  final testKeys = controller.tests.keys.toList();
                  final testValues = controller.tests.values.toList();
                  if (controller.tests.isEmpty) {
                    return Center(
                      child: Text('Your cart is empty.'),
                    );
                  }
                  return Container(
                    padding: EdgeInsets.all(10),
                    child:
                       CustomItemcartList(
                        controller: controller,
                        quantity: testValues[index],
                        test: testKeys[index],
                        index: index,

                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
