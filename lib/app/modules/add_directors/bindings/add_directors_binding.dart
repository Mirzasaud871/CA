import 'package:get/get.dart';

import '../controllers/add_directors_controller.dart';

class AddDirectorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDirectorsController>(
      () => AddDirectorsController(),
    );
  }
}
