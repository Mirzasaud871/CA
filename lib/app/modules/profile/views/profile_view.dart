import 'package:carousel_slider/carousel_slider.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakil99/app/modules/change_password/views/change_password_view.dart';
import 'package:vakil99/app/modules/companymanagment/views/companymanagment_view.dart';
import 'package:vakil99/app/modules/document/views/document_view.dart';
import 'package:vakil99/app/modules/userprofile/views/userprofile_view.dart';
import 'package:vakil99/constants.dart';
import '../../familymember/views/familymember_view.dart';
import '../../myorder/views/myorder_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Image.asset("assets/images/pngw.png",
                          height: 60, width: 60, fit: BoxFit.cover),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome ',
                          style: TextStyle(fontSize: width * 0.04, color: primaryColor),
                        ),
                        Text(
                          'UserName',
                          style: TextStyle(
                              fontSize: width * 0.06, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(Icons.settings,size: width * 0.10,)
                    // SizedBox(
                    //   height: 50,
                    //     child: Center(child: Lottie.asset('assets/images/settting.json'))),
                  ],
                ),
              ),

              const SizedBox(height: 15,),
              DelayedDisplay(
                slidingBeginOffset: const Offset(0, -0.4),
                delay: const Duration(milliseconds: 300),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: width * 0.41,
                  ),
                  items: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Due in 3 days',
                                style: TextStyle(color: Colors.grey,fontSize: width * 0.03),
                              ),
                              Text(
                                'August',
                                style: TextStyle(color: Colors.grey,fontSize: width * 0.03),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee_outlined,
                                color: Colors.green.shade400,
                                size: width * 0.08,
                              ),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text(
                                '931.20',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.07,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Container(
                            height: width * 0.13,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.amberAccent.shade100),
                            child: Center(
                                child: Text(
                              "pay now",
                              style: TextStyle(
                                  fontSize: width * 0.055, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Members',
                                style: TextStyle(color: Colors.grey,fontSize: width * 0.03),
                              ),
                              Text(
                                'August',
                                style: TextStyle(color: Colors.grey,fontSize: width * 0.03),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.people_outlined,
                                color: Colors.purple.shade400,
                                size: width * 0.08,
                              ),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text(
                                '62',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.07,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Container(
                            height: width * 0.13,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.amberAccent.shade100),
                            child: Center(
                                child: Text(
                              "See Members",
                              style: TextStyle(
                                  fontSize: width * 0.055, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Order',
                                style: TextStyle(color: Colors.grey,fontSize: width * 0.03),
                              ),
                              Text(
                                'August',
                                style: TextStyle(color: Colors.grey,fontSize: width * 0.03),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.red.shade400,
                                size: width * 0.08,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '130',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.07,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Container(
                            height: width * 0.13,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.amberAccent.shade100),
                            child: Center(
                                child: Text(
                              "See Orders",
                              style: TextStyle(
                                  fontSize: width * 0.055, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ' My Services',
                                style: TextStyle(color: Colors.grey,fontSize: width * 0.03),
                              ),
                              Text(
                                'August',
                                style: TextStyle(color: Colors.grey,fontSize: width * 0.03),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.recommend,
                                color: Colors.cyan.shade400,
                                size: width * 0.08,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                '70',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.07,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Container(
                            height: width * 0.13,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.amberAccent.shade100),
                            child: Center(
                                child: Text(
                              "Services",
                              style: TextStyle(
                                  fontSize: width * 0.055, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0)),
                            child: SizedBox(
                              child: (i),
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DelayedDisplay(
                  delay: const Duration(milliseconds: 300),
                  child: Column(
                    children: [
                      SizedBox(
                        height: width * 0.03,
                      ),
                       InkWell(
                         onTap: (){
                           Get.to( () => UserprofileView());
                         },
                         child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.person, size: width * 0.06, color: primaryColor),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "User Profile",
                                style: TextStyle(fontSize: width * 0.048,fontWeight: FontWeight.bold,letterSpacing: 0.5),
                              ),
                              const Spacer(),
                              Image.asset("assets/images/arr.gif",height:40)
                            ],
                          ),
                      ),
                       ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(const FamilymemberView());
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.family_restroom,
                                  size:  width * 0.06, color: primaryColor),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Family Members",
                                style: TextStyle(fontSize:  width * 0.048,fontWeight: FontWeight.bold,letterSpacing: 0.5),                              ),
                              const Spacer(),
                              Image.asset("assets/images/arr.gif",height:30)
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(const CompanymanagmentView());
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.line_axis, size:  width * 0.06, color: primaryColor),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Company Managment",
                                style: TextStyle(fontSize:  width * 0.048,fontWeight: FontWeight.bold,letterSpacing: 0.5),                              ),
                              const Spacer(),
                              Image.asset("assets/images/arr.gif",height:30)
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(DocumentView());
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.file_copy, size:  width * 0.06, color: primaryColor),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Document",
                                style: TextStyle(fontSize:  width * 0.048,fontWeight: FontWeight.bold,letterSpacing: 0.5),                              ),
                              const Spacer(),
                              Image.asset("assets/images/arr.gif",height:30)
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),

                      InkWell(
                        onTap: (){
                          Get.to(ChangePasswordView());
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.key, size:  width * 0.06, color: primaryColor),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Change Password",
                                style: TextStyle(fontSize:  width * 0.048,fontWeight: FontWeight.bold,letterSpacing: 0.5),                              ),
                              const Spacer(),
                              Image.asset("assets/images/arr.gif",height:30)
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(MyorderView());
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.local_shipping_rounded,
                                  size:  width * 0.05, color: primaryColor),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "My Order",
                                style: TextStyle(fontSize:  width * 0.048,fontWeight: FontWeight.bold,letterSpacing: 0.5),                              ),
                              const Spacer(),
                              Image.asset("assets/images/arr.gif",height:30)
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.red, size:  width * 0.05),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: (){
                                profileController.logOut();
                              },
                              child: Text(
                                "Logout",
                                style: TextStyle(fontSize: width * 0.048,fontWeight: FontWeight.bold,letterSpacing: 0.5),                            ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Messages',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 0.5),),
                    Text('See all',style: TextStyle(fontSize: 16,color: primaryColor,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
