import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vakil99/constants.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  ChangePasswordView({Key? key}) : super(key: key);
  ChangePasswordController changePasswordController =
  Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, color: Colors.white,)),
          backgroundColor: primaryColor,
          title: const Text(
            'Change Password', style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: changePasswordController.formkey,
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("New Password"),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: changePasswordController.passwordController,
                        obscureText: changePasswordController.passwordVisible
                            .value,
                        decoration: InputDecoration(
                          hintText: "Password",
                          focusColor: primaryColor,
                          suffixIcon: IconButton(
                            icon: Icon(
                                changePasswordController.passwordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                            onPressed: () {
                              changePasswordController.passwordVisible.value =
                              !changePasswordController.passwordVisible.value;
                            },
                          ),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is Required..";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Confirm New Password"),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: changePasswordController
                            .confirmPassController,
                        obscureText: changePasswordController.conpasswordVisible.value,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          focusColor: primaryColor,
                          suffixIcon: IconButton(
                            icon: Icon(
                                changePasswordController.conpasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                            onPressed: () {
                              changePasswordController.conpasswordVisible.value =
                              !changePasswordController.conpasswordVisible.value;
                            },
                          ),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return "Password is Required..";
                          }else if(changePasswordController.passwordController
                              .text !=
                              changePasswordController.confirmPassController
                                  .text) {
                            return "Required same password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                            child: TextButton(
                                onPressed: () {
                                  if (changePasswordController.passwordController.text.isEmpty &&
                                      changePasswordController.confirmPassController.text.isEmpty) {
                                    changePasswordController.formkey.currentState!.validate();
                                    Get.snackbar('Error', "PLease fill text field",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: redColor);
                                  } else if(changePasswordController
                                      .passwordController.text ==
                                      changePasswordController
                                          .confirmPassController.text) {
                                    changePasswordController.changePassword(
                                      changePasswordController
                                          .passwordController.text,
                                      changePasswordController
                                          .confirmPassController.text,
                                    );
                                  }
                                },
                                child: Text(
                                  "Change Password",
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ))),
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
        ));
  }
}
