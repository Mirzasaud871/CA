import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  CheckoutView({Key? key}) : super(key: key);
  CheckoutController checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(() {
          return Container(
            margin: const EdgeInsets.all(8.0),
            height: 50,
            width: double.infinity,
            child: FloatingActionButton.extended(
                backgroundColor: Colors.green,
                onPressed: () {},
                label: checkoutController.taxType.value == 'exclusive'
                    ? Text('Pay ₹${checkoutController.totalPrice}',
                  style: TextStyle(color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),)
                    : Text('Pay ₹${checkoutController.price}', style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),)),
          );
        }),
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
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
                              "assets/images/zynoblack.png", height: 38,),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Rizrv Company", style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),),
                                Text("Test address.",
                                  style: TextStyle(fontSize: 12,),),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Container(
                              height: 1,
                              width: 130,
                              color: Colors.grey,
                            ),
                            Spacer(),
                            Text("ESTIMATE", style: TextStyle(color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),),
                            Spacer(),
                            Container(
                              height: 1,
                              width: 130,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Bill To",
                                  style: TextStyle(fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),

                                Text("Saud Mirza",
                                  style: TextStyle(fontSize: 18),),
                                const SizedBox(
                                  height: 4,
                                ),

                                Text("lrs@gmail.com",
                                  style: TextStyle(fontSize: 18),),
                                const SizedBox(
                                  height: 4,
                                ),

                                Text("7456321004",
                                  style: TextStyle(fontSize: 18),),
                                const SizedBox(
                                  height: 4,
                                ),

                                Text("India", style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Estimate Date:",
                                  style: TextStyle(fontSize: 18),),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text("12-Jan-2024",
                                  style: TextStyle(fontSize: 20),),

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
                              headingRowHeight: 50,
                              headingRowColor: MaterialStateColor.resolveWith(
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
                                    "${checkoutController.name}",
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
                                      checkoutController.taxType == 'exclusive'
                                          ?
                                      Text(
                                        "₹${checkoutController.gstExclusive}",
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
                                    ) : Text("₹${checkoutController.price}",
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
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Email : ", style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                            Text("email@gmail.com", style: TextStyle(
                                fontSize: 18),),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Phone : ", style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                            Text("7456321004", style: TextStyle(fontSize: 18),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
