import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants.dart';
import '../controllers/addfamilymember_controller.dart';

class AddfamilymemberView extends GetView<AddfamilymemberController> {
  AddfamilymemberView({Key? key}) : super(key: key);
  AddfamilymemberController addfamilymemberController = Get.put(AddfamilymemberController());
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
        title: const Text('Add Members',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 5,
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    labelText: "Enter your name",
                    focusColor: primaryColor,
                    suffixIcon: Icon(Icons.person_2),
                    suffixIconColor: primaryColor,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                  )),
              SizedBox(
                height: 15,
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: "Trade Name",
                    labelText: "Trade name",
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
                  )),
              SizedBox(
                height: 15,
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: "emial@gmail.com",
                    labelText: "Enter your email",
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
                  )),

              SizedBox(
                height: 15,
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: "+91 Mobile",
                    labelText: "Mobile number",
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
                  )),

              SizedBox(
                height: 15,
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: "DIN Number",
                    labelText: "DIN No. (Optional)",
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
                  )),

              SizedBox(
                height: 15,
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: "PAN Number",
                    labelText: "Pan card",
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
                  )),

              SizedBox(
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
                            addfamilymemberController
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
                            addfamilymemberController
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
                        child: addfamilymemberController.panCard.value != ''
                            ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                                File(addfamilymemberController.panCard.value),
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

              SizedBox(
                height: 15,
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: "Aadhar Number",
                    labelText: "Aadhar card",
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
                  )),

              //Aadhaar Front
              SizedBox(
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
                            addfamilymemberController.getAadhaarFrontImage(
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
                            addfamilymemberController.getAadhaarFrontImage(
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
                        child: addfamilymemberController.aadhaarFront.value != ''
                            ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                                File(addfamilymemberController.aadhaarFront.value),
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

              SizedBox(height: 15,),
              Container(
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
              SizedBox(height: 10,),

            ]),
          ),
        ),
      ),
    );
  }
}
