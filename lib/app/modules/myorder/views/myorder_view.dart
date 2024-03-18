import 'dart:io';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../constants.dart';
import '../../checkout/views/checkout_view.dart';
import '../controllers/myorder_controller.dart';

class MyorderView extends GetView<MyorderController> {
  MyorderView({Key? key}) : super(key: key);
  MyorderController myorderController = Get.put(MyorderController());

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
          title: const Text('My Order', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          actions: [
            Obx(() {
              return IconButton(
                  icon: Icon(
                    myorderController.filterlist.value
                        ? Icons.list_alt
                        : Icons.dashboard,
                    size: 25,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    myorderController.filterlist.value =
                    !myorderController.filterlist.value;
                  });
            }),
            const SizedBox(width: 10),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(() {
                  return SizedBox(
                      child: myorderController.filterlist.value == true ?
                  GridView.builder(
                    shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: myorderController.myOrderlistModel.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0,
                          childAspectRatio: screenHeight * 0.00064,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return DelayedDisplay(
                            delay: const Duration(milliseconds: 300),
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
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
                                      flex:3,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/startuplist/fram1.jpg"),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 6,),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Price : ₹${myorderController.myOrderlistModel[index].amount}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: screenWidth * 0.042,
                                                  letterSpacing: 0.6,
                                                  fontWeight: FontWeight.bold
                                              )
                                          ),
                                          Row(
                                            children: [
                                              Text("Date : ",style: TextStyle(
                                                  fontSize: screenWidth * 0.042,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent
                                              ),),
                                              Text(
                                                DateFormat("dd/MM/yyyy")
                                                    .format(
                                                    myorderController.myOrderlistModel[index].createdAt)
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: screenWidth * 0.042,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueAccent
                                                ),
                                              ),
                                            ],
                                          ),

                                          Text(
                                              "Order Id : ${myorderController.myOrderlistModel[index].orderId}",
                                              style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                  color: Colors.red,
                                                  fontSize:  screenWidth * 0.042,
                                                  letterSpacing: 0.6,
                                                  fontWeight: FontWeight.bold
                                              )
                                          ),
                                          Text(
                                              "Status : ${myorderController
                                                  .myOrderlistModel[index]
                                                  .orderStatus}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize:  screenWidth * 0.042,
                                                  letterSpacing: 0.6,
                                                  fontWeight: FontWeight.bold
                                              )
                                          ),
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Column(
                                                children: [
                                                  Icon(Icons.receipt,
                                                    color: Colors.orange,),
                                                  Text("Invoice",
                                                    style: TextStyle(fontSize: 9,
                                                        color: Colors.orange,
                                                    fontWeight: FontWeight.bold),)
                                                ],
                                              )),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                Get.bottomSheet(
                                                  Container(
                                                      height: 360,
                                                      decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius
                                                              .only(
                                                              topLeft: Radius
                                                                  .circular(25.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                  25.0)),
                                                          color: Colors.grey
                                                              .shade100,
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .shade300,
                                                              width: 2)
                                                      ),
                                                      child: SingleChildScrollView(
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .all(25.0),
                                                          child: Column(
                                                            children: [
                                                              const Center(
                                                                  child: Text(
                                                                    "YOUR SERVICES DOCUMENT UPLODED",
                                                                    style: TextStyle(
                                                                        fontSize: 18,
                                                                        fontWeight: FontWeight
                                                                            .bold),)),
                                                              const SizedBox(
                                                                height: 15,),
                                                              Obx(() {
                                                                return Container(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal: 10.0),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          6.0),
                                                                      color: Colors
                                                                          .white,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade400,
                                                                          blurRadius: 6.0,
                                                                        ),
                                                                      ]),
                                                                  child: DropdownButton(
                                                                    menuMaxHeight: 300.0,
                                                                    borderRadius: BorderRadius
                                                                        .circular(
                                                                        10.0),
                                                                    underline: const SizedBox(),
                                                                    elevation: 5,
                                                                    isExpanded: true,
                                                                    // Initial Value
                                                                    value: myorderController
                                                                        .dropdownvalue
                                                                        .value,
                                                                    // Down Arrow Icon
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down),
                                                                    // Array list of items
                                                                    items: myorderController
                                                                        .items
                                                                        .value
                                                                        .map((
                                                                        String items) {
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
                                                                    onChanged: (
                                                                        String? newValue) {
                                                                      myorderController
                                                                          .dropdownvalue
                                                                          .value =
                                                                      newValue!;
                                                                    },
                                                                  ),
                                                                );
                                                              }),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              InkWell(onTap: () {
                                                                myorderController
                                                                    .selectImage(
                                                                    ImageSource
                                                                        .gallery);
                                                              }, child: Obx(() {
                                                                return Container(
                                                                  decoration: BoxDecoration(
                                                                      color: primaryColor
                                                                          .withOpacity(
                                                                          0.2),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          10)),
                                                                  child: myorderController
                                                                      .imagesCollect
                                                                      .value !=
                                                                      ''
                                                                      ? ClipRRect(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          10),
                                                                      child: Image
                                                                          .file(
                                                                          File(
                                                                              myorderController
                                                                                  .imagesCollect
                                                                                  .value),
                                                                          fit: BoxFit
                                                                              .cover))
                                                                      : Card(
                                                                    elevation: 5,
                                                                    child: Container(
                                                                        height: 140,
                                                                        width: double
                                                                            .infinity,
                                                                        decoration: BoxDecoration(
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
                                                                width: double
                                                                    .infinity,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        5.0),
                                                                    color: Colors
                                                                        .blue),
                                                                child: const Center(
                                                                    child: Text(
                                                                      "Save",
                                                                      style: TextStyle(
                                                                          fontSize: 20,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: Colors
                                                                              .white),
                                                                    )),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                  ),
                                                  barrierColor: Colors
                                                      .transparent,
                                                  isDismissible: true,
                                                );
                                              },
                                              icon: const Column(
                                                children: [
                                                  Icon(Icons.file_copy,
                                                    color: Colors.blueAccent,),
                                                  Text("Document",
                                                    style: TextStyle(fontSize: 9,
                                                        color: Colors.blueAccent,
                                                        fontWeight: FontWeight.bold),)
                                                ],
                                              )),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Column(
                                                children: [
                                                  Icon(Icons.description,
                                                    color: Colors.red,),
                                                  Text("Details",
                                                    style: TextStyle(fontSize: 9,
                                                        color: Colors.red,
                                                    fontWeight: FontWeight.bold),)
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ):
                      ListView.builder(
                          itemCount: myorderController.myOrderlistModel.length,
                          itemBuilder: (BuildContext context, int index) {
                            return DelayedDisplay(
                              delay: const Duration(milliseconds: 300),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                margin: EdgeInsets.symmetric(vertical: 6.0,horizontal: 06),
                                height: screenHeight * 0.15,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(color: Colors.grey)
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text("Price : ₹${myorderController.myOrderlistModel[index].amount}",style: TextStyle(
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.red
                                          ),),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Text("Date : ",style: TextStyle(
                                                  fontSize: screenWidth * 0.045,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent
                                              ),),
                                              Text(
                                                DateFormat("dd/MM/yyyy")
                                                    .format(
                                                    myorderController.myOrderlistModel[index].createdAt)
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: screenWidth * 0.045,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueAccent
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text("Order id: ${myorderController.myOrderlistModel[index].orderId}",style: TextStyle(
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red
                                          ),),
                                          Text("Order Status: ${myorderController.myOrderlistModel[index].orderStatus}",style: TextStyle(
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green
                                          ),)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: screenHeight * 0.10,
                                      width: 2,
                                      color: primaryColor,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Get.bottomSheet(
                                                  Container(
                                                      height: 360,
                                                      decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius
                                                              .only(
                                                              topLeft: Radius
                                                                  .circular(25.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                  25.0)),
                                                          color: Colors.grey
                                                              .shade100,
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .shade300,
                                                              width: 2)
                                                      ),
                                                      child: SingleChildScrollView(
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .all(25.0),
                                                          child: Column(
                                                            children: [
                                                              const Center(
                                                                  child: Text(
                                                                    "YOUR SERVICES DOCUMENT UPLODED",
                                                                    style: TextStyle(
                                                                        fontSize: 18,
                                                                        fontWeight: FontWeight
                                                                            .bold),)),
                                                              const SizedBox(
                                                                height: 15,),
                                                              Obx(() {
                                                                return Container(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal: 10.0),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          6.0),
                                                                      color: Colors
                                                                          .white,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade400,
                                                                          blurRadius: 6.0,
                                                                        ),
                                                                      ]),
                                                                  child: DropdownButton(
                                                                    menuMaxHeight: 300.0,
                                                                    borderRadius: BorderRadius
                                                                        .circular(
                                                                        10.0),
                                                                    underline: const SizedBox(),
                                                                    elevation: 5,
                                                                    isExpanded: true,
                                                                    // Initial Value
                                                                    value: myorderController
                                                                        .dropdownvalue
                                                                        .value,
                                                                    // Down Arrow Icon
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down),
                                                                    // Array list of items
                                                                    items: myorderController
                                                                        .items
                                                                        .value
                                                                        .map((
                                                                        String items) {
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
                                                                    onChanged: (
                                                                        String? newValue) {
                                                                      myorderController
                                                                          .dropdownvalue
                                                                          .value =
                                                                      newValue!;
                                                                    },
                                                                  ),
                                                                );
                                                              }),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              InkWell(onTap: () {
                                                                myorderController
                                                                    .selectImage(
                                                                    ImageSource
                                                                        .gallery);
                                                              }, child: Obx(() {
                                                                return Container(
                                                                  decoration: BoxDecoration(
                                                                      color: primaryColor
                                                                          .withOpacity(
                                                                          0.2),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          10)),
                                                                  child: myorderController
                                                                      .imagesCollect
                                                                      .value !=
                                                                      ''
                                                                      ? ClipRRect(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          10),
                                                                      child: Image
                                                                          .file(
                                                                          File(
                                                                              myorderController
                                                                                  .imagesCollect
                                                                                  .value),
                                                                          fit: BoxFit
                                                                              .cover))
                                                                      : Card(
                                                                    elevation: 5,
                                                                    child: Container(
                                                                        height: 140,
                                                                        width: double
                                                                            .infinity,
                                                                        decoration: BoxDecoration(
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
                                                                width: double
                                                                    .infinity,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        5.0),
                                                                    color: Colors
                                                                        .blue),
                                                                child: const Center(
                                                                    child: Text(
                                                                      "Save",
                                                                      style: TextStyle(
                                                                          fontSize: 20,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: Colors
                                                                              .white),
                                                                    )),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                  ),
                                                  barrierColor: Colors
                                                      .transparent,
                                                  isDismissible: true,
                                                );
                                              },
                                              icon: const Column(
                                                children: [
                                                  Icon(Icons.file_copy,
                                                    color: Colors.blueAccent,),
                                                  Text("Document",
                                                    style: TextStyle(fontSize: 9,
                                                        color: Colors.blueAccent,
                                                        fontWeight: FontWeight.bold),)
                                                ],
                                              )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Column(
                                                children: [
                                                  Icon(Icons.description,
                                                    color: Colors.green,),
                                                  Text("Details",
                                                    style: TextStyle(fontSize: 9,
                                                        color: Colors.green,
                                                        fontWeight: FontWeight.bold),)
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            );
                          }),
                  );
                }),
              ],
            ),
          ),
        )
    );
  }
}
