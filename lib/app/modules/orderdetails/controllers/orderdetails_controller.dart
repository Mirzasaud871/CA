
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vakil99/Models/DocumnetModel.dart';

import '../../../../apiservices.dart';
import '../../../../constants.dart';

class OrderdetailsController extends GetxController {
  //TODO: Implement OrderdetailsController

  RxList<Documents> orderDetailModel = <Documents>[].obs;
  var orderId = Get.arguments;
  final count = 0.obs;

  final getOrderId = ''.obs;
  final getorderStatus = ''.obs;
  final getEmail = ''.obs;
  final getCompanyName = ''.obs;
  final getMarketPrice = ''.obs;
  final getSellingPrice = ''.obs;
  final getMobile = ''.obs;
  final getGst = ''.obs;
  final getDiscount = 0.obs;
  final getGstMinus = 0.obs;
  final getGstTotal = 0.obs;
  final getName = ''.obs;
  final getTaxType = ''.obs;
  final getDatecreate = ''.obs;
  final getPayMethod = ''.obs;
  final getPayStatus = ''.obs;

  final currentStep = 0.obs;

  final List<Step> steps = [
    Step(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Placed'),
          Text('Order placed successfully'),
        ],
      ),
      content: Container(
        child: Text(''),
      ),
    ),
    Step(
      title: Text('Pending'),
      content: Container(
        child: Text('Enter shipping details here'),
      ),
    ),
    Step(
      title: Text('In Review'),
      content: Container(
        child: Text('Choose payment method here'),
      ),
    ),
    Step(
      title: Text('Processing'),
      content: Container(
        child: Text('Review and confirm your order here'),
      ),
    ),
    Step(
      title: Text('Processing'),
      content: Container(
        child: Text('Review and confirm your order here'),
      ),
    ),
  ];

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }

  void nextStep() {
    if (currentStep.value < steps.length - 1) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  getOrder() async {
    print("my single order function");
    print("object $orderId");
    var res = await ApiServices().getApi(singleOrderURL + orderId);
    res.fold((l) {
      if (l['status'] == 200) {
        print("api response ${res}");
        getorderStatus.value = l['orders']['order_status'].toString();
        getTaxType.value =
            l['orders']['detail']['service']['tax_type'].toString();
        print("${getTaxType}");
        getOrderId.value = l['orders']['order_id'].toString();
        getDatecreate.value = l['orders']['created_at'].toString();
        getMarketPrice.value =
            l['orders']['detail']['service']['market_price'].toString();
        getSellingPrice.value =
            l['orders']['detail']['service']['price'].toString();
        getGst.value = l['orders']['detail']['service']['gst'].toString();
        getPayMethod.value = l['orders']['payment_method'].toString();
        getPayStatus.value = l['orders']['payment_status'].toString();
        getEmail.value = l['orders']['detail']['customer']['email'].toString();
        getName.value = l['orders']['detail']['customer']['name'].toString();
        getMobile.value =
            l['orders']['detail']['customer']['mobile_no'].toString();
        getCompanyName.value =
            l['orders']['detail']['service']['name'].toString();
        getDiscount.value =
            int.parse(getMarketPrice.value) - int.parse(getSellingPrice.value);
        getGstMinus.value =
            int.parse(getSellingPrice.value) * int.parse(getGst.value) ~/ 100;
        getGstTotal.value =
            int.parse(getSellingPrice.value) + getGstMinus.value;
        List AddDocumentList = l['orders']['documents'];
        orderDetailModel.addAll(AddDocumentList.map((e) => Documents.fromJson(e)));
      } else if (l['status'] == 405) {
        print("error order page 405");
      }
      update();
    }, (r) {});
  }

  Widget stepperMedthod() {
    switch (getorderStatus.value) {
      case 'pending':
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: EasyStepper(
            activeStep: 1,
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: Colors.black87,
            internalPadding: 16,
            showLoadingAnimation: false,
            stepRadius: 10,
            showStepBorder: false,
            steps: [
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'Order Placed',
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'Pending',
                topTitle: true,
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.orangeAccent),
                  child: Center(child: Text("3",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                ),
                title: 'In Review',
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.orangeAccent),
                    child: Center(child: Text("4",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                ),
                title: 'Processing',
                topTitle: true,
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.orangeAccent),
                    child: Center(child: Text("5",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                ),
                title: 'Complete',
              ),
            ],
            onStepReached: (index) => currentStep.value = index,
          ),
        );
        break;
      case "in review":
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: EasyStepper(
            activeStep: 2,
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: Colors.black87,
            internalPadding: 16,
            showLoadingAnimation: false,
            stepRadius: 10,
            showStepBorder: false,
            steps: [
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'Order Placed',
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'Pending',
                topTitle: true,
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'In Review',
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.orangeAccent),
                    child: Center(child: Text("4",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                ),
                title: 'Processing',
                topTitle: true,
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.orangeAccent),
                    child: Center(child: Text("5",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                ),
                title: 'Complete',
              ),
            ],
            onStepReached: (index) => currentStep.value = index,
          ),
        );
        // do something else
        break;
      case "processing":
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: EasyStepper(
            activeStep: 3,
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: Colors.black87,
            internalPadding: 16,
            showLoadingAnimation: false,
            stepRadius: 10,
            showStepBorder: false,
            steps: [
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'Order Placed',
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'Pending',
                topTitle: true,
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'In Review',
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'Processing',
                topTitle: true,
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.orangeAccent),
                    child: Center(child: Text("5",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                ),
                title: 'Complete',
              ),
            ],
            onStepReached: (index) => currentStep.value = index,
          ),
        );
        break;
      case "completed":
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: EasyStepper(
            activeStep: 4,
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: Colors.black87,
            internalPadding: 16,
            showLoadingAnimation: false,
            stepRadius: 10,
            showStepBorder: false,
            steps: [
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'Order Placed',
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'Pending',
                topTitle: true,
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'In Review',
              ),
              EasyStep(
                customStep: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'Processing',
                topTitle: true,
              ),
              EasyStep(
                customStep:  Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: Icon(Icons.check,size: 18,color: Colors.white,),
                ),
                title: 'Complete',
              ),
            ],
            onStepReached: (index) => currentStep.value = index,
          ),
        );
        break;
    }
    return Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: Colors.green,
          rightDotColor: Colors.blue,
          size: 100,
        ));
  }
}
