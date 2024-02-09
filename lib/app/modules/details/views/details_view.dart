import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vakil99/app/modules/checkout/views/checkout_view.dart';
import 'package:vakil99/constants.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  DetailsView({Key? key}) : super(key: key);
  DetailsController detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            margin: EdgeInsets.all(8.0),
            height: 50,
            decoration: BoxDecoration(),
            width: double.infinity,
            child: FloatingActionButton.extended(
                backgroundColor: Colors.green,
                hoverColor: Colors.red,
                onPressed: () {
                  Get.to(CheckoutView(),
                  );
                },
                label: Text(
                  'Buy Now',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
          body: detailsController.image == ''
              ? Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: Colors.green,
                rightDotColor: Colors.blue,
                size: 100,
              ))
              : SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Obx(() {
                        return SizedBox(
                            width: double.infinity,
                            child: Image.network(
                                "${detailsController.image.value}"));
                      }),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Center(
                                child:
                                Icon(Icons.arrow_back_ios_rounded))),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          return Text(
                            "${detailsController.name.value}",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 25,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          return Row(
                            children: [
                              Text("Market Price : ",
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              Text("₹${detailsController.marketPrice}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      decoration:
                                      TextDecoration.lineThrough,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey)),
                            ],
                          );
                        }),
                        Obx(() {
                          return detailsController.taxType == 'exclusive'
                              ? Row(
                            children: [
                              Text("Company : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  )),
                              Text(
                                  "₹${detailsController.totalPrice}",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  " (${detailsController
                                      .taxType} ₹${detailsController
                                      .price} + ₹${detailsController
                                      .gstExclusive} GST)",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                              : Row(
                            children: [
                              Text("Company : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  )),
                              Text("₹${detailsController.price}",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  " (${detailsController
                                      .taxType} ₹${detailsController
                                      .price} GST)",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          );
                        }),
                        Obx(() {
                          return detailsController.taxType == 'exclusive'
                              ? Row(
                            children: [
                              Text("You Save : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  )),
                              Text(
                                  "₹${detailsController.savedPriceExclusive}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                              : Row(
                            children: [
                              Text("You Save : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  )),
                              Text(
                                  "₹${detailsController.savePriceInclusive}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          );
                        }),
                        SizedBox(
                          height: 8,
                        ),
                        Obx(() {
                          return detailsController.taxType == 'exclusive'
                              ? Text(
                            "Total : ₹${detailsController.totalPrice}",
                            style: TextStyle(
                                fontSize: 26,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                              : Text(
                            "Total : ₹${detailsController.price}",
                            style: TextStyle(
                                fontSize: 26,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                        SizedBox(
                          height: 6,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Text(
                          "Document Required",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Obx(() {
                            return Row(
                                children: List.generate(
                                  detailsController.detailsModelList.length,
                                      (index) =>
                                      Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Chip(
                                          elevation: 2,
                                          padding: EdgeInsets.all(4),
                                          backgroundColor: Colors.white,
                                          shadowColor: Colors.grey.shade300,
                                          label: Text(
                                            '${detailsController
                                                .detailsModelList[index].name}',
                                            style: TextStyle(fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                ));
                          }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Term & Condition",
                          style:
                          TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Html(
                          data: detailsController.description.value,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
