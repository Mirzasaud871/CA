import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakil99/app/modules/profile/views/profile_view.dart';
import 'package:vakil99/app/modules/register/views/register_view.dart';
import 'package:vakil99/app/modules/userprofile/views/userprofile_view.dart';
import 'package:vakil99/constants.dart';
import '../../home/views/home_view.dart';
import '../controllers/bottombar_controller.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

class BottombarView extends GetView<BottombarController> {
  BottombarView({Key? key}) : super(key: key);
  BottombarController bottombarController = Get.put(BottombarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: bottombarController.pageController,
          children: <Widget>[
            HomeView(),
            ProfileView(),
            ProfileView(),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        controller: bottombarController.pageController,
        items: const [
          RollingBottomBarItem(Icons.home, label: 'Home'),
          RollingBottomBarItem(Icons.support_agent, label: 'Chat'),
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
  }
}
