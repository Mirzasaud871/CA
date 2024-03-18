import 'dart:core';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../constants.dart';
import '../controllers/add_directors_controller.dart';

class AddDirectorsView extends GetView<AddDirectorsController> {
  AddDirectorsView({Key? key}) : super(key: key);
  AddDirectorsController addDirectorsController = Get.put(AddDirectorsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Handle onPressed eventsaud
            addDirectorsController.generateMultiples();
          },
          child: Icon(Icons.add,color: Colors.white,),
          backgroundColor: Colors.green,
          elevation: 5.0,
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
                        () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: addDirectorsController.multiplesForm.asMap().entries.map((entry) {
                        final index = entry.key;
                        final value = entry.value;
                        return Container(
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.only(top:10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes the shadow position
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Form_No ${index + 1}",style: const TextStyle(fontSize: 18,color: primaryColor,fontWeight: FontWeight.bold),),
                                  Spacer(),
                                  InkWell(
                                    onTap: (){
                                      addDirectorsController.removeAtIndex(index);
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(50.0)
                                      ),
                                      child: Icon(Icons.remove_circle,color: Colors.white,size: 24,),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        margin: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Directors Name",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                            SizedBox(height: 5,),
                                            TextFormField(
                                              controller: addDirectorsController.nameController,
                                              onEditingComplete: (){
                                                addDirectorsController.nameController.text;
                                                print('Editing complete for Text Field 2');
                                              },
                                              // onFieldSubmitted: (value) {
                                              //   String name = addDirectorsController.dinController.text.trim();
                                              //   if (name.isNotEmpty) {
                                              //     addDirectorsController.formDataList.add(name);
                                              //     addDirectorsController.dinController.clear(); // Clear the text field after adding to the list
                                              //   }
                                              // },
                                              decoration: InputDecoration(
                                                hintText: "Name",
                                                focusColor: primaryColor,
                                                suffixIconColor: primaryColor,
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: primaryColor)),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                        margin: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Designation",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                            SizedBox(height: 5,),
                                            TextFormField(
                                              // onFieldSubmitted: (value) {
                                              //   String designation = addDirectorsController.designationController.text.trim();
                                              //   if (designation.isNotEmpty) {
                                              //     addDirectorsController.itemsDesignation.add(designation);
                                              //     addDirectorsController.designationController.clear(); // Clear the text field after adding to the list
                                              //   }
                                              // },
                                              controller: addDirectorsController.designationController,
                                              onEditingComplete: (){
                                                addDirectorsController.designationController.text;
                                                print('Editing complete for Text Field 2');
                                              },
                                              decoration: InputDecoration(
                                                hintText: "Designation",
                                                focusColor: primaryColor,
                                                suffixIconColor: primaryColor,
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: primaryColor)),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        margin: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("DIN Number",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                            SizedBox(height: 5,),
                                            TextFormField(
                                              // onFieldSubmitted: (value) {
                                              //   String dinNum = addDirectorsController.dinController.text.trim();
                                              //   if (dinNum.isNotEmpty) {
                                              //     addDirectorsController.itemsDin.add(dinNum);
                                              //     addDirectorsController.dinController.clear(); // Clear the text field after adding to the list
                                              //   }
                                              // },
                                              controller: addDirectorsController.dinController,
                                              onEditingComplete: (){
                                                addDirectorsController.dinController.text;
                                                print('Editing complete for Text Field 2');
                                              },
                                              decoration: InputDecoration(
                                                hintText: "DIN Number",
                                                focusColor: primaryColor,
                                                suffixIconColor: primaryColor,
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: primaryColor)),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        margin: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Date of Appointment",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                            SizedBox(height: 5,),
                                            InkWell(
                                              onTap: () {
                                                addDirectorsController.firstDate();
                                              },
                                              child: Container(
                                                margin:
                                                EdgeInsets.symmetric(
                                                    horizontal: 2.0),
                                                height: Get.width * 0.16,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(5.0),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  color: Colors.white,
                                                ),
                                                child: Obx(() =>
                                                    Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            DateFormat("dd-MM-yyyy")
                                                                .format(
                                                                addDirectorsController
                                                                    .appointmentDate.value)
                                                                .toString(),
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
                                        )
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        margin: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Date of Issue",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                            SizedBox(height: 5,),
                                            InkWell(
                                              onTap: () {
                                                addDirectorsController.secondDate();
                                              },
                                              child: Container(
                                                margin:
                                                EdgeInsets.symmetric(
                                                    horizontal: 2.0),
                                                height: Get.width * 0.16,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(5.0),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  color: Colors.white,
                                                ),
                                                child: Obx(() =>
                                                    Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            DateFormat("dd-MM-yyyy")
                                                                .format(
                                                                addDirectorsController
                                                                    .issueDate.value)
                                                                .toString(),
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
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        margin: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Date of Expiry",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                            SizedBox(height: 5,),
                                            InkWell(
                                              onTap: () {
                                                addDirectorsController.thirdDate();
                                              },
                                              child: Container(
                                                margin:
                                                EdgeInsets.symmetric(
                                                    horizontal: 2.0),
                                                height: Get.width * 0.16,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(5.0),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  color: Colors.white,
                                                ),
                                                child: Obx(() =>
                                                    Padding(
                                                      padding: const EdgeInsets.all(10.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            DateFormat("dd-MM-yyyy")
                                                                .format(
                                                                addDirectorsController
                                                                    .expiryDate.value)
                                                                .toString(),
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
                                        )
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: (){
                      final form = addDirectorsController.formKey.currentState;
                      if (form != null && form.validate()) {
                        Map<String, dynamic> formData = {
                          'name': addDirectorsController.nameController.text,
                          'designation': addDirectorsController.designationController.text,
                          'dinNumber': addDirectorsController.dinController.text,
                          // Add other form fields similarly
                        };
                        addDirectorsController.formDataList.add(formData);
                        form.reset();
                        print("${addDirectorsController.nameController.text}");
                        print("${addDirectorsController.designationController.text}");
                        print("${addDirectorsController.dinController.text}");
                      }
                      //   [addDirectorsController.nameController.text.toString()],
                      //   [addDirectorsController.designationController.text.toString()],
                      //   [addDirectorsController.dinController.text.toString()],
                      //   [addDirectorsController.appointmentDate.value.toString()],
                      //   [addDirectorsController.issueDate.value.toString()],
                      //   [addDirectorsController.expiryDate.value.toString()],
                      // );
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                          child: Text(
                            "Add Directors",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle submission of formDataList
                      print("List of array${addDirectorsController.formDataList}");
                    },
                    child: Text('Submit All Data'),
                  ),
                ],
              )
              ]
            ),
          ),
        ),
      ),
    ));
  }
}
