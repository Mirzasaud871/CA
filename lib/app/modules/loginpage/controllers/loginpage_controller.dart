import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/Models/UserModel.dart';
import 'package:vakil99/apiservices.dart';
import 'package:vakil99/app/modules/createpassword/views/createpassword_view.dart';
import 'package:vakil99/app/modules/home/views/home_view.dart';
import 'package:vakil99/constants.dart';
import '../../bottombar/views/bottombar_view.dart';

class LoginpageController extends GetxController {
  //TODO: Implement LoginpageController
  final passwordVisible = false.obs;
  final count = 0.obs;
  final isCheckEmail = false.obs;
  final isCreatepass = false.obs;
  final isEmail = false.obs;
  final isPhoneNumber = false.obs;
  final formKey = GlobalKey<FormState>();
  var statusString = 'welcome'.obs;
  var codeSent = 'no'.obs;
  var myVerificationId = '1'.obs;
  late RoundedLoadingButtonController loadingButtonController;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String get result => statusString.value;
  String get codeSentResult => codeSent.value;
  String get verifyResult => myVerificationId.value;
  String get verifyPassword => myVerificationId.value;

  var isLoading = false.obs;
  var userId = ''.obs;
  var amount = ''.obs;


  late TextEditingController phoneNumber = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passController = TextEditingController();
  late TextEditingController confirmPassController = TextEditingController();
  late TextEditingController codeController = TextEditingController();
  late TextEditingController mobileController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  UserModel userdata = UserModel();


  @override
  void onInit() {
    // phoneNumber = TextEditingController();
    // passController = TextEditingController();
    // emailController = TextEditingController();
    // codeController = TextEditingController();
    loadingButtonController = RoundedLoadingButtonController();
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

  // signInPhoneNumber({required String myPhoneNumber}) async {
  //   if (myPhoneNumber.length != 10) {
  //     Get.snackbar(
  //       'Incorrect Number',
  //       'Please Provide 10 digit Phone Number',
  //       margin: const EdgeInsets.all(20),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red.withOpacity(0.6),
  //     );
  //   } else {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: '+91$myPhoneNumber',
  //       //Triggers if phone number is verified
  //       verificationCompleted: (_) {},
  //       //Triggers if verification fails
  //       verificationFailed: (FirebaseException exception) {
  //         statusString.value = 'Error Verifying Your Phone Number';
  //       },
  //       //triggered when firebase sends a code
  //       codeSent: (verificationId, responseToken) {
  //         print('Code Sent triggered');
  //         codeSent.value = 'yes';
  //         myVerificationId.value = verificationId;
  //         isLoading.value = false;
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //       timeout: const Duration(seconds: 30),
  //     );
  //   }
  // }
  //
  // myCredentials(String verId, String userId) async {
  //   AuthCredential authCredential =
  //       PhoneAuthProvider.credential(verificationId: verId, smsCode: userId);
  //   firebaseAuth.signInWithCredential(authCredential).then((UserCredential) {
  //     print("ffffffffff");
  //     Get.offAll(BottombarView());
  //   }).catchError((e) {
  //     print('Ye Hai Error:- $e');
  //     Get.snackbar(
  //       'Invalid OTP',
  //       'Please Provide Correct OTP',
  //       margin: const EdgeInsets.all(20),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red.withOpacity(0.6),
  //     );
  //   });
  // }

  // void increment() => count.value++;

  loginCheckuser(String email) async{
    print("function start");
    var res = await ApiServices().postApi(loginCheckURL,{
      'email' : email,
    });
    print("response $res");
    res.fold((l){
      if(l['status'] == 200){
        print("register page ${l['message']}");
        isCheckEmail.value = true;
        loadingButtonController.reset();
      }else{
        print("already exist ${l['error']}");
        isEmail.value = true;
        loadingButtonController.reset();
      }
    },(r){
      print("error login check");
    });
  }

  loginUser(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res = await ApiServices().postApi(loginURL,{
      'email': email,
      'password': password,
    });
    res.fold((l) {
      print(l['message']);
      if(l['status'] == 200){
        print("chnahge password $res");
        passController.clear();
        confirmPassController.clear();
        emailController.clear();
        userdata = UserModel.fromJson(l['customer']);
        sharedPreferences.setBool(isUserLogin,true);
        sharedPreferences.setInt(user_Id, userdata.id!);
        sharedPreferences.setString(userName, userdata.name!);
        sharedPreferences.setString(userImage, userdata.image!);
        sharedPreferences.setString(userToken, userdata.token!);
        sharedPreferences.setString(userEmail, userdata.email!);
        sharedPreferences.setString(userMobile, userdata.mobileNo!);
        Get.offAll(HomeView());
        loadingButtonController.reset();
        isEmail.value = false;
      }
    }, (r) {
    });
  }

  getRegister(String email , String name, String mobile) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("register");
    var res = await ApiServices().postApi(
        registrationURL,{
      'name' : name,
      'email' : email,
      'mobile_no' : mobile
    });
    res.fold((l){
      if(l['status'] == 200){
        print("api register response $res");
        isEmail.value = false;
        isCheckEmail.value = false;
        isCreatepass.value = true;
        userdata = UserModel.fromJson(l['customer']);
        sharedPreferences.setBool(isUserLogin,true);
        sharedPreferences.setInt(user_Id, userdata.id!);
        sharedPreferences.setString(userName, userdata.name!);
        sharedPreferences.setString(userImage, userdata.image!);
        sharedPreferences.setString(userToken, userdata.token!);
        sharedPreferences.setString(userEmail, userdata.email!);
        nameController.clear();
        mobileController.clear();
      }else if(l['status'] == 400){
        Get.snackbar(
            "Try Again !",
            "This Mobile number is already registered with other User",
        backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM
        );
      }
    },(r){

    });
  }

  createPassword(String email, String password, String confirm_pass) async{
    var res = await ApiServices().postApi(
        changePasswordURL,
        {
          'email' : email,
          'password' : password,
          'confirm_password' : confirm_pass,
        });
    res.fold((l){
      if(l['status'] == 200){
        print('login user compelete');
        loginUser(emailController.text, passController.text);
      }
    },(r){

    });
  }


}
