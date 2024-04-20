import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stepper_a/stepper_a.dart';
import '../../../../constants.dart';
import '../controllers/orderdetails_controller.dart';

class OrderdetailsView extends GetView<OrderdetailsController> {
  OrderdetailsView({Key? key}) : super(key: key);
  OrderdetailsController orderdetailsController = Get.put(
      OrderdetailsController());

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
          'Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: orderdetailsController.orderId == ''
          ? Center(
          child: LoadingAnimationWidget.twistingDots(
            leftDotColor: Colors.green,
            rightDotColor: Colors.blue,
            size: 100,
          ))
          : Obx(() {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(" >> ORDER STATUS", style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 10,),
                  orderdetailsController.stepperMedthod(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ORDER #${orderdetailsController.getOrderId}",
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 8,),
                        Text("Order Placed : 20, Mar 2024", style: TextStyle(
                            fontSize: 16),),
                        Text("Order Status : ${orderdetailsController
                            .getorderStatus}", style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(color: Colors.grey,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Service Detail", style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 6,),
                            Text("Importer Exporter Code",
                              style: TextStyle(fontSize: 15),),
                            Text("Pay Method: ${orderdetailsController
                                .getPayMethod}",
                              style: TextStyle(fontSize: 15),),
                            Text("Pay Status: ${orderdetailsController
                                .getPayStatus}",
                              style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Payment History", style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 6,),
                            orderdetailsController.getTaxType == "exclusive" ?
                            Text(
                              "Price : ₹${orderdetailsController.getGstTotal}",
                              style: TextStyle(fontSize: 15),) :
                            Text("Price : ₹${orderdetailsController
                                .getSellingPrice}",
                              style: TextStyle(fontSize: 15),),
                            Text("GST: ${orderdetailsController.getGst}",
                              style: TextStyle(fontSize: 15),),
                            Text(
                              "Tax Type: ${orderdetailsController.getTaxType}",
                              style: TextStyle(fontSize: 15),),
                            orderdetailsController.getTaxType == "exclusive" ?
                            Text(
                              "Total : ₹${orderdetailsController.getGstTotal}",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.green),) :
                            Text("Total : ₹${orderdetailsController
                                .getSellingPrice}",
                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          ]),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(color: Colors.grey,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Uploded Document :", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),


                  SizedBox(
                    child: orderdetailsController.orderDetailModel.isEmpty ?
                        SizedBox(
                          height: 200,
                            width: double.infinity,
                            child: Center(child: Text("You haven't uploaded any document yet!",style: TextStyle(fontSize: 22),textAlign: TextAlign.center,))) :
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                          childAspectRatio: 1.6
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Obx(() {
                          return Container(
                            margin: EdgeInsets.all(7),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.grey),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network("${orderdetailsController
                                    .orderDetailModel[index].document}",
                                  fit: BoxFit.fill,)),
                          );
                        });
                      },
                    ),
                  )
                ]),
          ),
        );
      }),
    );
  }
}
