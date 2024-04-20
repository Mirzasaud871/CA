import 'dart:core';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../constants.dart';
import '../controllers/add_directors_controller.dart';

class AddDirectorsView extends GetView<AddDirectorsController> {
  AddDirectorsView({Key? key}) : super(key: key);
  AddDirectorsController addDirectorsController =
      Get.put(AddDirectorsController());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      // onPopInvoked: (){},
      canPop: true,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                  addDirectorsController.multiplesForm.value = [1];
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            backgroundColor: primaryColor,
            title: const Text(
              'Add Directors',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: addDirectorsController.formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            // Container(
                            //   padding: EdgeInsets.all(8.0),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(6.0),
                            //     color: Colors.white,
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey.withOpacity(0.5),
                            //         spreadRadius: 5,
                            //         blurRadius: 7,
                            //         offset: Offset(0, 3), // changes the shadow position
                            //       ),
                            //     ],
                            //   ),
                            //   child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Expanded(
                            //             child: Container(
                            //               margin: EdgeInsets.all(8.0),
                            //               child: Column(
                            //                 crossAxisAlignment: CrossAxisAlignment.start,
                            //                 children: [
                            //                   Text("Directors Name",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            //                   SizedBox(height: 5,),
                            //                   TextFormField(
                            //                     onEditingComplete: () {
                            //                       print('Editing complete');
                            //                     },
                            //                     controller: addDirectorsController.nameController,
                            //                     decoration: InputDecoration(
                            //                       hintText: "Name",
                            //                       focusColor: primaryColor,
                            //                       suffixIconColor: primaryColor,
                            //                       focusedBorder: OutlineInputBorder(
                            //                           borderSide: BorderSide(color: primaryColor)),
                            //                       border: OutlineInputBorder(
                            //                         borderRadius: BorderRadius.circular(5.0),
                            //                       ),
                            //                     ),
                            //                     validator: (value) {
                            //                       if (value == null || value.isEmpty) {
                            //                         return 'Please enter some text';
                            //                       }
                            //                       return null;
                            //                     },
                            //                   ),
                            //                 ],
                            //               )
                            //             ),
                            //           ),
                            //           Expanded(
                            //             child: Container(
                            //               margin: EdgeInsets.all(8.0),
                            //               child: Column(
                            //                 crossAxisAlignment: CrossAxisAlignment.start,
                            //                 children: [
                            //                   Text("Designation",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            //                   SizedBox(height: 5,),
                            //                   TextFormField(
                            //                     controller: addDirectorsController.designationController,
                            //                     decoration: InputDecoration(
                            //                       hintText: "Designation",
                            //                       focusColor: primaryColor,
                            //                       suffixIconColor: primaryColor,
                            //                       focusedBorder: OutlineInputBorder(
                            //                           borderSide: BorderSide(color: primaryColor)),
                            //                       border: OutlineInputBorder(
                            //                         borderRadius: BorderRadius.circular(5.0),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               )
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //
                            //       Row(
                            //         children: [
                            //           Expanded(
                            //             child: Container(
                            //                 margin: EdgeInsets.all(8.0),
                            //                 child: Column(
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text("DIN Number",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            //                     SizedBox(height: 5,),
                            //                     TextFormField(
                            //                       controller: addDirectorsController.dinController,
                            //                       decoration: InputDecoration(
                            //                         hintText: "DIN Number",
                            //                         focusColor: primaryColor,
                            //                         suffixIconColor: primaryColor,
                            //                         focusedBorder: OutlineInputBorder(
                            //                             borderSide: BorderSide(color: primaryColor)),
                            //                         border: OutlineInputBorder(
                            //                           borderRadius: BorderRadius.circular(5.0),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 )
                            //             ),
                            //           ),
                            //           Expanded(
                            //             child: Container(
                            //                 margin: EdgeInsets.all(8.0),
                            //                 child: Column(
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text("Date of Appointment",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            //                     SizedBox(height: 5,),
                            //                     InkWell(
                            //                       onTap: () {
                            //                         addDirectorsController.firstDate();
                            //                       },
                            //                       child: Container(
                            //                         margin:
                            //                         EdgeInsets.symmetric(
                            //                             horizontal: 2.0),
                            //                         height: Get.width * 0.16,
                            //                         width: double.infinity,
                            //                         decoration: BoxDecoration(
                            //                           borderRadius: BorderRadius
                            //                               .circular(5.0),
                            //                           border: Border.all(
                            //                               color: Colors.black),
                            //                           color: Colors.white,
                            //                         ),
                            //                         child: Obx(() =>
                            //                             Padding(
                            //                               padding: const EdgeInsets.all(10.0),
                            //                               child: Column(
                            //                                 crossAxisAlignment: CrossAxisAlignment.start,
                            //                                 mainAxisAlignment: MainAxisAlignment.center,
                            //                                 children: [
                            //                                   Text(
                            //                                     DateFormat("dd-MM-yyyy")
                            //                                         .format(
                            //                                         addDirectorsController
                            //                                             .appointmentDate.value)
                            //                                         .toString(),
                            //                                     style: const TextStyle(
                            //                                       fontSize: 18,
                            //                                     ),
                            //                                   ),
                            //                                 ],
                            //                               ),
                            //                             )),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 )
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //
                            //       Row(
                            //         children: [
                            //           Expanded(
                            //             child: Container(
                            //                 margin: EdgeInsets.all(8.0),
                            //                 child: Column(
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text("Date of Issue",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            //                     SizedBox(height: 5,),
                            //                     InkWell(
                            //                       onTap: () {
                            //                         addDirectorsController.secondDate();
                            //                       },
                            //                       child: Container(
                            //                         margin:
                            //                         EdgeInsets.symmetric(
                            //                             horizontal: 2.0),
                            //                         height: Get.width * 0.16,
                            //                         width: double.infinity,
                            //                         decoration: BoxDecoration(
                            //                           borderRadius: BorderRadius
                            //                               .circular(5.0),
                            //                           border: Border.all(
                            //                               color: Colors.black),
                            //                           color: Colors.white,
                            //                         ),
                            //                         child: Obx(() =>
                            //                             Padding(
                            //                               padding: const EdgeInsets.all(10.0),
                            //                               child: Column(
                            //                                 crossAxisAlignment: CrossAxisAlignment.start,
                            //                                 mainAxisAlignment: MainAxisAlignment.center,
                            //                                 children: [
                            //                                   Text(
                            //                                     DateFormat("dd-MM-yyyy")
                            //                                         .format(
                            //                                         addDirectorsController
                            //                                             .issueDate.value)
                            //                                         .toString(),
                            //                                     style: const TextStyle(
                            //                                       fontSize: 18,
                            //                                     ),
                            //                                   ),
                            //                                 ],
                            //                               ),
                            //                             )),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 )
                            //             ),
                            //           ),
                            //           Expanded(
                            //             child: Container(
                            //                 margin: EdgeInsets.all(8.0),
                            //                 child: Column(
                            //                   crossAxisAlignment: CrossAxisAlignment.start,
                            //                   children: [
                            //                     Text("Date of Expiry",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            //                     SizedBox(height: 5,),
                            //                     InkWell(
                            //                       onTap: () {
                            //                         addDirectorsController.thirdDate();
                            //                       },
                            //                       child: Container(
                            //                         margin:
                            //                         EdgeInsets.symmetric(
                            //                             horizontal: 2.0),
                            //                         height: Get.width * 0.16,
                            //                         width: double.infinity,
                            //                         decoration: BoxDecoration(
                            //                           borderRadius: BorderRadius
                            //                               .circular(5.0),
                            //                           border: Border.all(
                            //                               color: Colors.black),
                            //                           color: Colors.white,
                            //                         ),
                            //                         child: Obx(() =>
                            //                             Padding(
                            //                               padding: const EdgeInsets.all(10.0),
                            //                               child: Column(
                            //                                 crossAxisAlignment: CrossAxisAlignment.start,
                            //                                 mainAxisAlignment: MainAxisAlignment.center,
                            //                                 children: [
                            //                                   Text(
                            //                                     DateFormat("dd-MM-yyyy")
                            //                                         .format(
                            //                                         addDirectorsController
                            //                                             .expiryDate.value)
                            //                                         .toString(),
                            //                                     style: const TextStyle(
                            //                                       fontSize: 18,
                            //                                     ),
                            //                                   ),
                            //                                 ],
                            //                               ),
                            //                             )),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 )
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ],
                            //     ),
                            // ),

                            Obx(
                              () => SizedBox(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                    itemCount: addDirectorsController
                                        .multiplesForm.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.all(8.0),
                                        margin:
                                            const EdgeInsets.only(top: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          border: Border.all(color: Colors.grey),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Form_No ${index + 1}",
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Spacer(),
                                                InkWell(
                                                  onTap: () {
                                                    addDirectorsController
                                                        .removeAtIndex(index);
                                                  },
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    50.0)),
                                                    child: const Icon(
                                                      Icons.remove_circle,
                                                      color: Colors.white,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            "Directors Name",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                addDirectorsController
                                                                        .directorNameController[
                                                                    index],
                                                            decoration:
                                                                InputDecoration(
                                                              hintText: "Name",
                                                              focusColor:
                                                                  primaryColor,
                                                              suffixIconColor:
                                                                  primaryColor,
                                                              focusedBorder: const OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              primaryColor)),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                      margin:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            "Designation",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                addDirectorsController
                                                                        .designationController[
                                                                    index],
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "Designation",
                                                              focusColor:
                                                                  primaryColor,
                                                              suffixIconColor:
                                                                  primaryColor,
                                                              focusedBorder: const OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              primaryColor)),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                      margin:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            "DIN Number",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                addDirectorsController
                                                                        .dinNumberController[
                                                                    index],
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "DIN Number",
                                                              focusColor:
                                                                  primaryColor,
                                                              suffixIconColor:
                                                                  primaryColor,
                                                              focusedBorder: const OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              primaryColor)),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                      margin:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Date of Appointment",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              addDirectorsController
                                                                  .firstDate(
                                                                      context,
                                                                      index);
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2.0),
                                                              height:
                                                                  Get.width *
                                                                      0.16,
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Obx(
                                                                  () => Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            10.0),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              DateFormat("dd-MM-yyyy").format(addDirectorsController.appointmentDate[index]).toString(),
                                                                              style: const TextStyle(
                                                                                fontSize: 18,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                      margin:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Date of Issue",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              addDirectorsController
                                                                  .secondDate(
                                                                      context,
                                                                      index);
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2.0),
                                                              height:
                                                                  Get.width *
                                                                      0.16,
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Obx(
                                                                  () => Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            10.0),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              DateFormat("dd-MM-yyyy").format(addDirectorsController.issueDate[index]).toString(),
                                                                              style: const TextStyle(
                                                                                fontSize: 18,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                      margin:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Date of Expiry",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              addDirectorsController
                                                                  .thirdDate(
                                                                      context,
                                                                      index);
                                                            },
                                                            child: Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          2.0),
                                                              height:
                                                                  Get.width *
                                                                      0.16,
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Obx(
                                                                  () => Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            10.0),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              DateFormat("dd-MM-yyyy").format(addDirectorsController.expiryDate[index]).toString(),
                                                                              style: const TextStyle(
                                                                                fontSize: 18,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),

                            Row(
                              children: <Widget>[
                                Spacer(),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child:  InkWell(
                                      onTap: () {
                                        addDirectorsController.addDirector();
                                      },
                                      child: Container(
                                        height: 55,
                                        width: 330,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(12.0)
                                        ),
                                        child: const Center(child: Text("Add Directors",style: TextStyle(color: Colors.white,fontSize: 18),)),
                                      )
                                  ),
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child:  FloatingActionButton(
                                    onPressed: () {
                                      addDirectorsController.generateMultiple();
                                      print(addDirectorsController.dinNumberController.length);
                                    },
                                    backgroundColor: Colors.green,
                                    elevation: 5.0,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          )),
    );
  }
}
