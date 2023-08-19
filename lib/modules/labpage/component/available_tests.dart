import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../colors.dart';
import '../../Cart/cart_controller.dart';
import '../lab_page_controller.dart';

List<AvailableTests> availabetests = [
  AvailableTests(
    name: 'CBC',
    category: 'blood test',
    picture:
        'asset/images/cbc-test-abnormalities-red-blood-260nw-2198061033.webp',
    price: '9.99',
      description:'',
  ),
  AvailableTests(
    name: 'Vitamen D',
    category: 'Vitamens',
    picture:
        'asset/images/cbc-test-abnormalities-red-blood-260nw-2198061033.webp',
    price: '7.99',
    description:'',
  ),
  AvailableTests(
    name: 'hemoglobin',
    category: 'blood test',
    picture:
        'asset/images/cbc-test-abnormalities-red-blood-260nw-2198061033.webp',
    price: '9.99',
    description:'',
  ),
  AvailableTests(
    name: 'CBC',
    category: 'blood test',
    picture:
        'asset/images/cbc-test-abnormalities-red-blood-260nw-2198061033.webp',
    price: '9.99',
    description:'',
  ),
];

class AvailableTests extends StatelessWidget {
  AvailableTests({
    Key? key,
    required this.name,
    required this.category,
    required this.picture,
    required this.price,
    required this.description,
  }) : super(key: key);
  final String name;
  final String category;
  final String picture;
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    LabController controller = Get.find();
  //  final CartController _cartController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.center,
        height: 100,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage(
                  picture),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoSlab',
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(category),
                  Text(
                    "${price}\$",
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'RobotoSlab',
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      height: 30,
                      width: 70,
                      child: Center(
                          child: GestureDetector(
                            onTap:  (){},
                            child: Text(
                        'Book',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'RobotoSlab',
                            fontSize: 15,
                        ),
                      ),
                          )),
                    ),
                  ),
                  InkWell(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kTextColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    height: 30,
                    width: 70,
                       child: Center(
                        child: Text(
                      'Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoSlab',
                        fontSize: 15,
                      ),
                    )),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
