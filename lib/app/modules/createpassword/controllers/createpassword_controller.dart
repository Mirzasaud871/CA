import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../apiservices.dart';
import '../../../../constants.dart';

class CreatepasswordController extends GetxController {
  //TODO: Implement CreatepasswordController

  final formKey = GlobalKey<FormState>();
  late RoundedLoadingButtonController loadingButtonController;

  late TextEditingController passController = TextEditingController();
  late TextEditingController confirmPassController = TextEditingController();
  
  @override
  void onInit() {
    print(userEmail);
    super.onInit();
    loadingButtonController = RoundedLoadingButtonController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
