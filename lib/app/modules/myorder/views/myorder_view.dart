import 'dart:io';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:vakil99/app/modules/orderdetails/views/orderdetails_view.dart';
import 'package:vakil99/app/modules/orderinvoice/views/orderinvoice_view.dart';
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
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: primaryColor,
          title: const Text(
            'My Order',
            style: TextStyle(color: Colors.white),
          ),
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
                    child: myorderController.filterlist.value == true
                        ? GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                      myorderController.myOrderlistModel.length,
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
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Center(
                                        child:
                                        myorderController.myOrderlistModel[index].detail.service.image == null ?
                                        Image.asset(
                                            "assets/images/startuplist/fram1.jpg") :
                                        Image.network(
                                            "${myorderController.myOrderlistModel[index].detail.service.image}"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Price : ₹${myorderController
                                                .myOrderlistModel[index]
                                                .amount}",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize:
                                                screenWidth * 0.042,
                                                letterSpacing: 0.6,
                                                fontWeight:
                                                FontWeight.bold)),
                                        Row(
                                          children: [
                                            Text(
                                              "Date : ",
                                              style: TextStyle(
                                                  fontSize:
                                                  screenWidth * 0.042,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color:
                                                  Colors.blueAccent),
                                            ),
                                            Text(
                                              DateFormat("dd/MM/yyyy")
                                                  .format(myorderController
                                                  .myOrderlistModel[
                                              index]
                                                  .createdAt)
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                  screenWidth * 0.042,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color:
                                                  Colors.blueAccent),
                                            ),
                                          ],
                                        ),
                                        Text(
                                            "Order Id : ${myorderController
                                                .myOrderlistModel[index]
                                                .orderId}",
                                            style: TextStyle(
                                                overflow:
                                                TextOverflow.ellipsis,
                                                color: Colors.red,
                                                fontSize:
                                                screenWidth * 0.042,
                                                letterSpacing: 0.6,
                                                fontWeight:
                                                FontWeight.bold)),
                                        Text(
                                            "Status : ${myorderController
                                                .myOrderlistModel[index]
                                                .orderStatus}",
                                            overflow:
                                            TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize:
                                                screenWidth * 0.042,
                                                letterSpacing: 0.6,
                                                fontWeight:
                                                FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.to(
                                                      () =>
                                                      OrderinvoiceView(),
                                                  arguments:
                                                  myorderController
                                                      .myOrderlistModel[
                                                  index]
                                                      .orderId);
                                            },
                                            icon: const Column(
                                              children: [
                                                Icon(
                                                  Icons.receipt,
                                                  color: Colors.orange,
                                                ),
                                                Text(
                                                  "Invoice",
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color:
                                                      Colors.orange,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                )
                                              ],
                                            )),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              Get.bottomSheet(
                                                bottomdocument(),
                                                barrierColor:
                                                Colors.transparent,
                                                isDismissible: true,
                                              );
                                            },
                                            icon: const Column(
                                              children: [
                                                Icon(
                                                  Icons.file_copy,
                                                  color:
                                                  Colors.blueAccent,
                                                ),
                                                Text(
                                                  "Document",
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors
                                                          .blueAccent,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                )
                                              ],
                                            )),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              Get.to(OrderdetailsView());
                                            },
                                            icon: const Column(
                                              children: [
                                                Icon(
                                                  Icons.description,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                  "Details",
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.red,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                )
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
                    )
                        : DelayedDisplay(
                      delay: const Duration(milliseconds: 300),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                            width: double.infinity,
                            height: 50,
                            color: Colors.black,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "#",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        "Order detail",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 35,
                                    ),
                                    Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: myorderController
                                    .myOrderlistModel.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${index + 1}",
                                                  style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    SizedBox(
                                                      width: 90,
                                                      child: Text(
                                                        "${myorderController
                                                            .myOrderlistModel[index]
                                                            .orderId}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    SizedBox(
                                                      width: 90,
                                                      child: Text(
                                                        "${myorderController
                                                            .myOrderlistModel[index]
                                                            .detail.service
                                                            .name}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            fontSize: 14),
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Column(
                                                  children: [
                                                    Container(
                                                      height: 25,
                                                      width: 90,
                                                      margin:
                                                      EdgeInsets.all(
                                                          2.0),
                                                      decoration:
                                                      BoxDecoration(
                                                        color: Colors
                                                            .blue.shade50,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            100),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${myorderController
                                                              .myOrderlistModel[index]
                                                              .orderStatus}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Container(
                                                      height: 25,
                                                      width: 90,
                                                      margin:
                                                      EdgeInsets.all(
                                                          2.0),
                                                      decoration:
                                                      BoxDecoration(
                                                        color: Colors
                                                            .orange.shade50,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            100),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          DateFormat(
                                                              "dd/MM/yyyy")
                                                              .format(
                                                              myorderController
                                                                  .myOrderlistModel[
                                                              index]
                                                                  .createdAt)
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Column(
                                                  children: [
                                                    Container(
                                                      margin:
                                                      EdgeInsets.all(
                                                          2.0),
                                                      height: 25,
                                                      width: 90,
                                                      decoration:
                                                      BoxDecoration(
                                                        color: Colors
                                                            .red.shade50,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            100),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "₹${myorderController
                                                              .myOrderlistModel[index]
                                                              .amount}/-",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        myorderController.myOrderlistModel[index].connectedCompany == null ?
                                                        InkWell(
                                                          onTap: () {
                                                            myorderController.ogrId.value = myorderController.myOrderlistModel[index].orderId;
                                                            print("${myorderController.myOrderlistModel[index].orderId}");
                                                            Get.bottomSheet(
                                                                Obx(() {
                                                                  return Padding(
                                                                    padding: const EdgeInsets.all(10.0),
                                                                    child: Column(
                                                                      children: [
                                                                        Text("Connect Company",style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
                                                                        SizedBox(height: 8,),
                                                                        SizedBox(
                                                                          child: GridView
                                                                              .builder(
                                                                            shrinkWrap:
                                                                            true,
                                                                            physics:
                                                                            const NeverScrollableScrollPhysics(),
                                                                            itemCount: myorderController.companyModellist.length,
                                                                            gridDelegate:
                                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                                              crossAxisCount:
                                                                              2,
                                                                              crossAxisSpacing:
                                                                              5.0,
                                                                              mainAxisSpacing:
                                                                              5.0,
                                                                              childAspectRatio:
                                                                              0.9,
                                                                            ),
                                                                            itemBuilder:
                                                                                (BuildContext
                                                                            context,
                                                                                int index) {
                                                                              return Container(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                margin: EdgeInsets.all(5.0),
                                                                                height: 200,
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(color: Colors.white),
                                                                                  color: myorderController.listColor[index].colorlist,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Text("S_No. ${index + 1}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                                                        Spacer(),
                                                                                        InkWell(
                                                                                          onTap: (){
                                                                                            myorderController.connectCompany(
                                                                                              myorderController.ogrId.value,
                                                                                              myorderController.companyModellist[index].cin,
                                                                                            );
                                                                                            print("${myorderController.ogrId}");
                                                                                          },
                                                                                          child: Container(
                                                                                              height: 30,
                                                                                              width: 30,
                                                                                              decoration: BoxDecoration(
                                                                                                color: Colors.white,
                                                                                                borderRadius: BorderRadius.circular(100),
                                                                                              ),
                                                                                              child: Icon(Icons.add_circle,color: Colors.green,)),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(height: 10,),
                                                                                    Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Text("Company Name :"),
                                                                                        Text("${myorderController.companyModellist[index].companyName}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                                                      ],
                                                                                    ),
                                                                                    Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Text("CIN Number :"),
                                                                                        Text("${myorderController.companyModellist[index].cin}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                                                      ],
                                                                                    ),
                                                                                    Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Text("Register Number:"),
                                                                                        Text("${myorderController.companyModellist[index].registrationNo}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }),
                                                                barrierColor:
                                                                Colors
                                                                    .transparent,
                                                                isDismissible:
                                                                true,
                                                                backgroundColor:
                                                                Colors
                                                                    .white,);
                                                          },
                                                          child: Container(
                                                              height: 25,
                                                              width: 42,
                                                              margin:
                                                              EdgeInsets
                                                                  .all(
                                                                  2.0),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      100)),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 20,
                                                              )),
                                                        ) :
                                                        Container(
                                                            height: 25,
                                                            width: 42,
                                                            margin:
                                                            EdgeInsets
                                                                .all(
                                                                2.0),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .green,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    100)),
                                                            child: Icon(
                                                              Icons.check,
                                                              color: Colors
                                                                  .white,
                                                              size: 20,
                                                            )),

                                                        //review
                                                        myorderController.myOrderlistModel[index].rating == null ?
                                                        InkWell(
                                                          onTap: () {
                                                            Get.defaultDialog(
                                                                title: "Review",
                                                                middleText: "Hello world!",
                                                                backgroundColor: Colors
                                                                    .white,
                                                                titleStyle: TextStyle(
                                                                    color: Colors
                                                                        .black,fontWeight: FontWeight.bold),
                                                                middleTextStyle: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                                cancelTextColor: Colors
                                                                    .black,
                                                                confirmTextColor: Colors
                                                                    .white,
                                                                buttonColor: Colors
                                                                    .red,
                                                                barrierDismissible: true,
                                                                radius: 10,
                                                                content: Column(
                                                                  children: [
                                                                    Center(
                                                                      child: SizedBox(
                                                                        height: 70,
                                                                        width: 200,
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: List.generate(
                                                                            5,
                                                                                (index) => GestureDetector(
                                                                              onTap: () => myorderController.onStarTapped(index),
                                                                              child: Obx(() => Icon(
                                                                                index < myorderController.rating.value ? Icons.star : Icons.star_border,
                                                                                size: 35,
                                                                                color: Colors.amber,
                                                                              )),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    TextFormField(
                                                                      controller: myorderController.messageController,
                                                                      decoration: InputDecoration(
                                                                          hintText: "Message",
                                                                          border: OutlineInputBorder()
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 20,),
                                                                    InkWell(
                                                                      onTap: (){
                                                                        myorderController.ratingPost(
                                                                          myorderController.myOrderlistModel[index].orderId.toString(),
                                                                          myorderController.myOrderlistModel[index].userId.toString(),
                                                                          myorderController.myOrderlistModel[index].detail.service.id.toString(),
                                                                          myorderController.rating.value.toString(),
                                                                          myorderController.messageController.text,
                                                                        );
                                                                        Get.back();
                                                                      },
                                                                      child: Container(
                                                                        height: 50,
                                                                        width: 180,
                                                                        decoration: BoxDecoration(
                                                                            color: CupertinoColors
                                                                                .systemBlue
                                                                        ),
                                                                        child: Center(
                                                                            child: Text(
                                                                              "Save Changes",
                                                                              style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  color: Colors
                                                                                      .white,
                                                                                  fontWeight: FontWeight
                                                                                      .bold),)),
                                                                      ),
                                                                    )
                                                                  ],
                                                                )
                                                            );
                                                          },
                                                          child: Container(
                                                              height: 25,
                                                              width: 42,
                                                              margin:
                                                              EdgeInsets
                                                                  .all(
                                                                  2.0),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .orangeAccent,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      100)),
                                                              child: Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20)),
                                                        ) :
                                                        Container(
                                                            height: 25,
                                                            width: 42,
                                                            margin:
                                                            EdgeInsets
                                                                .all(
                                                                2.0),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .blue,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    100)),
                                                            child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text("${myorderController.myOrderlistModel[index].rating}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                  size: 20,
                                                                ),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),

                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      child:
                                                      PopupMenuButton<
                                                          int>(
                                                        itemBuilder:
                                                            (context) =>
                                                        [
                                                          // PopupMenuItem 1
                                                          PopupMenuItem(
                                                            value: 1,
                                                            // row with 2 children
                                                            child: InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                                Get.to(
                                                                        () =>
                                                                        OrderinvoiceView(),
                                                                    arguments: myorderController
                                                                        .myOrderlistModel[index]
                                                                        .orderId);
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .file_copy,
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                    10,
                                                                  ),
                                                                  Text(
                                                                    "Invoice",
                                                                    style: TextStyle(
                                                                        color:
                                                                        Colors
                                                                            .orange,
                                                                        fontWeight: FontWeight
                                                                            .bold),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          // PopupMenuItem 2
                                                          PopupMenuItem(
                                                            value: 2,
                                                            // row with two children
                                                            child: InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                                Get.bottomSheet(
                                                                  Container(
                                                                      height: 360,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: const BorderRadius.only(
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0)),
                                                                          color: Colors.grey.shade100,
                                                                          border: Border.all(color: Colors.grey.shade300, width: 2)),
                                                                      child: SingleChildScrollView(
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.all(25.0),
                                                                          child: Column(
                                                                            children: [
                                                                              const Center(
                                                                                  child: Text(
                                                                                    "YOUR SERVICES DOCUMENT UPLODED",
                                                                                    style: TextStyle(
                                                                                        fontSize: 18, fontWeight: FontWeight.bold),
                                                                                  )),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Obx(() {
                                                                                return Container(
                                                                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(6.0),
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
                                                                                    value: myorderController.dropdownvalue.value,
                                                                                    // Down Arrow Icon
                                                                                    icon: const Icon(Icons.keyboard_arrow_down),
                                                                                    // Array list of items
                                                                                    items: myorderController.items.value.map((String items) {
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
                                                                                      myorderController.dropdownvalue.value = newValue!;
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              }),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Text("${myorderController.myOrderlistModel[index].detail.service.docs[0]}"),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),

                                                                              InkWell(onTap: () {
                                                                                myorderController.selectImage(ImageSource.gallery);
                                                                              }, child: Obx(() {
                                                                                return Container(
                                                                                  decoration: BoxDecoration(
                                                                                      color: primaryColor.withOpacity(0.2),
                                                                                      borderRadius: BorderRadius.circular(10)),
                                                                                  child: myorderController.imagesCollect.value != ''
                                                                                      ? ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                      child: Image.file(
                                                                                          File(myorderController.imagesCollect.value),
                                                                                          fit: BoxFit.cover))
                                                                                      : Card(
                                                                                    elevation: 5,
                                                                                    child: Container(
                                                                                        height: 140,
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
                                                                                );
                                                                              })),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Container(
                                                                                height: 50,
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(5.0),
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
                                                                      )),
                                                                  barrierColor:
                                                                  Colors
                                                                      .transparent,
                                                                  isDismissible:
                                                                  true,
                                                                );
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .description,
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                    10,
                                                                  ),
                                                                  Text(
                                                                      "Document",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .green,
                                                                          fontWeight: FontWeight
                                                                              .bold))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          // PopupMenuItem 3
                                                          PopupMenuItem(
                                                            value: 3,
                                                            // row with two children
                                                            child: InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                                Get.to(
                                                                        () =>
                                                                        OrderdetailsView(),
                                                                    arguments: myorderController
                                                                        .myOrderlistModel[index]
                                                                        .orderId);
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .list,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                    10,
                                                                  ),
                                                                  Text(
                                                                      "Details",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .red,
                                                                          fontWeight: FontWeight
                                                                              .bold))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                        offset:
                                                        Offset(0, 50),
                                                        color: Colors.white,
                                                        elevation: 2,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                        Divider(
                                          color: Colors.grey,
                                        )
                                        // Text("${myorderController.myOrderlistModel[index].detail}")
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ));
  }

  Widget bottomdocument() {
    return Container(
        height: 360,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey.shade300, width: 2)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const Center(
                    child: Text(
                      "YOUR SERVICES DOCUMENT UPLODED",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
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
                      value: myorderController.dropdownvalue.value,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      // Array list of items
                      items: myorderController.items.value.map((String items) {
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
                        myorderController.dropdownvalue.value = newValue!;
                      },
                    ),
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
                InkWell(onTap: () {
                  myorderController.selectImage(ImageSource.gallery);
                }, child: Obx(() {
                  return Container(
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: myorderController.imagesCollect.value != ''
                        ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                            File(myorderController.imagesCollect.value),
                            fit: BoxFit.cover))
                        : Card(
                      elevation: 5,
                      child: Container(
                          height: 140,
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
                  );
                })),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
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
        ));
  }
}
