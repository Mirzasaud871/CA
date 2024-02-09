import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/app/modules/loginpage/views/loginpage_view.dart';
import 'package:vakil99/app/routes/app_pages.dart';
import 'package:vakil99/constants.dart';
import 'app/modules/bottombar/views/bottombar_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool? isLogin;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
    statusBarIconBrightness: Brightness.light,
  ));
  SharedPreferences shared = await SharedPreferences.getInstance();
  isLogin = shared.getBool(isUserLogin);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      title: "CA App",
      home: isLogin == true ?BottombarView() : LoginpageView(),
      getPages: AppPages.routes,
    );
  }
}

//
// class Wrapper extends StatefulWidget {
//   const Wrapper({super.key});
//
//   @override
//   State<Wrapper> createState() => _WrapperState();
// }
//
// class _WrapperState extends State<Wrapper> {
//
//   @override
//   void initState() {
//     super.initState();
//     checkLogin();
//   }
//
//   checkLogin() async {
//     bool? isUser = shared.getBool(isUserLogin);
//     if(isUser!){
//       Get.to(BottombarView());
//     }else{
//       Get.to(LoginpageView());
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
