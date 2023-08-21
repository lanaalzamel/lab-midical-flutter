import 'package:get/get.dart';

import '../controllers/medical_report_controller.dart';

class MedicalReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalReportController>(
      () => MedicalReportController(),
    );
  }
}
