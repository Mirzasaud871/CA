import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final count = 0.obs;
  var formKey = GlobalKey<FormState>();
  TextEditingController fName = TextEditingController();
  TextEditingController mName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  // int handleradiobutton;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Row add_radio_button(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:[

        Radio(
          activeColor: Colors.green,
          value: btnValue,
          groupValue: 1,
          onChanged: count,
        ),
        Text(title)
      ],
    );
  }

  moveTohome(BuildContext context) async {
    if(formKey.currentState!.validate()){
      // await Future.delayed(Duration(seconds: 1));
      await Get.offAll(HomeView());
    }
  }

  void increment() => count.value++;
}
