import 'package:get/get.dart';
import 'package:vakil99/app/modules/goodservices/modal/goodservices.dart';

class GoodservicesController extends GetxController{
  //TODO: Implement GoodservicesController

  final count = 0.obs;
  var filterlist = true.obs;
  var servicelist = <ServiceList>[
    ServiceList(image: "assets/images/goodser/fram1.jpg", marketPrice: "₹ 11000", offerPrice: "₹ 10000", savePrice: "₹ 1000", name: "GST Registration", route:""),
    ServiceList(image: "assets/images/goodser/fram2.gif", marketPrice: "₹ 12000", offerPrice: "₹ 11000", savePrice: "₹ 1000", name: "GST Return Filing", route:""),
    ServiceList(image: "assets/images/goodser/fram3.jpg", marketPrice: "₹ 6000", offerPrice: "₹ 5000", savePrice: "₹ 1000", name: "GST LUT Filing", route:""),
    ServiceList(image: "assets/images/goodser/fram4.jpg", marketPrice: "₹ 7000", offerPrice: "₹ 6000", savePrice: "₹ 1000", name: "Registration Cancellation", route:""),
    ServiceList(image: "assets/images/goodser/fram5.jpg", marketPrice: "₹ 6000", offerPrice: "₹ 5000", savePrice: "₹ 1000", name: "GST Annual Return", route:""),
    ServiceList(image: "assets/images/goodser/fram6.jpg", marketPrice: "₹ 7500", offerPrice: "₹ 6500", savePrice: "₹ 1000", name: "GST eInvoicing", route:""),
    ServiceList(image: "assets/images/goodser/fram7.jpg", marketPrice: "₹ 5000", offerPrice: "₹ 4000", savePrice: "₹ 1000", name: "eWay Bill", route:""),
    ServiceList(image: "assets/images/goodser/fram8.jpg", marketPrice: "₹ 8000", offerPrice: "₹ 7000", savePrice: "₹ 1000", name: "Input Tax Credit", route:""),
   ]; 
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
