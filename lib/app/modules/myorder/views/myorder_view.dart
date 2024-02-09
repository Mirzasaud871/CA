import 'dart:io';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants.dart';
import '../../checkout/views/checkout_view.dart';
import '../controllers/myorder_controller.dart';

class MyorderView extends GetView<MyorderController> {
  MyorderView({Key? key}) : super(key: key);
  MyorderController myorderController = Get.put(MyorderController());
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
        title: const Text('My Order',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: Get.width * 1.98,
                    child: GridView.builder(
                      itemCount: 8,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0,
                        childAspectRatio: 0.56,
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
                                  InkWell(
                                    onTap: (){
                                    },
                                    child: Image.asset(
                                        "assets/images/startuplist/fram1.jpg"),
                                  ),
                                  const SizedBox(height: 6,),
                                  const Row(
                                    children: [
                                      Text(
                                        "Price : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        )),
                                      Text(
                                        "₹12250",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16,
                                            letterSpacing: 0.6,
                                            )
                                      )
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                          "Date : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          )),
                                      Text(
                                          "13,JAN 2024",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              letterSpacing: 0.6,
                                              )
                                      )
                                    ],
                                  ),


                                  const Row(
                                    children: [
                                      Text(
                                          "Order Id : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          )),
                                      Expanded(
                                        child: Text(
                                            "COM1705133784",
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                                color: Colors.red,
                                                fontSize: 16,
                                                letterSpacing: 0.6,
                                                )
                                        ),
                                      )
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                          "Order Status : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          )),
                                      Text(
                                          "Pending",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              letterSpacing: 0.6,
                                              )
                                      )
                                    ],
                                  ),

                                  const Spacer(),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: (){},
                                          icon: const Column(
                                            children: [
                                              Icon(Icons.receipt,color: Colors.orange,),
                                              Text("Invoice",style: TextStyle(fontSize: 9,color: Colors.black),)
                                            ],
                                          )),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: (){

                                            Get.bottomSheet(
                                              Container(
                                                  height: 360,
                                                  decoration: BoxDecoration(
                                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0)),
                                                      color: Colors.grey.shade100,
                                                      border: Border.all(color: Colors.grey.shade300,width: 2)
                                                  ),
                                                  child:SingleChildScrollView(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(25.0),
                                                      child: Column(
                                                        children: [
                                                          const Center(child: Text("YOUR SERVICES DOCUMENT UPLODED",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                                                          const SizedBox(height: 15,),
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
                                                                value: myorderController
                                                                    .dropdownvalue.value,
                                                                // Down Arrow Icon
                                                                icon: const Icon(
                                                                    Icons.keyboard_arrow_down),
                                                                // Array list of items
                                                                items: myorderController.items.value
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
                                                                  myorderController
                                                                      .dropdownvalue.value = newValue!;
                                                                },
                                                              ),
                                                            );
                                                          }),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          InkWell(onTap: () {
                                                            myorderController
                                                                .selectImage(ImageSource.gallery);
                                                          }, child: Obx(() {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                  color: primaryColor.withOpacity(0.2),
                                                                  borderRadius:
                                                                  BorderRadius.circular(10)),
                                                              child: myorderController
                                                                  .imagesCollect.value !=
                                                                  ''
                                                                  ? ClipRRect(
                                                                  borderRadius:
                                                                  BorderRadius.circular(10),
                                                                  child: Image.file(
                                                                      File(myorderController
                                                                          .imagesCollect.value),
                                                                      fit: BoxFit.cover))
                                                                  : Card(
                                                                elevation: 5,
                                                                child: Container(
                                                                    height: 140,
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
                                            );
                                          },
                                          icon: const Column(
                                            children: [
                                              Icon(Icons.file_copy,color: Colors.blueAccent,),
                                              Text("Document",style: TextStyle(fontSize: 9,color: Colors.black),)
                                            ],
                                          )),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: (){},
                                          icon: const Column(
                                            children: [
                                              Icon(Icons.description,color: Colors.red,),
                                              Text("Details",style: TextStyle(fontSize: 9,color: Colors.black),)
                                            ],
                                          )),
                                    ],
                                  ),

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
        )
        );
  }
}
