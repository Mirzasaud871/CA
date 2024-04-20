import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';
import '../controllers/orderinvoice_controller.dart';

class OrderinvoiceView extends GetView<OrderinvoiceController> {
  OrderinvoiceView({Key? key}) : super(key: key);
  OrderinvoiceController orderinvoiceController = Get.put(
      OrderinvoiceController());

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
            'Invoice',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                ),

                                Text("Tax Invoice",
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
                            SizedBox(height: screenHeight * 0.01,),

                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Obx(() {
                                      return Text(
                                        "Order Id :\n${orderinvoiceController
                                            .getOrderId
                                            .value}",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.040,
                                            fontWeight: FontWeight.bold),);
                                    }),
                                    const SizedBox(
                                      height: 4,
                                    ),

                                    Text(
                                      "Tax : 2181430797",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.040),),
                                    SizedBox(
                                      height: 4,
                                    ),

                                    Obx(() {
                                      return Row(
                                        children: [
                                          Icon(Icons.calendar_month, size: 20,),
                                          SizedBox(width: 6,),
                                          Text(
                                      orderinvoiceController.getDatecreate.value != null
                                      ? DateFormat("dd/MM/yyyy").format(
                                      DateTime.parse(orderinvoiceController.getDatecreate.value))
                                          .toString()
                                          : '', // Handle case when getDatecreate.value is null
                                      style: TextStyle(fontSize: screenWidth * 0.040),
                                      ),
                                        ],
                                      );
                                    }),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text("Rizrv Company",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.040,
                                          fontWeight: FontWeight.bold),),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Test Address",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.040,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text("India",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.040),),
                                  ],
                                )
                              ],
                            ),

                            SizedBox(height: screenHeight * 0.01,),
                            Divider(color: Colors.grey,),
                            SizedBox(height: screenHeight * 0.01,),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                      "Shipping Address: \nbudhwariya",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.040,
                                          fontWeight: FontWeight.bold),),
                                    const SizedBox(
                                      height: 4,
                                    ),

                                    Text(
                                      "Tax : 2181430797",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.040),),
                                    SizedBox(
                                      height: 4,
                                    ),

                                    Obx(() {
                                      return Row(
                                        children: [
                                          Icon(Icons.calendar_month, size: 20,),
                                          SizedBox(width: 6,),
                                          Text(
                                            orderinvoiceController.getDatecreate.value != null
                                                ? DateFormat("dd/MM/yyyy").format(
                                                DateTime.parse(orderinvoiceController.getDatecreate.value))
                                                .toString()
                                                : '', // Handle case when getDatecreate.value is null
                                            style: TextStyle(fontSize: screenWidth * 0.040),
                                          ),

                                        ],
                                      );
                                    }),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Obx(() {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Billing Address: \nbudhwariya",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.040,
                                            fontWeight: FontWeight.bold),),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "${orderinvoiceController.getName
                                            .value}",
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.040,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text("${orderinvoiceController.getEmail}",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.040),),
                                    ],
                                  );
                                })
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02,),
                            Obx(() {
                              return SizedBox(
                                width: double.infinity,
                                child: DataTable(
                                    dataRowHeight: 55,
                                    headingRowHeight: 45,
                                    columnSpacing: 20,
                                    headingRowColor: MaterialStateColor
                                        .resolveWith(
                                            (states) => Colors.black),
                                    columns: [
                                      DataColumn(
                                        label: Text(
                                          'ITEM & Prices',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: screenWidth * 0.035,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          '',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: screenWidth * 0.035,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Total',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: screenWidth * 0.035,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                    rows: [
                                      DataRow(cells: [
                                        DataCell(
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                "${orderinvoiceController
                                                    .getCompanyName.value}",
                                                style: TextStyle(
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    fontSize: screenWidth *
                                                        0.035,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            )),
                                        DataCell(Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.035),
                                        )),
                                        DataCell(Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.035),
                                        )),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "Market Parice",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.035,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.035),
                                        )),
                                        DataCell(
                                            Text("₹${orderinvoiceController
                                                .getMarketPrice.value}",
                                              style: TextStyle(
                                                  fontSize: screenWidth *
                                                      0.035),
                                            )
                                        ),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "Selling Price ",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.035,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.035),
                                        )),
                                        DataCell(
                                          Text(
                                            "₹${orderinvoiceController
                                                .getSellingPrice.value}",
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                fontWeight: FontWeight.bold),
                                          ),

                                        ),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "Discount Price ",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.035,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.035),
                                        )),
                                        DataCell(
                                          Text(
                                            "₹${orderinvoiceController
                                                .getDiscount.value}",
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                fontWeight: FontWeight.bold),
                                          ),

                                        ),
                                      ]),
                                      DataRow(cells: [
                                        DataCell(Text(
                                          "Total Price ",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.035,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataCell(Text(
                                          "${orderinvoiceController.getGst
                                              .value}%\n GST",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.035),
                                        )),
                                        orderinvoiceController.getTaxType
                                            .value == 'exclusive' ?
                                        DataCell(
                                          Text(
                                            "₹${orderinvoiceController
                                                .getGstTotal.value}\nExclusive",
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ) :
                                        DataCell(
                                          Text(
                                            "₹${orderinvoiceController
                                                .getSellingPrice
                                              ..value}\nInclusive",
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ]),
                                    ]),
                              );
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
                                Obx(() {
                                  return Text(
                                    "${orderinvoiceController.getEmail}",
                                    style: TextStyle(
                                        fontSize: 18),);
                                }),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    "Phone : ", style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                                Obx(() {
                                  return Text(
                                    "${orderinvoiceController.getMobile}",
                                    style: TextStyle(fontSize: 18),);
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        )
    );
  }
}
