import 'package:get/get.dart';

import '../controllers/createpassword_controller.dart';

class CreatepasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatepasswordController>(
      () => CreatepasswordController(),
    );
  }
}
