import 'package:get/get.dart';
import 'package:vakil99/Models/LedgerModel.dart';
import 'package:vakil99/apiservices.dart';
import 'package:vakil99/constants.dart';

class LedgerController extends GetxController {
  //TODO: Implement LedgerController

  RxList<LastPaymentData> ledgerModelList = <LastPaymentData>[].obs;
  final count = 0.obs;
  var getTotalOrders = ''.obs;
  var getTotalAmount = ''.obs;
  var getDueAmount = ''.obs;
  @override
  void onInit() {
    getLedger();
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

  getLedger() async{
    var res = await ApiServices().getApi(ledgerURL);
    res.fold((l){
      print(l['status']);
      if(l['status'] == 200){
        print("api Response $res");
      getTotalOrders.value = l['ledger']['total_orders'].toString();
      getTotalAmount.value = l['ledger']['total_amount_paid'].toString();
      getDueAmount.value = l['ledger']['ledger_amount_due'].toString();
      List ledgerList = l['ledger']['ledger'];
      ledgerModelList.addAll(ledgerList.map((e) => LastPaymentData .fromJson(e)));
      }
      print(ledgerModelList.value);
      print("GetTotal $getTotalAmount");
    },(r){});
  }
}
