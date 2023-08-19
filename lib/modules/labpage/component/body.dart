import 'package:flutter/material.dart';
import 'package:labapp/colors.dart';
import 'package:labapp/model/test_model.dart';
import 'package:labapp/modules/categorytests/category_tests.dart';
import 'package:labapp/modules/labpage/component/header.dart';
import 'package:labapp/modules/test_details/product_details_controller.dart';
import '../../Cart/cart_controller.dart';
import '../../test_details/test_details.dart';
import '../lab_page_controller.dart';
import 'package:get/get.dart';
import 'available_tests.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // final CartController _cartController = Get.find();
    LabController controller = Get.find();
    final DetailController detailcontroller = Get.put(DetailController());


    Size size = MediaQuery.of(context).size;
    return GetBuilder<LabController>(
      builder: (controller) {
        return Obx(() {
          if (controller.isLoding.isTrue) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (controller.labData.value.id == null) {
              return CircularProgressIndicator();
            } else {
              final labData = controller.labData.value;
              return IndexedStack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Header(size: size),
                        Text(
                          controller.labData.value.name.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'RobotoSlab',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.star, color: Colors.yellow),
                                  Text(controller.labData.value.rate.toString(),
                                      style: TextStyle(fontSize: 16.0)),
                                  SizedBox(width: 16.0),
                                  Icon(Icons.location_on, color: Colors.blue),
                                  Text(
                                      controller.labData.value.addressId
                                          .toString(),
                                      style: TextStyle(fontSize: 16.0)),
                                  SizedBox(width: 16.0),
                                  Icon(Icons.schedule, color: Colors.green),
                                  Text(
                                      controller.labData.value.workHours
                                          .toString(),
                                      style: TextStyle(fontSize: 16.0)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            shadowColor: Colors.grey,
                            color: Colors.grey[150],
                            child: Container(
                              // height: size.height,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children:  [
                                        Text(
                                          'Available Tests',
                                          style: TextStyle(
                                              fontFamily: 'OpenSans-Bold',
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: (){
                                            Get.toNamed('/category');
                                          },
                                          child: Text(
                                            'View all',
                                            style: TextStyle(
                                                fontFamily: 'RobotoSlab',
                                                color: kPrimaryColor,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 200,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            child: AvailableTests(
                                              name: controller.AvailableTestList[index].name,
                                              category: controller.AvailableTestList[index].testCategoryId.toString(),
                                              picture: controller.AvailableTestList[index].image,
                                              price: controller.AvailableTestList[index].price.toString(),
                                              description: controller.AvailableTestList[index].description.toString(),
                                            ),
                                            onTap: () {
                                              Get.toNamed(
                                                  '/productdetailsView',
                                                  arguments: controller.AvailableTestList[index]);

                                            },

                                          );
                                        },
                                        separatorBuilder: (context, index) => Container(
                                          height: 1.0,
                                          color: Colors.grey[300],
                                        ),
                                        itemCount: controller.AvailableTestList.length,
                                      )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }
        });
      },
    );
  }
}