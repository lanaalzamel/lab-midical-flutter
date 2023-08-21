import 'package:get/get.dart';

import '../controllers/up_coming_appointments_details_controller.dart';

class UpComingAppointmentsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpComingAppointmentsDetailsController>(
      () => UpComingAppointmentsDetailsController(),
    );
  }
}
