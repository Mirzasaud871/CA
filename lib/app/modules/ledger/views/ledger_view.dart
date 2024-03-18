import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';
import '../controllers/ledger_controller.dart';

class LedgerView extends GetView<LedgerController> {
  LedgerView({Key? key}) : super(key: key);
  LedgerController ledgerController = Get.put(LedgerController());

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            backgroundColor: primaryColor,
            title: const Text(
              'My Ledger',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            bottom: TabBar(
                dividerColor: Colors.blue,
                labelColor:
                Colors.black,
                //<-- selected text color
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                      child: SizedBox(
                        child: Center(
                            child: Text(
                              "Order History",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                  Tab(
                      child: SizedBox(
                        child: Center(
                            child: Text(
                              "Amount History",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                ]),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(12.0),
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.wallet,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Obx(() {
                                      return Text(
                                        "₹${ledgerController.getTotalAmount
                                            .value}",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      );
                                    }),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  "TOTAL AMOUNT",
                                  style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(12.0),
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade50,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.upload,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Obx(() {
                                      return Text(
                                        "${ledgerController.getTotalAmount
                                            .value}",
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      );
                                    }),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  "PAID AMOUNT",
                                  style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(12.0),
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.download,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Obx(() {
                                      return Text(
                                        "₹${ledgerController.getDueAmount
                                            .value}",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      );
                                    }),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  "DUE AMOUNT",
                                  style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(12.0),
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Obx(() {
                                      return Text(
                                        "${ledgerController.getTotalOrders
                                            .value}",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      );
                                    }),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  "TOTAL ORDERS",
                                  style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Container(
                    height: 480,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TabBarView(children: [

                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  // table
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
                                                  fontSize: 18),
                                            ),
                                            SizedBox(width: 10,),
                                            SizedBox(
                                              width: 110,
                                              child: Text(
                                                "Order Id",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              "Amount",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            Spacer(),
                                            Text(
                                              "Paid & Due",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  Obx(() {
                                    return SizedBox(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: ledgerController
                                              .ledgerModelList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(
                                                  10.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10.0),
                                                      width: double.infinity,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .start,
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            "${index + 1}",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .bold,),),
                                                          SizedBox(width: 16,),
                                                          SizedBox(
                                                              width: 110,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text(
                                                                    "${ledgerController
                                                                        .ledgerModelList[index]
                                                                        .order
                                                                        ?.orderId}",
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight
                                                                            .bold,
                                                                        overflow: TextOverflow
                                                                            .ellipsis
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${ledgerController
                                                                        .ledgerModelList[index]
                                                                        .order
                                                                        ?.detail
                                                                        .service
                                                                        .name}",
                                                                    style: TextStyle(
                                                                      overflow: TextOverflow
                                                                          .ellipsis,
                                                                      fontWeight: FontWeight
                                                                          .bold,
                                                                    ),),
                                                                ],
                                                              )),
                                                          Spacer(),
                                                          Text(
                                                            "₹${ledgerController
                                                                .ledgerModelList[index]
                                                                .order
                                                                ?.amount}",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .bold,),),
                                                          Spacer(),
                                                          Text(
                                                            "₹${ledgerController
                                                                .ledgerModelList[index]
                                                                .order
                                                                ?.amount} / ₹${ledgerController
                                                                .ledgerModelList[index]
                                                                .due}",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .bold,),),
                                                        ],
                                                      )),
                                                  Divider(color: Colors.grey,)
                                                ],
                                              ),
                                            );
                                          }),
                                    );
                                  }),
                                ],
                              ),
                            ),

                            //Tabs 222
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  // table
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
                                                  fontSize: 18),
                                            ),
                                            SizedBox(width: 10,),
                                            SizedBox(
                                              width: 110,
                                              child: Text(
                                                "Date",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              "Amount",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            Spacer(),
                                            Text(
                                              "Pay Mode",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  Obx(() {
                                    return SizedBox(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: ledgerController
                                              .ledgerModelList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(
                                                  10.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10.0),
                                                      width: double.infinity,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .start,
                                                        crossAxisAlignment: CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            "${index + 1}",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .bold,),),
                                                          SizedBox(width: 16,),
                                                          Text(
                                                            DateFormat(
                                                                "dd/MM/yyyy")
                                                                .format(
                                                                ledgerController
                                                                    .ledgerModelList[index]
                                                                    .order!
                                                                    .createdAt)
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight: FontWeight
                                                                    .bold
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            "₹${ledgerController
                                                                .ledgerModelList[index]
                                                                .order
                                                                ?.amount}",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight
                                                                  .bold,),),
                                                          Spacer(),
                                                          Text(
                                                              "${ledgerController.ledgerModelList[index].history[0].paymentMode}"),
                                                        ],
                                                      )),
                                                  Divider(color: Colors.grey,)
                                                ],
                                              ),
                                            );
                                          }),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          )),
    );
  }
}
