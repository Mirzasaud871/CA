import 'package:get/get.dart';
import 'package:vakil99/apiservices.dart';
import 'package:vakil99/constants.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController

  final image = ''.obs;
  final name = ''.obs;
  final marketPrice = ''.obs;
  final price = ''.obs;
  final gst = ''.obs;
  final description = ''.obs;
  final taxType = ''.obs;
  final panCard = ''.obs;
  final aadharCard = ''.obs;
  final gstCard = ''.obs;
  final dscCard = ''.obs;
  int gstDivision = 100;

  final savePriceInclusive = 0.obs;
  final savedPriceExclusive = 0.obs;
  final gstExclusive = 0.obs;
  final totalPrice = 0.obs;
  final slugs = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    getCheckout();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCheckout() async{
    var res = await ApiServices().getApi(estimateURL+slugs);
    res.fold((l){
      if(l['status'] == 200){
        print("Api response $res");
        name.value = l['ca_services']['name'].toString();
        image.value = l['ca_services']['image'].toString();
        marketPrice.value = l['ca_services']['market_price'].toString();
        price.value = l['ca_services']['price'].toString();
        gst.value = l['ca_services']['gst'].toString();
        taxType.value = l['ca_services']['tax_type'].toString();
        description.value = l['ca_services']['description'].toString();
        gstExclusive.value = int.parse(price.value) * int.parse(gst.value) ~/ 100;
        totalPrice.value = int.parse(price.value) + gstExclusive.value;
        savedPriceExclusive.value = int.parse(marketPrice.value) - totalPrice.value;
        savePriceInclusive.value = int.parse(marketPrice.value) - int.parse(price.value);
        panCard.value = l['ca_services']['docs'][0].toString();
        aadharCard.value = l['ca_services']['docs'][1].toString();
        gstCard.value = l['ca_services']['docs'][2].toString();
        dscCard.value = l['ca_services']['docs'][3].toString();
        panCard.value = l['ca_services']['docs'][4].toString();
      }
    },(r){

    });
  }

}
