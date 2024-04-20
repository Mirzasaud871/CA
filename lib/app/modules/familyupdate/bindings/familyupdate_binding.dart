import 'package:get/get.dart';

import '../controllers/familyupdate_controller.dart';

class FamilyupdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilyupdateController>(
      () => FamilyupdateController(),
    );
  }
}
