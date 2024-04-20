import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vakil99/app/modules/pos/views/pos_view.dart';
import 'package:vakil99/app/modules/profile/views/profile_view.dart';
import 'package:vakil99/app/modules/startup/views/startup_view.dart';
import 'package:vakil99/constants.dart';
import '../../details/views/details_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return
      Obx(() {
        return homeController.categories.isEmpty
            ? shimmerEffect()
            : Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              homeController.getInfo();
            },
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 160,
                        color: Colors.white,
                        child: CustomPaint(painter: _MyPainter()),
                      ),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 100,
                        child: InkWell(
                          onTap: () {
                            Get.to(ProfileView());
                          },
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.symmetric(horizontal: 10),

                            // margin: const EdgeInsets.all(16.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  child: const CircleAvatar(
                                      backgroundImage:
                                      AssetImage("assets/images/pngw.png"),
                                      radius: 30),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Obx(() {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(PosView());
                                        },
                                        child: Text(
                                          'Welcome ',
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.04,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        '${homeController.username.value}',
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.06,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  );
                                }),
                                const Spacer(),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(ProfileView());
                                      },
                                      child: Container(
                                          height: 38,
                                          width: 38,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(100),
                                              color: Colors.white,
                                              boxShadow: const [BoxShadow(
                                                color: Colors.black45,
                                                blurRadius: 6.0,
                                              ),
                                              ]
                                          ),
                                          child: const Center(child: Icon(
                                              Icons.edit_document))),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(PosView());
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(100),
                                              color: Colors.white,
                                              boxShadow: const [BoxShadow(
                                                color: Colors.black45,
                                                blurRadius: 6.0,
                                              ),
                                              ]
                                          ),
                                          child: Image.asset(
                                            "assets/images/Posimage.png",
                                            height: 38,)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            transform: Matrix4.translationValues(
                                0.0, 80.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(26))),
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: <Widget>[
                                    TextField(
                                        controller: homeController
                                            .searchController,
                                        onChanged: homeController
                                            .filterSearchResults,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: "Search for legal services",
                                            contentPadding: const EdgeInsets
                                                .only(left: 26.0,
                                                bottom: 8.0,
                                                right: 50.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: primaryColor,
                                                  width: 1),
                                              borderRadius: BorderRadius
                                                  .circular(26),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade400,
                                                  width: 1),
                                              borderRadius: BorderRadius
                                                  .circular(26),
                                            ))),
                                    GestureDetector(
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 16.0),
                                        child: Icon(
                                            Icons.search, color: primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 70,),
                          Obx(() {
                            return Container(
                              margin: const EdgeInsets.all(0.0),
                              padding: const EdgeInsets.all(6.0),
                              height: homeController.searchController.text
                                  .isEmpty ? 0 : 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors
                                        .grey
                                        .shade400,
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: homeController
                                    .filteredData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: InkWell(
                                      onTap: () {
                                        Get.to(() => DetailsView(), arguments:
                                        homeController.filteredData[index]
                                            .slug);
                                        homeController.searchController.clear();
                                      },
                                      child: Text(
                                          "${homeController
                                              .filteredData[index]
                                              .name}"),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
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
                                      // TextButton(
                                      //   onPressed: () {
                                      //     Get.bottomSheet(
                                      //         Container(
                                      //             height: 500,
                                      //             decoration: BoxDecoration(
                                      //                 borderRadius: const BorderRadius
                                      //                     .only(
                                      //                     topLeft:
                                      //                     Radius.circular(25.0),
                                      //                     topRight:
                                      //                     Radius.circular(25.0)),
                                      //                 color: Colors.white70,
                                      //                 border: Border.all(
                                      //                     color: Colors.grey.shade300,
                                      //                     width: 2)),
                                      //             child: SingleChildScrollView(
                                      //               child: Padding(
                                      //                 padding:
                                      //                 const EdgeInsets.all(15.0),
                                      //                 child: Column(
                                      //                   children: [
                                      //                     const Center(
                                      //                         child: Text(
                                      //                           "Top Services",
                                      //                           style: TextStyle(
                                      //                               fontSize: 22,
                                      //                               fontWeight:
                                      //                               FontWeight.bold,
                                      //                               color: primaryColor),
                                      //                         )),
                                      //                     const Divider(
                                      //                       color: Colors.grey,
                                      //                     ),
                                      //                     Padding(
                                      //                         padding:
                                      //                         const EdgeInsets
                                      //                             .only(top: 8.0),
                                      //                         child: Obx(() {
                                      //                           return SizedBox(
                                      //                             child: GridView
                                      //                                 .builder(
                                      //                               shrinkWrap: true,
                                      //                               physics:
                                      //                               const NeverScrollableScrollPhysics(),
                                      //                               itemCount:
                                      //                               homeController
                                      //                                   .categories
                                      //                                   .length,
                                      //                               gridDelegate:
                                      //                               const SliverGridDelegateWithFixedCrossAxisCount(
                                      //                                 crossAxisCount:
                                      //                                 3,
                                      //                                 crossAxisSpacing:
                                      //                                 2.0,
                                      //                                 mainAxisSpacing:
                                      //                                 2.0,
                                      //                                 childAspectRatio:
                                      //                                 0.8,
                                      //                               ),
                                      //                               itemBuilder:
                                      //                                   (BuildContext
                                      //                               context,
                                      //                                   int index) {
                                      //                                 return Column(
                                      //                                     children: [
                                      //                                       InkWell(
                                      //                                         onTap:
                                      //                                             () {
                                      //                                           Get
                                      //                                               .to(
                                      //                                             StartupView(
                                      //                                                 homeController
                                      //                                                     .categories[index]
                                      //                                                     .companyService),
                                      //                                           );
                                      //                                         },
                                      //                                         child:
                                      //                                         Container(
                                      //                                           margin:
                                      //                                           const EdgeInsets
                                      //                                               .symmetric(
                                      //                                             horizontal:
                                      //                                             8.0,
                                      //                                           ),
                                      //                                           height:
                                      //                                           Get
                                      //                                               .width *
                                      //                                               0.22,
                                      //                                           width:
                                      //                                           Get
                                      //                                               .width *
                                      //                                               0.22,
                                      //                                           decoration: BoxDecoration(
                                      //                                               color: Colors
                                      //                                                   .white,
                                      //                                               borderRadius: BorderRadius
                                      //                                                   .circular(
                                      //                                                   100.0),
                                      //                                               border: Border
                                      //                                                   .all(
                                      //                                                   color: Colors
                                      //                                                       .grey),
                                      //                                               boxShadow: [
                                      //                                                 BoxShadow(
                                      //                                                   color: Colors
                                      //                                                       .grey
                                      //                                                       .shade400,
                                      //                                                   blurRadius: 6.0,
                                      //                                                 ),
                                      //                                               ],
                                      //                                               image: DecorationImage(
                                      //                                                 image: NetworkImage(
                                      //                                                     "${homeController
                                      //                                                         .categories[index]
                                      //                                                         .image}"),
                                      //                                               )),
                                      //                                         ),
                                      //                                       ),
                                      //                                       DelayedDisplay(
                                      //                                         delay: const Duration(
                                      //                                             milliseconds:
                                      //                                             300),
                                      //                                         child:
                                      //                                         Padding(
                                      //                                           padding: const EdgeInsets
                                      //                                               .symmetric(
                                      //                                               vertical: 5.0,
                                      //                                               horizontal: 6.0),
                                      //                                           child:
                                      //                                           Text(
                                      //                                             "${homeController
                                      //                                                 .categories[index]
                                      //                                                 .name}",
                                      //                                             style:
                                      //                                             const TextStyle(
                                      //                                               fontSize: 12,
                                      //                                             ),
                                      //                                             textAlign:
                                      //                                             TextAlign
                                      //                                                 .center,
                                      //                                           ),
                                      //                                         ),
                                      //                                       )
                                      //                                     ]);
                                      //                               },
                                      //                             ),
                                      //                           );
                                      //                         })),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //             )),
                                      //         barrierColor: Colors.transparent,
                                      //         isDismissible: true,
                                      //         backgroundColor: Colors.white);
                                      //   },
                                      //   child: const Text(
                                      //     "View All",
                                      //     style: TextStyle(
                                      //         fontSize: 12,
                                      //         color: primaryColor,
                                      //         fontWeight: FontWeight.bold),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),

                                // TextButton(onPressed: (){Get.to(PosView());}, child: Text("POS")),
                                //Category data slider
                                SizedBox(
                                    height: 160,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      // physics: ScrollPhysics(),
                                      child: Obx(() {
                                        return Row(
                                            children: List.generate(
                                              homeController.categories.length,
                                                  (index) =>
                                                  Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.to(() =>
                                                                StartupView(
                                                                    homeController
                                                                        .categories[index]
                                                                        .companyService));
                                                          },
                                                          child: Container(
                                                            margin: const EdgeInsets
                                                                .only(
                                                                left: 8.0),
                                                            height: 90,
                                                            width: 90,
                                                            decoration: BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    spreadRadius: 2,
                                                                    blurRadius: 7,
                                                                    offset: const Offset(
                                                                        0,
                                                                        3), // changes position of shadow
                                                                  ),
                                                                ],
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    140),
                                                                image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  image: NetworkImage(
                                                                    "${homeController
                                                                        .categories[index]
                                                                        .image}",
                                                                  ),
                                                                )),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: DelayedDisplay(
                                                            delay:
                                                            const Duration(
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
                                                                  "${homeController
                                                                      .categories[index]
                                                                      .name}",
                                                                  textAlign: TextAlign
                                                                      .center,
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                  style: TextStyle(
                                                                    fontSize: screenWidth *
                                                                        0.036,
                                                                    fontWeight: FontWeight
                                                                        .bold,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
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
                                        margin: const EdgeInsets.all(4.0),
                                        color: Colors.white,
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount:
                                          homeController.featuredServices
                                              .length,
                                          gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 5.0,
                                            mainAxisSpacing: 5.0,
                                            childAspectRatio: 0.80,
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return DelayedDisplay(
                                              delay: const Duration(
                                                  milliseconds: 200),
                                              child: InkWell(
                                                onTap: () {
                                                  homeController.navigateToPage(
                                                      homeController
                                                          .featuredServices[index]
                                                          .featured
                                                          .toString(),
                                                      index);
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.all(
                                                      5.0),
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
                                                    padding: const EdgeInsets
                                                        .all(8.0),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets
                                                              .all(6.0),
                                                          decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                          child: homeController
                                                              .featuredServices[
                                                          index]
                                                              .image !=
                                                              null
                                                              ? Image.network(
                                                              "${homeController
                                                                  .featuredServices[index]
                                                                  .image}")
                                                              : Image.asset(
                                                              "assets/images/trademark/fram1.jpg"),
                                                        ),
                                                        Align(
                                                          alignment:
                                                          Alignment
                                                              .bottomCenter,
                                                          child: Container(
                                                            margin: const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 2.0,
                                                                vertical: 5.0),
                                                            padding: const EdgeInsets
                                                                .all(6.0),
                                                            height: 30,
                                                            decoration: BoxDecoration(
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .grey,
                                                                    blurRadius: 6.0,
                                                                  ),
                                                                ],
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    6.0)),
                                                            child: Center(
                                                              child: Text(
                                                                "${homeController
                                                                    .featuredServices[index]
                                                                    .name}",
                                                                style: TextStyle(
                                                                    overflow: TextOverflow
                                                                        .ellipsis,
                                                                    fontSize:
                                                                    screenWidth *
                                                                        0.025,
                                                                    letterSpacing: 0.6,
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
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      });
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = primaryColor;

    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {PointerDeviceKind.touch, PointerDeviceKind.mouse};
}

Widget shimmerEffect() {
  return SingleChildScrollView(
    child: Container(
        color: Colors.grey,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 20,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 20,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                  SizedBox(width: 10,),
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

              SizedBox(height: 10,),
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
                height: 5,
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
                height: 15,
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
        )),
  );
}