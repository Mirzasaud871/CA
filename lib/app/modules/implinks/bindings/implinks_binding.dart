import 'package:get/get.dart';

import '../controllers/implinks_controller.dart';

class ImplinksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImplinksController>(
      () => ImplinksController(),
    );
  }
}
