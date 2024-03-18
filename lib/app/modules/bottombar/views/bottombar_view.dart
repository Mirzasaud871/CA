import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vakil99/app/modules/home/controllers/home_controller.dart';
import 'package:vakil99/app/modules/profile/views/profile_view.dart';
import 'package:vakil99/constants.dart';
import '../../home/views/home_view.dart';
import '../controllers/bottombar_controller.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

class BottombarView extends GetView<BottombarController> {
  BottombarView({Key? key}) : super(key: key);
  BottombarController bottombarController = Get.put(BottombarController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: homeController.categories.isEmpty
            ? shimmerEffect()
            : SafeArea(
          child: PageView(
            controller: bottombarController.pageController,
            children: <Widget>[
              HomeView(),
              HomeView(),
              ProfileView(),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: RollingBottomBar(
          controller: bottombarController.pageController,
          items: const [
            RollingBottomBarItem(Icons.design_services, label: 'Services'),
            RollingBottomBarItem(Icons.home, label: 'Home'),
            RollingBottomBarItem(Icons.person, label: 'Profile'),
          ],
          color: primaryColor,
          itemColor: Colors.white,
          activeItemColor: Colors.white,
          enableIconRotation: true,
          onTap: (index) {
            bottombarController.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 700),
              curve: Curves.decelerate,
            );
          },
        ),
      );
    });
  }

  Widget shimmerEffect() {
    return Container(
        color: Colors.grey,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 30,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 30,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              //Search bar
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )),

              SizedBox(height: 15,),
              //Top Services
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 6,
              ),
              //Category data slider
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // physics: ScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ]),
                ),
              ),

              // Offer services
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )),
              //Slidebar
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: [
                  "assets/images/Rectangl.png",
                  "assets/images/Rectangl.png",
                  "assets/images/Rectangl.png",
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Image.asset(i));
                    },
                  );
                }).toList(),
              ),
              //Our Services
              const SizedBox(
                height: 8,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )),

              //Gridview
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 140,
                        width: 120,
                        color: Colors.grey,
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 140,
                        width: 120,
                        color: Colors.grey,
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 140,
                        width: 120,
                        color: Colors.grey,
                      ),
                    ],
                  )),

            ],
          ),
        ));
  }
}
