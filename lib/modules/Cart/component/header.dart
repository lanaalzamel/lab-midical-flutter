import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labapp/modules/labpage/lab_page.dart';

import '../../test_details/test_details.dart';

class CartHeader extends StatelessWidget {
  final String title;
  const CartHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    }, icon: Icon(Icons.arrow_back)),
              )),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
               title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoSlab',
                ),
              ),
            ),
          ),
          Spacer(),

        ],
      ),
    );
  }
}
