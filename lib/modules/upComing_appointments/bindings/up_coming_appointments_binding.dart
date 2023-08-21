import 'package:get/get.dart';

import '../controllers/up_coming_appointments_controller.dart';

class UpComingAppointmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpComingAppointmentsController>(
      () => UpComingAppointmentsController(),
    );
  }
}
