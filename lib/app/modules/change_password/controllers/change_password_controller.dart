import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/app/modules/profile/views/profile_view.dart';

import '../../../../apiservices.dart';
import '../../../../constants.dart';

class ChangePasswordController extends GetxController {
  //TODO: Implement ChangePasswordController

  final passwordVisible = false.obs;
  final conpasswordVisible = false.obs;
  final count = 0.obs;
  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
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

  void increment() => count.value++;

  changePassword(String password, String confirm_pass) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? email = preferences.getString(userEmail);
    var res = await ApiServices().postApi(
        changePasswordURL,
        {
          'email' : email,
          'password' : password,
          'confirm_password' : confirm_pass,
        });
    res.fold((l){
      if(l['status'] == 200){
        print('login user compelete $res');
        Get.snackbar(
            "Successful",
            "Password Change",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green
        );
        Get.to(ProfileView());
        passwordController.clear();
        confirmPassController.clear();
      }
    },(r){

    });
  }
}
