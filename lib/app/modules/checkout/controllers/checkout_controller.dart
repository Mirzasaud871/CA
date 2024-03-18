import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/apiservices.dart';
import 'package:vakil99/app/modules/myorder/controllers/myorder_controller.dart';
import 'package:vakil99/constants.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController
  MyorderController myorderController = Get.put(MyorderController());

  TextEditingController couponController = TextEditingController();

  final codeResponse = false.obs;
  var estimateDate = DateTime.now().obs;

  //get data
  final image = ''.obs;
  final serviceName = ''.obs;
  final marketPrice = ''.obs;
  final price = ''.obs;
  final gst = ''.obs;
  final description = ''.obs;
  final taxType = ''.obs;
  final panCard = ''.obs;
  final aadharCard = ''.obs;
  final gstCard = ''.obs;
  final dscCard = ''.obs;
  final service_slug = ''.obs;
  final service_Id = ''.obs;

  // get data conditions
  final savePriceInclusive = 0.obs;
  final savedPriceExclusive = 0.obs;
  final gstExclusive = 0.obs;
  final totalPrice = 0.obs;
  final slugs = Get.arguments;

  //user data
  RxString username = ''.obs;
  RxString useremail = ''.obs;
  RxString usermobile = ''.obs;
  var userid = 0.obs;
  var razorpay = Razorpay();

  // Coupon data
  final codeInclusivePrice = 0.obs;
  final codeExclusivePrice = 0.obs;
  final codeExclusiveMinus = 0.obs;
  final codeInclusiveMinus = 0.obs;
  final coup_id = 0.obs;
  final coup_discount = 0.obs;
  final coup_discount_type = "".obs;

  @override
  void onInit() {
    super.onInit();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getCheckout();
    getinform();
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
    couponController.clear();
  }

  firstDate()async{
    DateTime? datePicked = await showDatePicker(
        context: Get.context!,
        initialDate: estimateDate.value,
        firstDate: DateTime(1995),
        lastDate: DateTime(2025),
        builder: (context , child) => Theme(
          child: child!,
          data: ThemeData(
              colorScheme: const ColorScheme.light(
                  onSurface: Colors.black,
                  surface: Colors.white,
                  primary: Colors.blue
              )
          ),
        )
    );
    if(datePicked != null && datePicked != estimateDate.value){
      estimateDate.value = datePicked;

    }
  }

  _handlePaymentSuccess(PaymentSuccessResponse response,) async {
    print("Payment Successful TXN: ${response.paymentId}");
    codeResponse.value = false;
    var res = await ApiServices().postApi(placeOrderURL, {
      'txt_id' : response.paymentId.toString(),
      'payment_status' : "paid",
      'payment_session_id'  : "null",
      'customer_id' : userid.value.toString(),
      'customer_name' : username.value.toString(),
      'customer_email' : useremail.value.toString(),
      'customer_phone' : usermobile.value.toString(),
      'service_id' : service_Id.value.toString(),
      'service_name' : serviceName.value.toString(),
      'service_slug' : service_slug.value.toString(),
      'service_discount' : coup_discount.value.toString(),
      'service_discount_type' : coup_discount_type.value.toString(),
      'coup_id' : coup_id.value.toString(),
      'coup_code' : couponController.text.toString(),
      'amount' : codeResponse.value == false ?
      taxType.value == 'exclusive' ?
      totalPrice.value.toString() :
      price.value.toString() :
      taxType.value == 'exclusive' ?
          codeExclusivePrice.toString():
          codeInclusivePrice.toString()
    });
    myorderController.myOrderlistModel.clear();
    myorderController.getOrder();
    Get.back();
    Get.snackbar("Order Success", "Payment Successfully",
        backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);
    print("response $res");
    print("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment fail");
    Get.snackbar("Try Again", "Payment failed",
        backgroundColor: redColor, snackPosition: SnackPosition.BOTTOM);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print("Payment Wallet");
  }

  getinform() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    useremail.value = sharedPreferences.getString(userEmail)!;
    username.value = sharedPreferences.getString(userName)!;
    usermobile.value = sharedPreferences.getString(userMobile)!;
    userid.value = sharedPreferences.getInt(user_Id)!;
  }

  getCheckout() async {
    var res = await ApiServices().getApi(estimateURL + slugs);
    res.fold((l) {
      if (l['status'] == 200) {
        print("Api response $res");
        serviceName.value = l['ca_services']['name'].toString();
        image.value = l['ca_services']['image'].toString();
        marketPrice.value = l['ca_services']['market_price'].toString();
        price.value = l['ca_services']['price'].toString();
        gst.value = l['ca_services']['gst'].toString();
        taxType.value = l['ca_services']['tax_type'].toString();
        description.value = l['ca_services']['description'].toString();
        service_slug.value = l['ca_services']['slug'].toString();
        service_Id.value = l['ca_services']['id'].toString();
        gstExclusive.value =
            int.parse(price.value) * int.parse(gst.value) ~/ 100;
        totalPrice.value = int.parse(price.value) + gstExclusive.value;
        savedPriceExclusive.value =
            int.parse(marketPrice.value) - totalPrice.value;
        savePriceInclusive.value =
            int.parse(marketPrice.value) - int.parse(price.value);
        panCard.value = l['ca_services']['docs'][0].toString();
        aadharCard.value = l['ca_services']['docs'][1].toString();
        gstCard.value = l['ca_services']['docs'][2].toString();
        dscCard.value = l['ca_services']['docs'][3].toString();
        panCard.value = l['ca_services']['docs'][4].toString();
      }
    }, (r) {});
  }

  checkCoupon(String coupon) async{
    var res = await ApiServices().postApi(applyCouponURL,
        {"code": coupon,});
    print("namecode $coupon");
    res.fold((l){
      if(l['status'] == 200){
        print("Left responsive $res");
        coup_id.value = l['coupon']['id'];
        coup_discount.value = l['coupon']['discount'];
        coup_discount_type.value = l['coupon']['type'];
        print("Api response ${coup_id.value}");
        codeResponse.value = true;
        codeExclusiveMinus.value = totalPrice.value * coup_discount.value ~/ 100;
        codeInclusiveMinus.value = int.parse(price.value) * coup_discount.value ~/ 100;
        codeExclusivePrice.value = totalPrice.value - codeExclusiveMinus.value;
        codeInclusivePrice.value = int.parse(price.value) - codeInclusiveMinus.value;
      }else{
        Get.snackbar(
            "Coupon",
            "Invalid Coupon",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM
        );
      }
    },(r){
    });
  }

}
