import 'dart:async';

import 'package:get/get.dart';
import 'package:lab_app/app/modules/onBoarding_screen/views/on_boarding_screen_view.dart';

class SplashController extends GetxController {



  @override
  void onInit() {
    super.onInit();
    Timer(
      Duration(seconds: 3),
          () => Get.to(OnBoardingScreenView())
      );


  }


}
