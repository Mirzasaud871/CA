import 'package:get/get.dart';

import '../controllers/familymember_controller.dart';

class FamilymemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilymemberController>(
      () => FamilymemberController(),
    );
  }
}
