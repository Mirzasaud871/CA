import 'package:get/get.dart';

import '../controllers/companyupdate_controller.dart';

class CompanyupdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyupdateController>(
      () => CompanyupdateController(),
    );
  }
}
