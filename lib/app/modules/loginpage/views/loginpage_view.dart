import 'dart:async';
import 'dart:math';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/app/modules/bottombar/views/bottombar_view.dart';
import 'package:vakil99/app/modules/createpassword/views/createpassword_view.dart';
import 'package:vakil99/constants.dart';
import '../controllers/loginpage_controller.dart';

class LoginpageView extends GetView<LoginpageController> {
  LoginpageView({Key? key}) : super(key: key);
  LoginpageController loginController = Get.put(LoginpageController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //Login Screen
    Widget loginScreen() {
      return Obx(() {
        return loginController.isLoading == true
            ? LoadingAnimationWidget.staggeredDotsWave(
                color: secondaryColor, size: 50)
            : DelayedDisplay(
                slidingBeginOffset: const Offset(0, -0.4),
                delay: const Duration(milliseconds: 300),
                child: Form(
                  key: loginController.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: size.width / 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Login Now",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: size.width / 30),

                      ///Mobile Number TextField
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: size.width,
                          height: size.width / 7,
                          child: TextFormField(
                            maxLength: 30,
                            controller: loginController.emailController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              counterText: '',
                              alignLabelWithHint: true,
                              hintStyle:
                                  TextStyle(fontSize: 14),
                              hintText: "Please enter email",
                              prefixIcon: Icon(
                                Icons.phone,
                                color: primaryColor,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      //Login Button
                      RoundedLoadingButton(
                        color: primaryColor,
                        controller: loginController.loadingButtonController,
                        onPressed: () {
                          if (loginController.emailController.text.isEmpty) {
                            loginController.loadingButtonController.reset();
                            Get.snackbar('Error', "PLease enter correct mail",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: redColor);
                          } else if (loginController
                              .emailController.text.isEmail) {
                            loginController.loginCheckuser(
                                loginController.emailController.text);
                            Timer(Duration(seconds:15), () {
                                loginController.emailController.clear();
                                loginController.loadingButtonController.reset();
                              });
                          } else {
                            loginController.loadingButtonController.reset();
                            Get.snackbar('Error', "PLease enter correct mail",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: redColor);
                          }
                          // loginController.formKey.currentState!.validate();
                          // if(loginController.isPhoneNumber.value == true && loginController.isEmail.value == false){
                          //   print('Phone Number :- ${loginController.phoneNumber.text}');
                          //
                          //   await loginController.signInPhoneNumber(
                          //       myPhoneNumber: loginController.phoneNumber.text);
                          //   Timer(Duration(seconds: loginController.phoneNumber.text.length != 10
                          //           ? 0
                          //           : 10), () {
                          //     loginController.emailController.clear();
                          //     loginController.loadingButtonController.reset();
                          //     loginController.isPhoneNumber.value = false;
                          //     loginController.isEmail.value = false;
                          //   });
                          // }else if(loginController.isPhoneNumber.value == false && loginController.isEmail.value == true){
                          //   print('Email Triggered ${loginController.emailController.text}',);
                          // }
                        },
                        child: const DelayedDisplay(
                          slidingBeginOffset: Offset(0, -0.4),
                          delay: Duration(milliseconds: 300),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Stack(
                              children: [
                                Center(
                                    child: Text(
                                  'Next',
                                  style: buttonTitleLight,
                                )),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      });
    }

    //OTP Screen
    Widget otpScreen() {
      return DelayedDisplay(
        slidingBeginOffset: const Offset(0, -0.4),
        delay: const Duration(milliseconds: 300),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Verification Code',
                style: titleDark,
              ),
            ),
            SizedBox(height: size.width / 25),
            Text.rich(
              TextSpan(
                  text: 'Enter The 6 Digit OTP SentVia SMS\n',
                  style: subTitleDark,
                  children: [
                    TextSpan(
                        text:
                            'On Your Mobile (+91-${loginController.phoneNumber.text})',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ]),
            ),
            SizedBox(height: size.width / 20),

            //OTP TextField
            PinCodeTextField(
              controller: loginController.codeController,
              appContext: context,
              length: 6,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: size.width * 0.15,
                fieldWidth: size.width * 0.12,
                selectedFillColor: Colors.white,
                selectedColor: primaryColor,
                inactiveColor: Colors.grey.shade400,
                inactiveFillColor: Colors.white,
                activeColor: primaryColor,
                activeFillColor: Colors.white,
              ),
              cursorColor: Colors.black,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              keyboardType: TextInputType.number,
              onChanged: (value) {},
              onCompleted: (_) {
                loginController.codeController.value;
              },
              beforeTextPaste: (text) {
                debugPrint("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),

            SizedBox(height: size.width / 20),

            //OTP Verification Button
            RoundedLoadingButton(
              color: primaryColor,
              controller: loginController.loadingButtonController,
              onPressed: () async {
                String userInput = loginController.codeController.text;
                print(loginController.verifyResult);
                // loginController.myCredentials(loginController.verifyResult, userInput);
                Timer(
                    Duration(
                        seconds: loginController.codeController.text.length != 6
                            ? 0
                            : 10), () {
                  loginController.loadingButtonController.reset();
                });
              },
              child: const DelayedDisplay(
                slidingBeginOffset: Offset(0, -0.4),
                delay: Duration(milliseconds: 300),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Stack(
                    children: [
                      Center(
                          child: Text(
                        'VERIFY OTP',
                        style: buttonTitleLight,
                      )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Did Not Received?"),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ),
      );
    }

    //Password Screen
    Widget passwordScreen() {
      return DelayedDisplay(
        slidingBeginOffset: const Offset(0, -0.4),
        delay: const Duration(milliseconds: 300),
        child: Form(
          key: loginController.formKey,
          child: Column(
            children: [
              SizedBox(height: size.width / 25),
              const Text(
                "Please enter your password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.width / 20),

              //Passs TextField
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "required";
                  } else {}
                  return val;
                },
                controller: loginController.passController,
                obscureText: loginController.passwordVisible.value,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(loginController.passwordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      loginController.passwordVisible.value =
                          !loginController.passwordVisible.value;
                    },
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                ),
              ),

              SizedBox(height: size.width / 20),

              //OTP Verification Button
              RoundedLoadingButton(
                color: primaryColor,
                controller: loginController.loadingButtonController,
                onPressed: () async {
                  SharedPreferences sharedPrefrence =
                      await SharedPreferences.getInstance();

                  loginController
                      .loginUser(loginController.emailController.text,
                          loginController.passController.text)
                      .then((value) {
                    bool? isLogin = sharedPrefrence.getBool(isUserLogin);
                    if (isLogin!) {
                      loginController.emailController.clear();
                      loginController.passController.clear();
                    } else {
                      loginController.passController.clear();
                      loginController.loadingButtonController.reset();
                      Get.snackbar(
                          "Wrong Password", "Please enter Valid Password",
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  });
                  // String userPassword = loginController.passController.text;
                  // print(loginController.verifyPassword);
                  // loginController.loginUser(loginController.verifyResult, userPassword,);
                  // Timer(
                  //     Duration(
                  //         seconds: loginController.passController.text.length == ""
                  //             ? 0
                  //             : 10), () {
                  //   loginController.loadingButtonController.reset();
                  // });
                },
                child: const DelayedDisplay(
                  slidingBeginOffset: Offset(0, -0.4),
                  delay: Duration(milliseconds: 300),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Stack(
                      children: [
                        Center(
                            child: Text(
                          'Login',
                          style: buttonTitleLight,
                        )),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Change Email Address?"),
                  TextButton(
                      onPressed: () {
                        loginController.isEmail.value = false;
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              )
            ],
          ),
        ),
      );
    }

    //Registration Screen
    Widget registerScreen() {
      return DelayedDisplay(
        slidingBeginOffset: const Offset(0, -0.4),
        delay: const Duration(milliseconds: 300),
        child: Form(
          key: loginController.formKey,
          child: Column(
            children: [
              SizedBox(height: size.width / 25),
              const Text(
                "Registration",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.width / 20),

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: "${loginController.emailController.text}",
                      suffixIcon: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100))))),
              SizedBox(height: size.width / 20),

              TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "required";
                    }
                    return null;
                  },
                  controller: loginController.nameController,
                  decoration: const InputDecoration(
                      hintText: "Name",
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100))))),
              SizedBox(height: size.width / 20),
              TextFormField(

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "required";
                    }
                    return null;
                  },
                  controller: loginController.mobileController,
                  decoration: const InputDecoration(
                      hintText: "Mobile No.",
                      suffixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100))))),
              SizedBox(height: size.width / 20),

              //OTP Verification Button
              RoundedLoadingButton(
                color: primaryColor,
                controller: loginController.loadingButtonController,
                onPressed: () {
                  if (loginController.nameController.text.isEmpty &&
                      loginController.mobileController.text.isEmpty) {
                    loginController.formKey.currentState!.validate();
                    Get.snackbar('Error', "PLease fill text field",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: redColor);
                  } else if (loginController.nameController != "" &&
                      loginController.mobileController.text.length == 10) {
                    loginController.getRegister(
                        loginController.emailController.text,
                        loginController.nameController.text,
                        loginController.mobileController.text);

                  } else {
                    Get.snackbar('Error', "",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: redColor);
                  }
                  Timer(
                      Duration(
                          seconds: loginController.nameController.text.isEmpty
                              ? 0
                              : 10), () {
                    loginController.loadingButtonController.reset();
                  });
                  // String userPassword = loginController.passController.text;
                  // print(loginController.verifyPassword);
                  // loginController.loginUser(loginController.verifyResult, userPassword,);
                  // Timer(
                  //     Duration(
                  //         seconds: loginController.passController.text.length == ""
                  //             ? 0
                  //             : 10), () {
                  //   loginController.loadingButtonController.reset();
                  // });
                },
                child: const DelayedDisplay(
                  slidingBeginOffset: Offset(0, -0.4),
                  delay: Duration(milliseconds: 300),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Stack(
                      children: [
                        Center(
                            child: Text(
                          'Register',
                          style: buttonTitleLight,
                        )),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Change Email Address?"),
                  TextButton(
                      onPressed: () =>
                          loginController.isCheckEmail.value = false,
                      child: const Text(
                        "Back",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              )
            ],
          ),
        ),
      );
    }

    //create password
    Widget createPassScreen() {
      return DelayedDisplay(
        slidingBeginOffset: const Offset(0, -0.4),
        delay: const Duration(milliseconds: 300),
        child: Form(
          key: loginController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Logo Image
              DelayedDisplay(
                slidingBeginOffset: const Offset(0, -0.4),
                delay: const Duration(milliseconds: 300),
                child: Column(
                  children: [
                    Text("Create Password"),
                    const SizedBox(height: 30),
                    TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: "${loginController.emailController.text}",
                            suffixIcon: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))))),
                    SizedBox(height: 20),
                    TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "required";
                          }
                          return null;
                        },
                        controller: loginController.passController,
                        decoration: const InputDecoration(
                            hintText: "Passsword",
                            suffixIcon: Icon(Icons.visibility),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))))),
                    SizedBox(height: 20),
                    TextFormField(
                        validator: (val) {
                          if (loginController.passController.text !=
                              loginController.confirmPassController.text) {
                            return "required Same Password";
                          }
                          return null;
                        },
                        controller: loginController.confirmPassController,
                        decoration: const InputDecoration(
                            hintText: "Confrim Password",
                            suffixIcon: Icon(Icons.visibility),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))))),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedLoadingButton(
                      color: primaryColor,
                      controller: loginController.loadingButtonController,
                      onPressed: () {
                        loginController.formKey.currentState!.validate();
                        if (loginController.passController.text ==
                            loginController.confirmPassController.text) {
                          loginController.createPassword(
                              loginController.emailController.text,
                              loginController.passController.text,
                              loginController.confirmPassController.text);
                          loginController.isCreatepass.value = false;
                        } else {
                          Get.snackbar('Error', "Required same password",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: redColor);
                          loginController.loadingButtonController.reset();
                        }

                        Timer(
                            Duration(
                                seconds:
                                    loginController.passController.text.isEmpty
                                        ? 0
                                        : 15), () {
                          loginController.loadingButtonController.reset();
                        });
                      },
                      child: const DelayedDisplay(
                        slidingBeginOffset: Offset(0, -0.4),
                        delay: Duration(milliseconds: 300),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Stack(
                            children: [
                              Center(
                                  child: Text(
                                'Create Password',
                                style: buttonTitleLight,
                              )),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello, \nWelcome Back",
                      style: titleDark,
                    ),
                    //Logo Image

                    DelayedDisplay(
                      slidingBeginOffset: const Offset(0, -0.4),
                      delay: const Duration(milliseconds: 300),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Image.asset(
                            "assets/images/Loginimage.png",
                            height: 250,
                          ),
                          SizedBox(height: size.width * 0.05),
                          loginController.isCheckEmail.value == false &&
                                  loginController.isEmail.value == true
                              ? AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: passwordScreen())
                              : loginController.isCheckEmail.value == true &&
                                      loginController.isEmail.value == false
                                  ? registerScreen()
                                  : loginController.isCheckEmail.value ==
                                              false &&
                                          loginController.isEmail.value ==
                                              false &&
                                          loginController.isCreatepass.value ==
                                              true
                                      ? createPassScreen()
                                      : loginScreen()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
