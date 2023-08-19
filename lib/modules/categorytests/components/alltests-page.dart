import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:labapp/modules/categorytests/category_controller.dart';
List<CategoryTestsBody> categorytests = [
  CategoryTestsBody(
    category: 'blood',
    colorIndex: 0,
  ),
  CategoryTestsBody(
    category: 'Vitamens',
    colorIndex: 1,
  ),
  CategoryTestsBody(
    category: 'Hematology',
    colorIndex: 2,
  ),
  CategoryTestsBody(
    category: 'blood test',
    colorIndex: 3,
  ),
  CategoryTestsBody(
    category: 'blood test',
    colorIndex: 4,
  ),
  CategoryTestsBody(
    category: 'blood test',
    colorIndex: 2,
  ),
];

List<Map<String, Color>> color = [
  {"color": Color(0xFF0087bb)},
  {"color": Color(0xFF36a5d1)},
  {"color": Color(0xFF69a0b5)},
  {"color": Color(0xFF7093a1)},
];

class CategoryTestsBody extends StatelessWidget {
  CategoryController controller =Get.find();
   CategoryTestsBody({
    Key? key,
    required this.category,
    required this.colorIndex,
  }) : super(key: key);

  final String category;
  final int? colorIndex;

  @override
  Widget build(BuildContext context) {
    print('sssss');
    final int index = colorIndex?.remainder(color.length) ?? 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
        child: Card(
          color: color[index]["color"],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //  'asset/images/test-tubes-svgrepo-com.svg',
              //   width: 30,
              //   height: 30,
              //   color: Colors.white,
              // ),
              Center(
                child: Text(
                controller.categoryList[index].name,
                  style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
