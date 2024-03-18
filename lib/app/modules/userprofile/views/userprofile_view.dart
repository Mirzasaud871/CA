import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vakil99/constants.dart';
import '../controllers/userprofile_controller.dart';

class UserprofileView extends GetView<UserprofileController> {
  UserprofileView({Key? key}) : super(key: key);
  UserprofileController userprofileController =
  Get.put(UserprofileController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text("Settings",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
         IconButton(
             onPressed: (){
               Get.bottomSheet(
                   bottomSheet(),
                   barrierColor: Colors.transparent,
                   isDismissible: true,
                   backgroundColor: Colors.white);
             },
             icon:  Icon(Icons.edit_document,color: Colors.white,),),
          SizedBox(width: 16,),
        ],
      ),

      body: SafeArea(
          child: Stack(children: [
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                            bottomSheet(),
                            barrierColor: Colors.transparent,
                            isDismissible: true,
                            backgroundColor: Colors.white);
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                  colors: [Colors.white, Colors.white38]),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(200)),
                        child: Obx(() {
                          return Stack(
                            children: [
                              SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(200),
                                      child: userprofileController.profileImage !=
                                          ''
                                          ? ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          child: Image.network(
                                              userprofileController
                                                  .profileImage.value,
                                              fit: BoxFit.fill))
                                          : const Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Profile',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: Colors.black45),
                                            ),
                                            Icon(
                                              Icons.add_a_photo,
                                              size: 18,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ))),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    margin:
                                    EdgeInsets.only(top: 10.0, left: 10.0),
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100)),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 20,
                                    )),
                              )
                            ],
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      width: 14.0,
                    ),
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${userprofileController.getuserName}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.060,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.4),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Row(
                            children: [
                              Icon(Icons.email, color: Colors.white, size: 16),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                "${userprofileController.getemail}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.040,
                                    letterSpacing: 0.4),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                "${userprofileController.getmobile}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.040,
                                    letterSpacing: 0.4),
                              ),
                            ],
                          )
                        ],
                      );
                    })
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 130.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Trade Name :",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                        child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "${userprofileController.gettradeName}",
                              focusColor: primaryColor,
                              suffixIcon: const Icon(Icons.drive_file_rename_outline),
                              suffixIconColor: primaryColor,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "DIN Number :",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                        child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "${userprofileController.getdinNumber}",
                              focusColor: primaryColor,
                              suffixIcon: const Icon(Icons.confirmation_number),
                              suffixIconColor: primaryColor,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Pan Number :",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                        child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "${userprofileController.getpanNumber}",
                              focusColor: primaryColor,
                              suffixIcon: const Icon(Icons.file_copy),
                              suffixIconColor: primaryColor,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),

                    //PanCard image
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Pan Card :",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 2.0),
                      child: Obx(() {
                        return Container(
                            height: 200,
                            padding: EdgeInsets.all(2.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(
                                      colors: [Colors.red, Colors.green]),
                                  width: 2,
                                ),
                                color: primaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(18)),
                            child: userprofileController.panI != ''
                                ? ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.network(
                                    userprofileController.panI.value,
                                    fit: BoxFit.fill))
                                : const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Pan Card',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45),
                                  ),
                                  Icon(
                                    Icons.add_a_photo,
                                    size: 30,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ));
                      }),
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Aadhar Number :",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                        child: TextField(
                          readOnly: true,
                            decoration: InputDecoration(
                              hintText: "${userprofileController
                                  .getaadharNumber}",
                              focusColor: primaryColor,
                              suffixIcon: const Icon(Icons.file_copy),
                              suffixIconColor: primaryColor,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                              ),
                            )),
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),

                    //Aadhaar Front
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Aadhar Card :",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 2.0),
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.green]),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Obx(() {
                          return Container(
                              decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(18)),
                              child: userprofileController.aadharI != ''
                                  ? ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.network(
                                      userprofileController.aadharI.value,
                                      fit: BoxFit.fill))
                                  : const Center(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Aadhar',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                    ),
                                    Icon(
                                      Icons.add_a_photo,
                                      size: 30,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ));
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
    );
  }
  Widget bottomSheet(){
    return Container(
            height: 1000,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Colors.white,
                border: Border.all(
                    color: Colors.grey, width: 2)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16,),
                  Container(
                    width: 360,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Profile image
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.green
                                ]),
                            width: 2,
                          ),
                          borderRadius:
                          BorderRadius.circular(20)),
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
                                      .getPanCardImage(
                                      ImageSource
                                          .gallery);
                                },
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                      height: 100,
                                      width:
                                      double.infinity,
                                      decoration:
                                      BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            5),
                                      ),
                                      child: const Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                        children: [
                                          Icon(
                                            CupertinoIcons
                                                .photo_on_rectangle,
                                            size: 50,
                                            color: Colors
                                                .white,
                                          ),
                                          Text(
                                            "Gallery",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize:
                                                15),
                                          )
                                        ],
                                      )),
                                ),
                              ),
                              cancel: InkWell(
                                onTap: () {
                                  Get.back();
                                  userprofileController
                                      .getProImage(
                                      ImageSource
                                          .camera);
                                },
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                      height: 100,
                                      width:
                                      double.infinity,
                                      decoration:
                                      BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            5),
                                      ),
                                      child: const Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                        children: [
                                          Icon(
                                            CupertinoIcons
                                                .camera_on_rectangle,
                                            size: 50,
                                            color: Colors
                                                .white,
                                          ),
                                          Text(
                                            "Camera",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize:
                                                15),
                                          )
                                        ],
                                      )),
                                ),
                              ));
                        },
                        child: Obx(() {
                          return Container(
                              decoration: BoxDecoration(
                                  color: primaryColor
                                      .withOpacity(0.2),
                                  borderRadius:
                                  BorderRadius.circular(
                                      18)),
                              child: userprofileController
                                  .getProfileImage !=
                                  ''
                                  ? ClipRRect(
                                  borderRadius:
                                  BorderRadius
                                      .circular(18),
                                  child: Image.file(
                                      File(
                                          userprofileController
                                              .getProfileImage
                                              .value),
                                      fit: BoxFit.fill))
                                  : const Center(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      'Pan Card',
                                      style: TextStyle(
                                          fontSize:
                                          25,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          color: Colors
                                              .black45),
                                    ),
                                    Icon(
                                      Icons
                                          .add_a_photo,
                                      size: 30,
                                      color:
                                      Colors.grey,
                                    )
                                  ],
                                ),
                              ));
                        }),
                      ),
                    ),
                  ),

                  //name
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: TextField(
                        controller: userprofileController
                            .nameController,
                        decoration: InputDecoration(
                          hintText: "Name",
                          suffixIcon: const Icon(Icons
                              .drive_file_rename_outline),
                          suffixIconColor: primaryColor,
                          focusedBorder:
                          const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(100),
                            borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2),
                          ),
                        )),
                  ),

                  //tradename
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: TextField(
                        controller: userprofileController
                            .tradeNameController,
                        decoration: InputDecoration(
                          hintText: "Trade Name",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons
                              .drive_file_rename_outline),
                          suffixIconColor: primaryColor,
                          focusedBorder:
                          const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(100),
                            borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2),
                          ),
                        )),
                  ),

                  //email
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: TextField(
                        controller: userprofileController
                            .emailController,
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons
                              .drive_file_rename_outline),
                          suffixIconColor: primaryColor,
                          focusedBorder:
                          const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(100),
                            borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2),
                          ),
                        )),
                  ),

                  //din number
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: TextField(
                        controller: userprofileController
                            .dinNumberController,
                        decoration: InputDecoration(
                          hintText: "Din Number",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(
                              Icons.confirmation_number),
                          suffixIconColor: primaryColor,
                          focusedBorder:
                          const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(100),
                            borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2),
                          ),
                        )),
                  ),

                  //pan number
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: TextField(
                        controller: userprofileController
                            .panController,
                        decoration: InputDecoration(
                          hintText: "Pan Number",
                          focusColor: primaryColor,
                          suffixIcon:
                          const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder:
                          const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(100),
                            borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2),
                          ),
                        )),
                  ),

                  //PanCard image
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.green
                                ]),
                            width: 2,
                          ),
                          borderRadius:
                          BorderRadius.circular(20)),
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
                                      .getPanCardImage(
                                      ImageSource
                                          .gallery);
                                },
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                      height: 100,
                                      width:
                                      double.infinity,
                                      decoration:
                                      BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            5),
                                      ),
                                      child: const Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                        children: [
                                          Icon(
                                            CupertinoIcons
                                                .photo_on_rectangle,
                                            size: 50,
                                            color: Colors
                                                .white,
                                          ),
                                          Text(
                                            "Gallery",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize:
                                                15),
                                          )
                                        ],
                                      )),
                                ),
                              ),
                              cancel: InkWell(
                                onTap: () {
                                  Get.back();
                                  userprofileController
                                      .getPanCardImage(
                                      ImageSource
                                          .camera);
                                },
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                      height: 100,
                                      width:
                                      double.infinity,
                                      decoration:
                                      BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            5),
                                      ),
                                      child: const Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                        children: [
                                          Icon(
                                            CupertinoIcons
                                                .camera_on_rectangle,
                                            size: 50,
                                            color: Colors
                                                .white,
                                          ),
                                          Text(
                                            "Camera",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize:
                                                15),
                                          )
                                        ],
                                      )),
                                ),
                              ));
                        },
                        child: Obx(() {
                          return Container(
                              decoration: BoxDecoration(
                                  color: primaryColor
                                      .withOpacity(0.2),
                                  borderRadius:
                                  BorderRadius.circular(
                                      18)),
                              child: userprofileController
                                  .getpanImage !=
                                  ''
                                  ? ClipRRect(
                                  borderRadius:
                                  BorderRadius
                                      .circular(18),
                                  child: Image.file(
                                      File(userprofileController
                                          .getpanImage
                                          .value,),
                                      fit: BoxFit.fill))
                                  : const Center(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      'Pan Card',
                                      style: TextStyle(
                                          fontSize:
                                          25,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          color: Colors
                                              .black45),
                                    ),
                                    Icon(
                                      Icons
                                          .add_a_photo,
                                      size: 30,
                                      color:
                                      Colors.grey,
                                    )
                                  ],
                                ),
                              ));
                        }),
                      ),
                    ),
                  ),

                  //aadhar number
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: TextField(
                        controller: userprofileController
                            .aadharController,
                        decoration: InputDecoration(
                          hintText: "Aadhar Number",
                          focusColor: primaryColor,
                          suffixIcon:
                          const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder:
                          const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(100),
                            borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2),
                          ),
                        )),
                  ),

                  //Aadhaar Front
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.green
                                ]),
                            width: 2,
                          ),
                          borderRadius:
                          BorderRadius.circular(20)),
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
                                  userprofileController
                                      .getAadhaarFrontImage(
                                      ImageSource
                                          .gallery);
                                },
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                      height: 100,
                                      width:
                                      double.infinity,
                                      decoration:
                                      BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            5),
                                      ),
                                      child: const Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                        children: [
                                          Icon(
                                            CupertinoIcons
                                                .photo_on_rectangle,
                                            size: 50,
                                            color: Colors
                                                .white,
                                          ),
                                          Text(
                                            "Gallery",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize:
                                                15),
                                          )
                                        ],
                                      )),
                                ),
                              ),
                              cancel: InkWell(
                                onTap: () {
                                  Get.back();
                                  userprofileController
                                      .getAadhaarFrontImage(
                                      ImageSource
                                          .camera);
                                },
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                      height: 100,
                                      width:
                                      double.infinity,
                                      decoration:
                                      BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            5),
                                      ),
                                      child: const Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                        children: [
                                          Icon(
                                            CupertinoIcons
                                                .camera_on_rectangle,
                                            size: 50,
                                            color: Colors
                                                .white,
                                          ),
                                          Text(
                                            "Camera",
                                            style: TextStyle(
                                                color: Colors
                                                    .white,
                                                fontSize:
                                                15),
                                          ),
                                        ],
                                      )),
                                ),
                              ));
                        },
                        child: Obx(() {
                          return Container(
                              decoration: BoxDecoration(
                                  color: primaryColor
                                      .withOpacity(0.2),
                                  borderRadius:
                                  BorderRadius.circular(
                                      18)),
                              child: userprofileController
                                  .getaadharImage !=
                                  ''
                                  ? ClipRRect(
                                  borderRadius:
                                  BorderRadius
                                      .circular(18),
                                  child: Image.file(
                                      File(userprofileController
                                          .getaadharImage
                                          .value,),
                                      fit: BoxFit.fill))
                                  : const Center(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      'Aadhar',
                                      style: TextStyle(
                                          fontSize:
                                          25,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          color: Colors
                                              .black45),
                                    ),
                                    Icon(
                                      Icons
                                          .add_a_photo,
                                      size: 30,
                                      color:
                                      Colors.grey,
                                    )
                                  ],
                                ),
                              ));
                        }),
                      ),
                    ),
                  ),


                  InkWell(
                    onTap: () {
                      userprofileController.updateProfile(
                        {
                          'name': userprofileController
                              .nameController.text,
                          'trade': userprofileController
                              .tradeNameController.text,
                          'email': userprofileController
                              .emailController.text,
                          'mobile_no': userprofileController
                              .mobileController.text,
                          'din_no': userprofileController
                              .dinNumberController.text,
                          'pan': userprofileController
                              .panController.text,
                          'aadhar': userprofileController
                              .aadharController.text,
                          'pan_image': userprofileController
                              .getpanImage.value,
                          'aadhar_image':
                          userprofileController
                              .getaadharImage.value,
                          'image': userprofileController
                              .getProfileImage.value,
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 8.0),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(10),
                        color: primaryColor,
                      ),
                      child: const Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight
                                    .bold),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ));
  }
}
