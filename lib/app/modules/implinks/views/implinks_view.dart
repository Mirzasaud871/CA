import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vakil99/app/modules/implinks/modal/implinks_model.dart';

import '../../../../constants.dart';
import '../controllers/implinks_controller.dart';

class ImplinksView extends GetView<ImplinksController> {
  ImplinksView({Key? key}) : super(key: key);
  ImplinksController implinksController = Get.put(ImplinksController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white,)),
          backgroundColor: primaryColor,
          title: const Text('Imp Links', style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),
                itemCount: implinksController.myLinksList.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.70,
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
                          child: InkWell(
                            onTap: () async{
                              // Get.to("${implinksController.myLinksList[index].route}");
                              String url = implinksController.myLinksList[index].route;
                              if (await canLaunch(url)) {
                              await launch(url, forceWebView: true, enableJavaScript: true);
                              } else {
                              throw 'Could not launch $url';
                              }},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Image.asset("${implinksController.myLinksList[index].image}"),
                                Spacer(),
                                Text(
                                  "${implinksController.myLinksList[index].name}",
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
