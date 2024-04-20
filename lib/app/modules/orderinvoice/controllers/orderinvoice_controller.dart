import 'package:get/get.dart';

import '../../../../Models/LedgerModel.dart';
import '../../../../apiservices.dart';
import '../../../../constants.dart';

class OrderinvoiceController extends GetxController {
  //TODO: Implement OrderinvoiceController

  var orderId = Get.arguments;
  final count = 0.obs;

  final getOrderId = ''.obs;
  final getTax = ''.obs;
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

  @override
  void onInit() {
    getOrder();
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

  getOrder() async{
    print("my single order function");
    print("object $orderId");
    var res = await ApiServices().getApi(singleOrderURL+orderId);
    res.fold((l){
      if(l['status'] == 200){
      print("api response ${res}");
      getTaxType.value = l['orders']['detail']['service']['tax_type'].toString();
      print("${getTaxType}");
      getOrderId.value = l['orders']['order_id'].toString();
      getDatecreate.value = l['orders']['created_at'].toString();
      getTax.value = l['orders']['order_id'].toString();
      getMarketPrice.value = l['orders']['detail']['service']['market_price'].toString();
      getSellingPrice.value = l['orders']['detail']['service']['price'].toString();
      getGst.value = l['orders']['detail']['service']['gst'].toString();
      getEmail.value = l['orders']['detail']['customer']['email'].toString();
      getName.value = l['orders']['detail']['customer']['name'].toString();
      getMobile.value = l['orders']['detail']['customer']['mobile_no'].toString();
      getCompanyName.value = l['orders']['detail']['service']['name'].toString();
      getDiscount.value = int.parse(getMarketPrice.value) - int.parse(getSellingPrice.value);
      getGstMinus.value = int.parse(getSellingPrice.value)  * int.parse(getGst.value) ~/ 100;
      getGstTotal.value = int.parse(getSellingPrice.value) + getGstMinus.value;
      }else if(l['status'] == 405){
        print("error order page 405");
      }
      update();
    },(r){
    });
  }
}
