import 'package:get/get.dart';

import '../controllers/companymanagment_controller.dart';

class CompanymanagmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanymanagmentController>(
      () => CompanymanagmentController(),
    );
  }
}
