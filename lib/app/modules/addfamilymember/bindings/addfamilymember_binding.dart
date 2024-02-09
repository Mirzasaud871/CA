import 'package:get/get.dart';

import '../controllers/addfamilymember_controller.dart';

class AddfamilymemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddfamilymemberController>(
      () => AddfamilymemberController(),
    );
  }
}
