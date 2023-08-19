import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labapp/modules/categorytests/category_controller.dart';
import 'package:labapp/modules/categorytests/components/body.dart';


import '../../colors.dart';

class AllTests extends StatelessWidget {
   AllTests({Key? key}) : super(key: key);
  CategoryController controller=Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: body(),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}

