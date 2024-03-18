import 'dart:io';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vakil99/constants.dart';

import '../controllers/document_controller.dart';

class DocumentView extends GetView<DocumentController> {
  DocumentView({Key? key}) : super(key: key);
  DocumentController documentController = Get.put(DocumentController());

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
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white,)),
          backgroundColor: primaryColor,
          title: const Text(
            'My Document', style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            documentController.getDocument();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // dialoge box
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
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
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(25.0),
                                              topRight: Radius.circular(25.0)),
                                          color: Colors.grey.shade100,
                                          border: Border.all(
                                              color: Colors.grey.shade300, width: 2)
                                      ),
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              const Center(child: const Text(
                                                "Document Details",
                                                style: TextStyle(fontSize: 22,
                                                    fontWeight: FontWeight.bold),)),
                                              const SizedBox(height: 15,),
                                              Obx(() {
                                                return Container(
                                                  padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(6.0),
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .shade400,
                                                          blurRadius: 6.0,
                                                        ),
                                                      ]),
                                                  child: DropdownButton(
                                                    menuMaxHeight: 300.0,
                                                    borderRadius: BorderRadius
                                                        .circular(10.0),
                                                    underline: const SizedBox(),
                                                    elevation: 5,
                                                    isExpanded: true,
                                                    // Initial Value
                                                    value: documentController
                                                        .document_For.value,
                                                    // Down Arrow Icon
                                                    icon: const Icon(
                                                        Icons.keyboard_arrow_down),
                                                    // Array list of items
                                                    items: documentController.items
                                                        .value
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(
                                                          items,
                                                          style: const TextStyle(
                                                              fontSize: 16),
                                                        ),
                                                      );
                                                    }).toList(),

                                                    // After selecting the desired option,it will
                                                    // change button value to selected value
                                                    onChanged: (String? newValue) {
                                                      documentController
                                                          .document_For.value =
                                                      newValue!;
                                                    },
                                                  ),
                                                );
                                              }),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Obx(() {
                                                return SizedBox(
                                                  child: documentController
                                                      .document_For.value == 'Self'
                                                      ?
                                                  Container(
                                                      padding: const EdgeInsets
                                                          .only(
                                                          top: 6.0,
                                                          left:10.0
                                                      ),
                                                    height: 45,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(6.0),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .shade400,
                                                            blurRadius: 6.0,
                                                          ),
                                                        ]),
                                                    child:TextFormField(
                                                      readOnly: true,
                                                      controller: documentController.nameController,
                                                      decoration: InputDecoration(
                                                          hintText: "${documentController.username.value}",
                                                          border: InputBorder.none
                                                      ),
                                                    )
                                                  )
                                                  : Container(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        top: 6.0,
                                                      left:10.0
                                                    ),
                                                    height: 45,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(6.0),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .shade400,
                                                            blurRadius: 6.0,
                                                          ),
                                                        ]),
                                                      child:TextFormField(
                                                        controller: documentController.nameController,
                                                        decoration: InputDecoration(
                                                            hintText: "Enter your name",
                                                          border: InputBorder.none
                                                        ),
                                                      )
                                                  ),
                                                );
                                              }),
                                              const SizedBox(
                                                height: 15,
                                              ),

                                              Obx(() {
                                                return Container(
                                                  padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(6.0),
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .shade400,
                                                          blurRadius: 6.0,
                                                        ),
                                                      ]),
                                                  child: DropdownButton(
                                                    underline: const SizedBox(),
                                                    elevation: 5,
                                                    isExpanded: true,
                                                    // Initial Value
                                                    value: documentController
                                                        .document_Type.value,
                                                    // Down Arrow Icon
                                                    icon: const Icon(
                                                        Icons.keyboard_arrow_down),
                                                    // Array list of items
                                                    items: documentController.items2
                                                        .value
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(
                                                          items,
                                                          style: const TextStyle(
                                                              fontSize: 16),
                                                        ),
                                                      );
                                                    }).toList(),

                                                    // After selecting the desired option,it will
                                                    // change button value to selected value
                                                    onChanged: (String? newValue) {
                                                      documentController
                                                          .document_Type.value =
                                                      newValue!;
                                                    },
                                                  ),
                                                );
                                              }),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              InkWell(onTap: () {
                                                documentController
                                                    .selectImage(
                                                    ImageSource.gallery);
                                              }, child: Obx(() {
                                                return Container(
                                                  height: 200,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: primaryColor
                                                          .withOpacity(0.1),
                                                      border: const GradientBoxBorder(
                                                        gradient:
                                                        LinearGradient(colors: [Colors.red, Colors.green]),
                                                        width: 2,
                                                      ),
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
                                                    elevation: 0,
                                                    child: Container(
                                                        height: 150,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          color: primaryColor.withOpacity(0.2),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              4),
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
                                                                  color: Colors
                                                                      .white,
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
                                              InkWell(
                                                onTap: () {
                                                  documentController.addDocument(
                                                      {
                                                        'document_for': documentController
                                                            .document_For.value.toString(),
                                                        'name': documentController
                                                            .nameController.text.toString(),
                                                        'document_type': documentController
                                                            .document_Type.value.toString(),
                                                        'document': documentController
                                                            .imagesCollect.value.toString()
                                                      });
                                                },
                                                child: Container(
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
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors.white),
                                                      )),
                                                ),
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
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey)
                                ),
                                child: const Center(
                                    child: Text(
                                      "Add Document",
                                      style:
                                      TextStyle(fontSize: 16, color: primaryColor),
                                    ))),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),

                    //Grid view
                    SizedBox(
                        child: Obx(() {
                          return GridView.builder(
                            itemCount: documentController.documentListModel
                                .length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2.0,
                              mainAxisSpacing: 2.0,
                              childAspectRatio: 0.87,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return DelayedDisplay(
                                delay: const Duration(milliseconds: 300),
                                child: InkWell(
                                  onTap: () =>
                                      print(documentController
                                          .documentListModel[index].name),
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

                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              padding: const EdgeInsets.all(5.0),
                                              height: 100,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      6.0)
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(4.0),
                                                child: Image.network(
                                                    "${documentController
                                                        .documentListModel[index]
                                                        .document}",fit: BoxFit.fill,),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10,),

                                          Expanded(
                                            flex: 1,
                                            child: Row( 
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("${documentController
                                                        .documentListModel[index].name}",
                                                      style: TextStyle(fontSize: screenWidth * 0.045,
                                                          fontWeight: FontWeight.bold),
                                                    overflow: TextOverflow.ellipsis,),
                                                    Text("${documentController
                                                        .documentListModel[index]
                                                        .documentType}", style: TextStyle(
                                                        fontSize: screenWidth * 0.040, color: Colors.grey),
                                                        overflow: TextOverflow.ellipsis),
                                                  ],
                                                ),
                                                Spacer(),
                                                Icon(Icons.file_download,
                                                  color: primaryColor,)
                                              ],
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        })
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
