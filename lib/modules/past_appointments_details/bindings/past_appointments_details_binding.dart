import 'package:get/get.dart';

import '../controllers/past_appointments_details_controller.dart';

class PastAppointmentsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PastAppointmentsDetailsController>(
      () => PastAppointmentsDetailsController(),
    );
  }
}
