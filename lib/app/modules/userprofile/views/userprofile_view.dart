import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vakil99/constants.dart';
import '../controllers/userprofile_controller.dart';

class UserprofileView extends GetView<UserprofileController> {
  UserprofileView({Key? key}) : super(key: key);
  UserprofileController userprofileController =
  Get.put(UserprofileController());

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
          'Userprofile', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.shade100,
                ),
                child: const Center(
                    child: const Text(
                      "PERSONAL INFORMATION",
                      style: TextStyle(fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(() {
                return TextField(
                    decoration: InputDecoration(
                      labelText: "${userprofileController.name}",
                      hintText: "name",
                      focusColor: primaryColor,
                      suffixIcon: const Icon(Icons.person_2),
                      suffixIconColor: primaryColor,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                    ));
              }),
              const SizedBox(
                height: 15,
              ),
              Obx(() {
                return TextField(
                    decoration: InputDecoration(
                      labelText: "${userprofileController.tradeName}",
                      hintText: "Trade Name",
                      focusColor: primaryColor,
                      suffixIcon: const Icon(Icons.drive_file_rename_outline),
                      suffixIconColor: primaryColor,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.red, width: 2),
                      ),
                    ));
              }),
              const SizedBox(
                height: 15,
              ),
              Obx(() {
                return TextField(
                    decoration: InputDecoration(
                      labelText: "${userprofileController.email}",
                      hintText: "Email",
                      focusColor: primaryColor,
                      suffixIcon: const Icon(Icons.mail),
                      suffixIconColor: primaryColor,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.red, width: 2),
                      ),
                    ));
              }),

              const SizedBox(
                height: 15,
              ),
              Obx(() {
                return TextField(
                    decoration: InputDecoration(
                      labelText: "${userprofileController.mobile}",
                      hintText: "Mobile No.",
                      focusColor: primaryColor,
                      suffixIcon: const Icon(Icons.phone),
                      suffixIconColor: primaryColor,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.red, width: 2),
                      ),
                    ));
              }),

              const SizedBox(
                height: 15,
              ),
              Obx(() {
                return TextField(
                    decoration: InputDecoration(
                      labelText: "${userprofileController.dinNumber}",
                      hintText: "DIN No.",
                      focusColor: primaryColor,
                      suffixIcon: const Icon(Icons.confirmation_number),
                      suffixIconColor: primaryColor,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.red, width: 2),
                      ),
                    ));
              }),

              const SizedBox(
                height: 15,
              ),
              Obx(() {
                return TextField(
                    decoration: InputDecoration(
                      labelText: "${userprofileController.panNumber}",
                      hintText: "Pan Number",
                      focusColor: primaryColor,
                      suffixIcon: const Icon(Icons.file_copy),
                      suffixIconColor: primaryColor,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.red, width: 2),
                      ),
                    ));
              }),

              const SizedBox(
                height: 15,
              ),
              //PanCard
              SizedBox(
                height: 200,
                width: double.infinity,
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
                            userprofileController
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            userprofileController
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            borderRadius: BorderRadius.circular(10)),
                        child: userprofileController.panImage.value != ''
                            ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                                userprofileController.panImage.value,
                                fit: BoxFit.cover)
                        )
                            : const Center(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 80,
                            color: Colors.grey,
                          ),
                        ));
                  }),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Obx(() {
                return TextField(
                    decoration: InputDecoration(
                      labelText: "${userprofileController.aadharNumber}",
                      hintText: "Aadhar Number",
                      focusColor: primaryColor,
                      suffixIcon: const Icon(Icons.file_copy),
                      suffixIconColor: primaryColor,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.red, width: 2),
                      ),
                    ));
              }),

              //Aadhaar Front
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
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
                            userprofileController.getAadhaarFrontImage(
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
                            userprofileController.getAadhaarFrontImage(
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
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: userprofileController.aadharImage.value != ''
                            ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                                userprofileController.aadharImage.value,
                                fit: BoxFit.cover)
                        )
                            : const Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Aadhar', style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45),),
                            Icon(
                              Icons.add_a_photo, size: 30, color: Colors.grey,
                            )
                          ],
                        ),
                        )
                    );
                  }),
                ),
              ),

              const SizedBox(height: 15,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                ),
                child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(height: 10,),

            ]),
          ),
        ),
      ),
    );
  }
}
