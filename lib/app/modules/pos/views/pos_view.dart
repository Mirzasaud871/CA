import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../controllers/pos_controller.dart';

class PosView extends GetView<PosController> {
  PosView({Key? key}) : super(key: key);
  PosController posController = Get.put(PosController());

  @override
  Widget build(BuildContext context) {
    var webPos = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async{
            if (request.url.startsWith('whatsapp://send/')) {
              posController.launchWhatsApp(request.url);
              WebViewController().reload();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("${posController.url}"));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: WebViewWidget(controller: webPos),
      ),
    );
  }
}
