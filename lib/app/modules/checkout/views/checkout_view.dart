import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  CheckoutView({Key? key}) : super(key: key);
  CheckoutController checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black,)),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(
                children: [
                  checkoutController.codeResponse.value == false ?
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 15.0),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: screenHeight * 0.01,),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/zynoblack.png", height: screenHeight * 0.04),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Rizrv Company", style: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.bold),),
                                      Text("Test address.",
                                        style: TextStyle(fontSize: screenWidth * 0.03,),),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: screenHeight * 0.02,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  Text("ESTIMATE",
                                    style: TextStyle(color: Colors.red,
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold),),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "Bill To",
                                        style: TextStyle(fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.bold),
                                      ),

                                      Obx(() {
                                        return Text(
                                          "${checkoutController.username}",
                                          style: TextStyle(fontSize: screenWidth * 0.045),);
                                      }),
                                      const SizedBox(
                                        height: 4,
                                      ),

                                      Obx(() {
                                        return Text(
                                          "${checkoutController.useremail}",
                                          style: TextStyle(fontSize: screenWidth * 0.045),);
                                      }),
                                      const SizedBox(
                                        height: 4,
                                      ),

                                      Obx(() {
                                        return Text(
                                          "${checkoutController.usermobile}",
                                          style: TextStyle(fontSize: screenWidth * 0.045),);
                                      }),
                                      const SizedBox(
                                        height: 4,
                                      ),

                                      Text("India",
                                        style: TextStyle(fontSize: screenWidth * 0.045),),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Estimate Date:",
                                        style: TextStyle(fontSize: screenWidth * 0.045),),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        DateFormat("dd / MM / yyyy")
                                            .format(
                                            checkoutController
                                                .estimateDate.value)
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.045,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Obx(() {
                                return DataTable(
                                    dataRowHeight: 55,
                                    columnSpacing: screenWidth * 0.07,
                                    headingRowHeight: 50,
                                    headingRowColor: MaterialStateColor
                                        .resolveWith(
                                            (states) => Colors.black),
                                    columns: [
                                      DataColumn(
                                        label: Text(
                                          'Description',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                       DataColumn(
                                        label: Text(
                                          'Rate',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                       DataColumn(
                                        label: Text(
                                          'Total',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                    rows: [
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "${checkoutController.serviceName}",
                                          style: TextStyle(fontSize: screenWidth * 0.04,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "Our Price",
                                          style: TextStyle(fontSize: screenWidth * 0.04),
                                        )),
                                        DataCell(Text(
                                          "₹${checkoutController.price}",
                                          style: TextStyle(fontSize: screenWidth * 0.04),
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "GST ",
                                          style: TextStyle(fontSize: screenWidth * 0.04,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "18%",
                                          style: TextStyle(fontSize: screenWidth * 0.04),
                                        )),
                                        DataCell(
                                            checkoutController.taxType ==
                                                'exclusive'
                                                ?
                                            Text(
                                              "₹${checkoutController
                                                  .gstExclusive}",
                                              style: TextStyle(fontSize: screenWidth * 0.04),
                                            )
                                                : Text("Included ",
                                              style: TextStyle(fontSize: screenWidth * 0.04),
                                            )
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "Total Price ",
                                          style: TextStyle(fontSize: screenWidth * 0.04,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "",
                                          style: TextStyle(fontSize: screenWidth * 0.04),
                                        )),
                                        DataCell(
                                          checkoutController.taxType.value ==
                                              'exclusive'
                                              ? Text(
                                            "₹${checkoutController.totalPrice}",
                                            style: TextStyle(fontSize: screenWidth * 0.04,
                                                fontWeight: FontWeight.bold),
                                          ) : Text(
                                            "₹${checkoutController.price}",
                                            style: TextStyle(fontSize: screenWidth * 0.04,
                                                fontWeight: FontWeight.bold),
                                          ),

                                        ),
                                      ]),
                                    ]);
                              }),

                              const Divider(
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 10,),
                              const Text(
                                "Support ",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      "Email : ", style: TextStyle(fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                                  Text("email@gmail.com", style: TextStyle(
                                      fontSize: 18),),
                                ],
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      "Phone : ", style: TextStyle(fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                                  Text("7456321004",
                                    style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ) :
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 15.0),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Image.asset(
                                      "assets/images/zynoblack.png", height: screenHeight * 0.04),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Rizrv Company", style: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.bold),),
                                      Text("Test address.",
                                        style: TextStyle(fontSize: screenWidth * 0.03,),),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  Text("ESTIMATE",
                                    style: TextStyle(color: Colors.red,
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold),),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "Bill To",
                                        style: TextStyle(fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.bold),
                                      ),

                                      Obx(() {
                                        return Text(
                                          "${checkoutController.username}",
                                          style: TextStyle(fontSize: screenWidth * 0.045),);
                                      }),
                                      const SizedBox(
                                        height: 4,
                                      ),

                                      Obx(() {
                                        return Text(
                                          "${checkoutController.useremail}",
                                          style: TextStyle(fontSize: screenWidth * 0.045),);
                                      }),
                                      const SizedBox(
                                        height: 4,
                                      ),

                                      Obx(() {
                                        return Text(
                                          "${checkoutController.usermobile}",
                                          style: TextStyle(fontSize: screenWidth * 0.045),);
                                      }),
                                      const SizedBox(
                                        height: 4,
                                      ),

                                      Text("India",
                                        style: TextStyle(fontSize: screenWidth * 0.045),),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Estimate Date:",
                                        style: TextStyle(fontSize: screenWidth * 0.045),),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        DateFormat("dd / MM / yyyy")
                                            .format(
                                            checkoutController
                                                .estimateDate.value)
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.045,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Obx(() {
                                return DataTable(
                                    dataRowHeight: 55,
                                    columnSpacing: screenWidth * 0.07,
                                    headingRowHeight: 50,
                                    headingRowColor: MaterialStateColor
                                        .resolveWith(
                                            (states) => Colors.black),
                                    columns: [
                                      const DataColumn(
                                        label: Text(
                                          'Description',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const DataColumn(
                                        label: Text(
                                          'Rate',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const DataColumn(
                                        label: Text(
                                          'Total',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                    rows: [
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "${checkoutController.serviceName}",
                                          style: TextStyle(fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "Our Price",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                        DataCell(Text(
                                          "₹${checkoutController.price}",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "GST ",
                                          style: TextStyle(fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "18%",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                        DataCell(
                                            checkoutController.taxType ==
                                                'exclusive'
                                                ?
                                            Text(
                                              "₹${checkoutController
                                                  .gstExclusive}",
                                              style: TextStyle(fontSize: 15),
                                            )
                                                : Text("Included ",
                                              style: TextStyle(fontSize: 15),
                                            )
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "Total Price ",
                                          style: TextStyle(fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                        DataCell(
                                          checkoutController.taxType.value ==
                                              'exclusive'
                                              ? Text(
                                            "₹${checkoutController.totalPrice}",
                                            style: TextStyle(fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ) : Text(
                                            "₹${checkoutController.price}",
                                            style: TextStyle(fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),

                                        ),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "Coupon Discount ",
                                          style: TextStyle(fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                        DataCell(
                                           Text("- ${checkoutController.coup_discount.value}%",
                                              style: TextStyle(fontSize: 15),
                                            )
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "Grand Total",
                                          style: TextStyle(fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                        DataCell(
                                          checkoutController.taxType.value ==
                                              'exclusive'
                                              ? Text(
                                            "₹${checkoutController.codeExclusivePrice}",
                                            style: TextStyle(fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ) : Text(
                                            "₹${checkoutController.codeInclusivePrice}",
                                            style: TextStyle(fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),

                                        ),
                                      ]),
                                    ]);
                              }),

                              const Divider(
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 10,),
                              const Text(
                                "Support ",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      "Email : ", style: TextStyle(fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                                  Text("${checkoutController.useremail}", style: TextStyle(
                                      fontSize: 18),),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      "Phone : ", style: TextStyle(fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                                  Text("${checkoutController.usermobile.value}",
                                    style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  checkoutController.codeResponse.value == false ?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      height: Get.width * 0.6,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Colors.white
                      ),
                      child: Column(
                        children: [
                          Text("Apply Coupon", style: TextStyle(fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: checkoutController.couponController,
                            decoration: InputDecoration(
                                hintText: "Coupon Code",
                                labelText: "Coupon Code",
                                border: OutlineInputBorder()
                            ),
                          ),
                          SizedBox(height: 16,),
                          InkWell(
                            onTap: () {
                              checkoutController.checkCoupon(
                                  checkoutController.couponController.text);
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(child: Text("Apply Coupon",
                                style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ) :
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          height: Get.width * 0.6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.white
                          ),
                          child: Stack(
                            children: [
                             Center(child: Image.asset("assets/images/discount.png",height: 250,)),
                              Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text("COUPON",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text("${checkoutController.coup_discount} %",style: TextStyle(fontSize: 60,color: Colors.white,fontWeight: FontWeight.bold),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 34.0,right: 20),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      children: [
                                        Text("S",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                                        Text("A",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                                        Text("L",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                                        Text("E",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                onPressed: (){
                                  checkoutController.codeResponse.value = false;
                                },
                                icon: Icon(Icons.cancel))
                        ),
                      ],
                    ),
                  ),

                  checkoutController.codeResponse.value == false ?
                  Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 50,
                      width: double.infinity,
                      child: FloatingActionButton.extended(
                          backgroundColor: primaryColor,
                          onPressed: () {
                            var options = {
                              'key': "rzp_test_vsSpBCHRz9XUp2",
                              'amount':
                              checkoutController.taxType.value == 'exclusive' ?
                              (int.parse(checkoutController.totalPrice.value
                                  .toString()) *
                                  100).toString()
                                  : (int.parse(
                                  checkoutController.price.value.toString()) *
                                  100)
                                  .toString(),
                              'name': 'Code With Mirza.',
                              // 'order_id': 'order_EMBFqjDHEEn80l',
                              'description': 'Demo payment',
                              'timeout': 300, // in seconds
                              'prefill': {
                                'contact': '${checkoutController.usermobile}',
                                'email': '${checkoutController.useremail}'
                              }
                            };
                            checkoutController.razorpay.open(options);
                          },
                          label: checkoutController.taxType.value == 'exclusive'
                              ? Text('Pay ₹${checkoutController.totalPrice}',
                            style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),)
                              : Text('Pay ₹${checkoutController.price}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),)),
                    );
                  }) :
                  Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 50,
                      width: double.infinity,
                      child: FloatingActionButton.extended(
                          backgroundColor: primaryColor,
                          onPressed: () {
                            var options = {
                              'key': "rzp_test_vsSpBCHRz9XUp2",
                              'amount':
                              checkoutController.taxType.value == 'exclusive' ?
                              (int.parse(checkoutController.codeExclusivePrice.value
                                  .toString()) *
                                  100).toString()
                                  : (int.parse(
                                  checkoutController.codeInclusivePrice.value.toString()) *
                                  100)
                                  .toString(),
                              'name': 'Code With Mirza.',
                              // 'order_id': 'order_EMBFqjDHEEn80l',
                              'description': 'Demo payment',
                              'timeout': 300, // in seconds
                              'prefill': {
                                'contact': '${checkoutController.usermobile}',
                                'email': '${checkoutController.useremail}'
                              }
                            };
                            checkoutController.razorpay.open(options);
                          },
                          label: checkoutController.taxType.value == 'exclusive'
                              ? Text('Pay ₹${checkoutController.codeExclusivePrice}',
                            style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),)
                              : Text('Pay ₹${checkoutController.codeInclusivePrice}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),)),
                    );
                  }),

                  SizedBox(height: 20,),
                ],
              );
            }),
          ),
        ));
  }
}
