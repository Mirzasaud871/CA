import 'package:get/get.dart';

import '../controllers/addcompany_controller.dart';

class AddcompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddcompanyController>(
      () => AddcompanyController(),
    );
  }
}
