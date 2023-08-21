import 'package:get/get.dart';

import '../controllers/past_appointments_controller.dart';

class PastAppointmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PastAppointmentsController>(
      () => PastAppointmentsController(),
    );
  }
}
