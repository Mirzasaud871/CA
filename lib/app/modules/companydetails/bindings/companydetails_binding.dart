import 'package:get/get.dart';

import '../controllers/companydetails_controller.dart';

class CompanydetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanydetailsController>(
      () => CompanydetailsController(),
    );
  }
}
