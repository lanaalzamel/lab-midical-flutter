import 'package:flutter/material.dart';
import 'package:labapp/colors.dart';
import 'package:labapp/modules/categorytests/category_controller.dart';
import 'package:labapp/modules/categorytests/components/alltests-page.dart';
import 'package:get/get.dart';

class body extends StatelessWidget {
  CategoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Category of tests:',
            style: TextStyle(fontFamily: 'OpenSans-Bold', color: kTextColor),
          ),
        ),
        Expanded(child: Obx(() {
          if (controller.isLoding.isTrue) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
              itemCount: controller.categoryList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                CategoryTestsBody item = categorytests[index];
                return GestureDetector(
                  onTap: () {
                    print(controller.categoryList[index].name);
                  },
                  child: CategoryTestsBody(
                    category: item.category,
                    colorIndex: item.colorIndex,
                  ),
                );
              });
        }
        )
        ),
      ],
    );
  }
}
