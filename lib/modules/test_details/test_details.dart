import 'package:flutter/material.dart';
import 'package:labapp/colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get/get.dart';
import 'package:labapp/modules/Cart/cart.dart';
import 'package:labapp/modules/Cart/cart_controller.dart';
import 'package:labapp/modules/test_details/product_details_controller.dart';

import '../labpage/component/available_tests.dart';
import '../labpage/lab_page.dart';
import '../labpage/lab_page_controller.dart';

class TestDetailed {
  final String image;
  final String name;
  final String price;
  final String description;
  final String id;
  TestDetailed(this.name, this.price,  this.image, this.description, this.id);
}

  class ProductDetailsView extends StatelessWidget {
    final TestDetailed testItem;
    final DetailController detailcontroller = Get.put(DetailController());
    final LabController controller = Get.find();
  ProductDetailsView({
    Key? key, required this.testItem,
  }) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    final testItem = Get.arguments ;
    detailcontroller.updateData(testItem.name,testItem.image,testItem.price.toString(), testItem.description);



    final cartController = Get.put(CartController());
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.to(labPage());
          },
          icon: const Icon(
            Ionicons.chevron_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(Cart());
            },
            icon: const Icon(
              Ionicons.cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://mlab123.000webhostapp.com' +(detailcontroller?.image?.value?.toString()??''),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chanel',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            detailcontroller?.name?.toString() ?? '',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(

                            '\$${detailcontroller?.price?.toString() ?? ''}',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Expanded(
                        child: Text(
                          detailcontroller?.description?.toString() ?? '',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
               cartController.addTest(testItem);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
