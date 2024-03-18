import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../modal/implinks_model.dart';

class ImplinksController extends GetxController {
  //TODO: Implement ImplinksController

  final count = 0.obs;
  final Uri firstUrl = Uri.parse('https://flutter.dev');

  List<impLinksList> myLinksList = [
    impLinksList(image: "assets/images/implink/gst.jpeg", name: "Good & Services Tax", route: "https://www.gst.gov.in/" ),
    impLinksList(image: "assets/images/implink/tds.png", name: "Tax Deducted at Source", route: "https://incometaxindia.gov.in/Pages/Deposit_TDS_TCS.aspx"),
    impLinksList(image: "assets/images/implink/eway.jpeg", name: "EWAY Bill", route: "https://ewaybillgst.gov.in/"),
    impLinksList(image: "assets/images/implink/nsdl.png", name: "Tax Information Network (NSDL)", route: "https://nsdl.co.in/"),
    impLinksList(image: "assets/images/implink/it.png", name: "Income Tax", route: "https://www.incometax.gov.in/iec/foportal/"),
    impLinksList(image: "assets/images/implink/central-board.jpeg", name: "Central Board of Indirect Tax & Customs", route: "https://www.cbic.gov.in/"),
    impLinksList(image: "assets/images/implink/directorate.png", name: "Directorate General of Foreign Trade", route: "https://www.dgft.gov.in/CP/"),
    impLinksList(image: "assets/images/implink/mca.png", name: "Ministry of Corporate Affairs", route: "https://www.mca.gov.in/content/mca/global/en/home.html"),
    impLinksList(image: "assets/images/implink/epfo.png", name: "Employees Provident Fund Organization , India", route: "https://www.epfindia.gov.in/site_en/index.php"),
    impLinksList(image: "assets/images/implink/esic.png", name: "Employees State Insurance Scheme", route: "https://www.esic.gov.in/"),
    impLinksList(image: "assets/images/implink/chartered.jpeg", name: "The Institute of Chartered Accountants of India", route: "https://www.icai.org/"),
    impLinksList(image: "assets/images/implink/icsi.png", name: "The Institute of Company Secretaries of India", route: "https://www.icsi.edu/home/"),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
