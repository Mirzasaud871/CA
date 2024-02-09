import 'dart:io';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vakil99/constants.dart';

import '../controllers/document_controller.dart';

class DocumentView extends GetView<DocumentController> {
  DocumentView({Key? key}) : super(key: key);
  DocumentController documentController = Get.put(DocumentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white,)),
          backgroundColor: primaryColor,
          title: const Text('My Document',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  // dialoge box
                  Row(
                    children: [
                      const Text(
                        "Documents",
                        style: TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            Container(
                                height: 500,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0)),
                                  color: Colors.grey.shade100,
                                  border: Border.all(color: Colors.grey.shade300,width: 2)
                                ),
                                child:SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        const Center(child: const Text("Document Details",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                                        const SizedBox(height: 15,),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0, vertical: 10.0),
                                          height: 45,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(6.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.shade400,
                                                  blurRadius: 6.0,
                                                ),
                                              ]),
                                          child: const Text(
                                            "Name",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Obx(() {
                                          return Container(
                                            padding:
                                            const EdgeInsets.symmetric(horizontal: 10.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(6.0),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.shade400,
                                                    blurRadius: 6.0,
                                                  ),
                                                ]),
                                            child: DropdownButton(
                                              menuMaxHeight: 300.0,
                                              borderRadius: BorderRadius.circular(10.0),
                                              underline: const SizedBox(),
                                              elevation: 5,
                                              isExpanded: true,
                                              // Initial Value
                                              value: documentController
                                                  .dropdownvalue.value,
                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              // Array list of items
                                              items: documentController.items.value
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(
                                                    items,
                                                    style: const TextStyle(fontSize: 16),
                                                  ),
                                                );
                                              }).toList(),

                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                documentController
                                                    .dropdownvalue.value = newValue!;
                                              },
                                            ),
                                          );
                                        }),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Obx(() {
                                          return Container(
                                            padding:
                                            const EdgeInsets.symmetric(horizontal: 6.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(6.0),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.shade400,
                                                    blurRadius: 6.0,
                                                  ),
                                                ]),
                                            child: DropdownButton(
                                              underline: const SizedBox(),
                                              elevation: 5,
                                              isExpanded: true,
                                              // Initial Value
                                              value: documentController
                                                  .dropdownvalue2.value,
                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              // Array list of items
                                              items: documentController.items2.value
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(
                                                    items,
                                                    style: const TextStyle(fontSize: 16),
                                                  ),
                                                );
                                              }).toList(),

                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                documentController
                                                    .dropdownvalue2.value = newValue!;
                                              },
                                            ),
                                          );
                                        }),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        InkWell(onTap: () {
                                          documentController
                                              .selectImage(ImageSource.gallery);
                                        }, child: Obx(() {
                                          return Container(
                                            decoration: BoxDecoration(
                                                color: primaryColor.withOpacity(0.2),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            child: documentController
                                                .imagesCollect.value !=
                                                ''
                                                ? ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                child: Image.file(
                                                    File(documentController
                                                        .imagesCollect.value),
                                                    fit: BoxFit.cover))
                                                : Card(
                                              elevation: 5,
                                              child: Container(
                                                  height: 150,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                    BorderRadius.circular(
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
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        "Gallery",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          );
                                        })),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          height: 50,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                              color: Colors.blue),
                                          child: const Center(
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            barrierColor: Colors.transparent,
                            isDismissible: true,
                            backgroundColor: Colors.white
                          );
                        },
                        child: Container(
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.green.shade400,
                            ),
                            child: const Center(
                                child: Text(
                              "Add Document",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ))),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                      height: Get.width * 1.98,
                      child: GridView.builder(
                        itemCount: 3,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:2,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0,
                          childAspectRatio: 0.88,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return DelayedDisplay(
                            delay: const Duration(milliseconds: 300),
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              height: Get.width * 1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 6.0,
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [

                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6.0)
                                      ),
                                      child: Image.asset(
                                          "assets/images/aadar.jpg",),
                                    ),
                                    const SizedBox(height: 6,),

                                    const Text("User Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    const Text("Aadharfront",style: TextStyle(fontSize: 16,color: Colors.grey),),

                                    const Row(
                                      children: [
                                        Spacer(),
                                        Icon(Icons.file_download,color: primaryColor,)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
