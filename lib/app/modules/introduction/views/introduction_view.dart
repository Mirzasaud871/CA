import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vakil99/app/modules/loginpage/views/loginpage_view.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  IntroductionView({Key? key}) : super(key: key);
  IntroductionController introductionController =
      Get.put(IntroductionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              PageView(
                controller: introductionController.pageController,
                onPageChanged: (index) {
                  introductionController.onLastpage.value = (index == 1);
                },
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Lottie.asset(
                            "assets/images/firstAnimated.json",
                            height: 300,
                          ),
                        ),
                        const Text(
                          "The types of GST in India are CGST, SGST, and IGST.",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Lottie.asset(
                            "assets/images/intro/Secondimage.json",
                            height: 350,
                          ),
                        ),
                        const Text(
                          "Register yourself as a trusted business of this country",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Lottie.asset(
                            "assets/images/intro/screendone.json",
                            height: 350,
                          ),
                        ),
                        const Text(
                          "In the case of inter-state transactions, GST is collected as IGST,",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Obx(() {
                return Container(
                    alignment: const Alignment(0, 0.85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              introductionController.pageController
                                  .jumpToPage(2);
                            },
                            child: const Text(
                              "Skip",
                            )),
                        SmoothPageIndicator(
                          controller: introductionController.pageController,
                          count: introductionController.count.value,
                          axisDirection: Axis.horizontal,
                          effect: const SlideEffect(
                              spacing: 10.0,
                              radius: 8.0,
                              paintStyle: PaintingStyle.fill,
                              strokeWidth: 2.2,
                              dotColor: Colors.grey,
                              activeDotColor: Colors.green),
                        ),
                        introductionController.onLastpage.value
                            ? TextButton(
                                onPressed: () {
                                  introductionController.pageController
                                      .nextPage(
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                },
                                child: const Text("Next"))
                            : TextButton(
                                onPressed: () {
                                  introductionController.pageController
                                      .nextPage(
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                  Get.to(LoginpageView());
                                },
                                child: const Text("Start")),
                      ],
                    ));
              })
            ],
          ),
        ),
      ),
    );
  }
}
