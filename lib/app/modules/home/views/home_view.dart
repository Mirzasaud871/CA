import 'package:carousel_slider/carousel_slider.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vakil99/app/modules/startup/views/startup_view.dart';
import 'package:vakil99/constants.dart';
import '../../userprofile/views/userprofile_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Container(
                    //     height: 300,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    Container(
                      height: 70,
                      margin: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: const CircleAvatar(
                                  backgroundImage: const AssetImage(
                                      "assets/images/pngw.png"),
                                  radius: 30),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 6,
                                ),
                                Obx(() {
                                  return Text(
                                    '${homeController.username.value}',
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.06,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  );
                                }),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.mail,
                                      color: Colors.white,
                                      size: screenWidth * 0.045,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Obx(() {
                                      return Text(
                                        '${homeController.useremail.value}',
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            color: Colors.white,
                                            letterSpacing: 0.5),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 100),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //Search bar
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: homeController.searchController,
                                decoration: InputDecoration(
                                    hintText: " Search for any legal services",
                                    hintStyle: TextStyle(fontSize: 14),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          homeController.getSearch();
                                        },
                                        icon: Icon(Icons.search)),
                                    suffixIconColor: Colors.black,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green))),
                              ),
                            ),

                            //Top Services
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/hammecourt.png",
                                    height: 20,
                                    color: primaryColor,
                                  ),
                                  const Text(
                                    "Top Services",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        // Get.to();
                                      },
                                      child: TextButton(
                                        onPressed: () {
                                          Get.bottomSheet(
                                              Container(
                                                  height: 500,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                              topLeft:
                                                                  Radius
                                                                      .circular(
                                                                          25.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      25.0)),
                                                      color: Colors.white70,
                                                      border:
                                                          Border.all(
                                                              color: Colors.grey
                                                                  .shade300,
                                                              width: 2)),
                                                  child: SingleChildScrollView(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      child: Column(
                                                        children: [
                                                          const Center(
                                                              child: Text(
                                                            "Top Services",
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    primaryColor),
                                                          )),
                                                          const Divider(
                                                            color: Colors.grey,
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 8.0),
                                                              child: Obx(() {
                                                                return SizedBox(
                                                                  child: GridView
                                                                      .builder(
                                                                    shrinkWrap:
                                                                        true,
                                                                    physics:
                                                                        const NeverScrollableScrollPhysics(),
                                                                    itemCount: homeController
                                                                        .categories
                                                                        .length,
                                                                    gridDelegate:
                                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                                      crossAxisCount:
                                                                          3,
                                                                      crossAxisSpacing:
                                                                          2.0,
                                                                      mainAxisSpacing:
                                                                          2.0,
                                                                      childAspectRatio:
                                                                          0.8,
                                                                    ),
                                                                    itemBuilder:
                                                                        (BuildContext
                                                                                context,
                                                                            int index) {
                                                                      return Column(
                                                                          children: [
                                                                            InkWell(
                                                                              onTap: () {
                                                                                Get.to(
                                                                                  StartupView(homeController.categories[index].companyService),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                margin: const EdgeInsets.symmetric(
                                                                                  horizontal: 8.0,
                                                                                ),
                                                                                height: Get.width * 0.22,
                                                                                width: Get.width * 0.22,
                                                                                decoration: BoxDecoration(
                                                                                    color: Colors.white,
                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                    border: Border.all(color: Colors.grey),
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        color: Colors.grey.shade400,
                                                                                        blurRadius: 6.0,
                                                                                      ),
                                                                                    ],
                                                                                    image: DecorationImage(
                                                                                      image: NetworkImage("${homeController.categories[index].image}"),
                                                                                    )),
                                                                              ),
                                                                            ),
                                                                            DelayedDisplay(
                                                                              delay: const Duration(milliseconds: 300),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0),
                                                                                child: Text(
                                                                                  "${homeController.categories[index].name}",
                                                                                  style: const TextStyle(
                                                                                    fontSize: 12,
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ]);
                                                                    },
                                                                  ),
                                                                );
                                                              })),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                              barrierColor: Colors.transparent,
                                              isDismissible: true,
                                              backgroundColor: Colors.white);
                                        },
                                        child: const Text(
                                          "View All",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                ],
                              ),
                            ),

                            //Category data slider
                            SizedBox(
                                height: 150,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  // physics: ScrollPhysics(),
                                  child: Obx(() {
                                    return Row(
                                        children: List.generate(
                                      homeController.categories.length,
                                      (index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(() => StartupView(
                                                      homeController
                                                          .categories[index]
                                                          .companyService));
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 3.0,
                                                  ),
                                                  height: Get.width * 0.25,
                                                  width: Get.width * 0.25,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${homeController.categories[index].image}"),
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: DelayedDisplay(
                                                delay: const Duration(
                                                    milliseconds: 300),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 3.0),
                                                  child: SizedBox(
                                                    height: 20,
                                                    width: 100,
                                                    child: Text(
                                                      "${homeController.categories[index].name}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize:
                                                            screenWidth * 0.036,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 0.4,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ));
                                  }),
                                )),

                            // Offer services
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/hammecourt.png",
                                    height: 20,
                                    color: primaryColor,
                                  ),
                                  const Text(
                                    "Offers Week",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            //Slidebar
                            DelayedDisplay(
                              slidingBeginOffset: const Offset(0, -0.4),
                              delay: const Duration(milliseconds: 300),
                              child: CarouselSlider(
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
                                              borderRadius:
                                                  BorderRadius.circular(4.0)),
                                          child: Image.asset(i));
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                            //Our Services
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/hammecourt.png",
                                    height: 20,
                                    color: primaryColor,
                                  ),
                                  const Text(
                                    "Our Services",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                            //Gridview
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Obx(() {
                                  return Container(
                                    margin: EdgeInsets.all(4.0),
                                    color: Colors.white,
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: homeController
                                          .featuredServices.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 5.0,
                                        mainAxisSpacing: 5.0,
                                        childAspectRatio: 0.80,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return DelayedDisplay(
                                          delay:
                                              const Duration(milliseconds: 200),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              margin: const EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 6.0,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(6.0),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: homeController
                                                                  .featuredServices[
                                                                      index]
                                                                  .image !=
                                                              null
                                                          ? Image.network(
                                                              "${homeController.featuredServices[index].image}")
                                                          : Image.asset(
                                                              "assets/images/trademark/fram1.jpg"),
                                                    ),
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 2.0,
                                                                vertical: 5.0),
                                                        padding:
                                                            EdgeInsets.all(6.0),
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color:
                                                                    Colors.grey,
                                                                blurRadius: 6.0,
                                                              ),
                                                            ],
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0)),
                                                        child: Center(
                                                          child: Text(
                                                            "${homeController.featuredServices[index].name}",
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.025,
                                                                letterSpacing:
                                                                    0.6,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                })),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
      );
  }

}
