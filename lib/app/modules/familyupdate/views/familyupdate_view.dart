import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants.dart';
import '../controllers/familyupdate_controller.dart';

class FamilyupdateView extends GetView<FamilyupdateController> {
  FamilyupdateView({Key? key}) : super(key: key);
  FamilyupdateController familyupdateController = Get.put(
      FamilyupdateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white,)),
        backgroundColor: primaryColor,
        title: const Text(
          'Update Members', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: familyupdateController.formKeyFamilyUpdate,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [

                Container(
                  padding: EdgeInsets.all(6),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient:
                        LinearGradient(colors: [Colors.red, Colors.green]),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  child: InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          middleText: 'Select Image',
                          title: 'Profile Image',
                          barrierDismissible: true,
                          radius: 5.0,
                          confirm: InkWell(
                            onTap: () {
                              Get.back();
                              familyupdateController
                                  .getProfileImage(ImageSource.gallery);
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.photo_on_rectangle,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Gallery",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          cancel: InkWell(
                            onTap: () {
                              Get.back();
                              familyupdateController
                                  .getProfileImage(ImageSource.camera);
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.camera_on_rectangle,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Camera",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )
                                    ],
                                  )),
                            ),
                          ));
                    },
                    child: Obx(() {
                      return Container(
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4)),
                          child: familyupdateController.getprofileImage.value == ''
                              ? ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network("${familyupdateController.getProfile.value}",
                                  fit: BoxFit.cover)
                          )
                              : ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.file(
                                File("${familyupdateController.getprofileImage.value}"),
                              fit: BoxFit.cover)
                          ));
                    }),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name is Required";
                        }
                        return null;
                      },
                      controller: familyupdateController.nameController,
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        labelText: "${familyupdateController.getName.value}",
                        focusColor: primaryColor,
                        suffixIcon: Icon(Icons.person_2),
                        suffixIconColor: primaryColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                      )
                  );
                }),
                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Trade is Required";
                        }
                        return null;
                      },
                      controller: familyupdateController.tradeNameController,
                      decoration: InputDecoration(
                        hintText: "Trade Name",
                        labelText: "${familyupdateController.getTradename
                            .value}",
                        focusColor: primaryColor,
                        suffixIcon: Icon(Icons.drive_file_rename_outline),
                        suffixIconColor: primaryColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ));
                }),
                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is Required";
                        } else if (value.isEmail) {
                          return "Please enter Valid email";
                        }
                        return null;
                      },
                      controller: familyupdateController.emailController,
                      decoration: InputDecoration(
                        hintText: "emial@gmail.com",
                        labelText: "${familyupdateController.getEmail.value}",
                        focusColor: primaryColor,
                        suffixIcon: Icon(Icons.mail),
                        suffixIconColor: primaryColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ));
                }),

                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile number is Required";
                        }
                        return null;
                      },
                      controller: familyupdateController.mobileController,
                      decoration: InputDecoration(
                        hintText: "+91 0000000000",
                        labelText: "${familyupdateController.getMobile.value}",
                        focusColor: primaryColor,
                        suffixIcon: Icon(Icons.phone),
                        suffixIconColor: primaryColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ));
                }),

                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Din number is Required";
                        }
                        return null;
                      },
                      controller: familyupdateController.dinNumberController,
                      decoration: InputDecoration(
                        hintText: "DIN Number",
                        labelText: "${familyupdateController.getDinNo.value}",
                        focusColor: primaryColor,
                        suffixIcon: Icon(Icons.confirmation_number),
                        suffixIconColor: primaryColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ));
                }),

                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Pan number is Required";
                        }
                        return null;
                      },
                      controller: familyupdateController.panController,
                      decoration: InputDecoration(
                        hintText: "PAN Number",
                        labelText: "${familyupdateController.getPancard.value}",
                        focusColor: primaryColor,
                        suffixIcon: Icon(Icons.file_copy),
                        suffixIconColor: primaryColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ));
                }),

                SizedBox(
                  height: 15,
                ),
                //PanCard
                Container(
                  padding: EdgeInsets.all(6),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient:
                        LinearGradient(colors: [Colors.red, Colors.green]),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  child: InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          middleText: 'Select Image',
                          title: 'Pan Card Image',
                          barrierDismissible: true,
                          radius: 5.0,
                          confirm: InkWell(
                            onTap: () {
                              Get.back();
                              familyupdateController
                                  .getPanCardImage(ImageSource.gallery);
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.photo_on_rectangle,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Gallery",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          cancel: InkWell(
                            onTap: () {
                              Get.back();
                              familyupdateController
                                  .getPanCardImage(ImageSource.camera);
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.camera_on_rectangle,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Camera",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )
                                    ],
                                  )),
                            ),
                          ));
                    },
                    child: Obx(() {
                      return Container(
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4)),
                          child: familyupdateController.getpanImage.value == ''
                              ? ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network("${familyupdateController.getPanImage.value}",
                                  fit: BoxFit.cover)
                          )
                              : ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.file(
                                  File("${familyupdateController.getpanImage.value}"),
                                  fit: BoxFit.cover)
                          ));
                    }),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Aadhar number is Required";
                        }
                        return null;
                      },
                      controller: familyupdateController.aadharController,
                      decoration: InputDecoration(
                        hintText: "Aadhar Number",
                        labelText: "${familyupdateController.getAadharcard
                            .value}",
                        focusColor: primaryColor,
                        suffixIcon: Icon(Icons.file_copy),
                        suffixIconColor: primaryColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ));
                }),

                //Aadhaar Front
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient:
                        LinearGradient(colors: [Colors.red, Colors.green]),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  child: InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          middleText: 'Select ',
                          title: 'Aadhaar Image',
                          barrierDismissible: true,
                          radius: 5.0,
                          confirm: InkWell(
                            onTap: () {
                              Get.back();
                              familyupdateController.getAadhaarImage(
                                  ImageSource.gallery);
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons
                                            .photo_on_rectangle,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Gallery",
                                        style: TextStyle(
                                            color: Colors
                                                .white,
                                            fontSize: 15),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          cancel: InkWell(
                            onTap: () {
                              Get.back();
                              familyupdateController.getAadhaarImage(
                                  ImageSource.camera);
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons
                                            .camera_on_rectangle,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Camera",
                                        style: TextStyle(
                                            color: Colors
                                                .white,
                                            fontSize: 15),
                                      )
                                    ],
                                  )),
                            ),
                          ));
                    },
                    child: Obx(() {
                      return Container(
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4)),
                          child: familyupdateController.getaadharImage.value == ''
                              ? ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network("${familyupdateController.getAadharImage.value}",
                                  fit: BoxFit.cover)
                          )
                              : ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.file(
                                  File("${familyupdateController.getaadharImage.value}"),
                                  fit: BoxFit.cover)
                          ));
                    }),
                  ),
                ),

                SizedBox(height: 15,),
                InkWell(
                  onTap: () {
                    if (familyupdateController.nameController.text.isEmpty &&
                        familyupdateController.tradeNameController.text
                            .isEmpty &&
                        familyupdateController.emailController.text.isEmpty &&
                        familyupdateController.mobileController.text.isEmpty &&
                        familyupdateController.dinNumberController.text
                            .isEmpty &&
                        familyupdateController.panController.text.isEmpty &&
                        familyupdateController.aadharController.text.isEmpty
                    ) {
                      familyupdateController.formKeyFamilyUpdate.currentState!
                          .validate();
                    } else {
                      familyupdateController.UpdateMembers(
                        {
                          'member_id': familyupdateController.getMemberId.toString(),
                          'first_name': familyupdateController.nameController
                              .text,
                          'trade': familyupdateController.tradeNameController
                              .text,
                          'email': familyupdateController.emailController
                              .text,
                          'mobile_no': familyupdateController
                              .mobileController.text,
                          'din_no': familyupdateController
                              .dinNumberController.text,
                          'pan': familyupdateController.panController.text,
                          'aadhar': familyupdateController.aadharController
                              .text,
                          'pan_image': familyupdateController.getpanImage
                              .value,
                          'aadhar_image': familyupdateController
                              .getaadharImage.value,
                          'image': familyupdateController.getprofileImage
                              .value,
                        },
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                SizedBox(height: 10,),

              ]),
            ),
          ),
        ),
      ),
    );
  }
}
