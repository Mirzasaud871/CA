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
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.arrow_back,color: Colors.white,)),
          backgroundColor: primaryColor,
          title: const Text('Change Password',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: changePasswordController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Email Address"),
                    TextFormField(
                      controller: changePasswordController.email,
                      decoration: InputDecoration(
                        hintText: "emial@gmail.com",
                        focusColor: primaryColor,
                        suffixIcon: Icon(Icons.mail),
                        suffixIconColor: primaryColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "email is Required..";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("New Password"),
                    TextFormField(
                      controller: changePasswordController.password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        focusColor: primaryColor,
                        suffixIcon: Icon(Icons.visibility),
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
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Confirm New Password"),
                    TextFormField(
                      controller: changePasswordController.confirmPass,
                      decoration: InputDecoration(
                        hintText: "Confirm Pass...",
                        focusColor: primaryColor,
                        suffixIcon: Icon(Icons.visibility),
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
                                if (changePasswordController
                                    .formKey.currentState!
                                    .validate()) {
                                  // TODO submit
                                }
                              },
                              child: Text(
                                "Change Password",
                                style: TextStyle(color: Colors.white),
                              ))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
