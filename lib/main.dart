import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labapp/getx_binding/Classified_Tests_binding.dart';
import 'package:labapp/getx_binding/cart_binding.dart';
import 'package:labapp/modules/Cart/cart.dart';
import 'package:labapp/modules/labpage/lab_page.dart';
import 'package:labapp/colors.dart';
import 'package:labapp/test.dart';

import 'getx_binding/ProductDetailsBinding.dart';
import 'getx_binding/category_binding.dart';
import 'getx_binding/lab_page_binding.dart';
import 'modules/categorytests/category_tests.dart';
import 'modules/classified tests/classified_tests_page.dart';
import 'modules/labpage/component/available_tests.dart';
import 'modules/test_details/product_details_controller.dart';
import 'modules/test_details/test_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/lab',
      getPages: [
        GetPage(name: '/category', page: () => AllTests(), binding: CategoryBinding()),
        GetPage(name: '/classifiedtests', page: () => ClassifiedTests(), binding: ClassifiedTestsBinding()),
        GetPage(name: '/productdetailsView', page: () =>  ProductDetailsView(testItem: TestDetailed(''.toString(), ''.toString(), ''.toString(),''.toString(),''.toString())), binding: ProductDetailsViewBinding(),),
        GetPage(name: '/lab', page: () => labPage(), binding: LabPageBinding()),
        GetPage(name: '/cart', page: () => Cart(), binding: CartBinding()),

      ],
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
