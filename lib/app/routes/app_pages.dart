import 'package:get/get.dart';

import '../modules/addcompany/bindings/addcompany_binding.dart';
import '../modules/addcompany/views/addcompany_view.dart';
import '../modules/addfamilymember/bindings/addfamilymember_binding.dart';
import '../modules/addfamilymember/views/addfamilymember_view.dart';
import '../modules/bottombar/bindings/bottombar_binding.dart';
import '../modules/bottombar/views/bottombar_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/companydetails/bindings/companydetails_binding.dart';
import '../modules/companydetails/views/companydetails_view.dart';
import '../modules/companymanagment/bindings/companymanagment_binding.dart';
import '../modules/companymanagment/views/companymanagment_view.dart';
import '../modules/companyupdate/bindings/companyupdate_binding.dart';
import '../modules/companyupdate/views/companyupdate_view.dart';
import '../modules/createpassword/bindings/createpassword_binding.dart';
import '../modules/createpassword/views/createpassword_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/details/bindings/details_binding.dart';
import '../modules/details/views/details_view.dart';
import '../modules/document/bindings/document_binding.dart';
import '../modules/document/views/document_view.dart';
import '../modules/familymember/bindings/familymember_binding.dart';
import '../modules/familymember/views/familymember_view.dart';
import '../modules/goodservices/bindings/goodservices_binding.dart';
import '../modules/goodservices/views/goodservices_view.dart';
import '../modules/gstproprietorship/bindings/gstproprietorship_binding.dart';
import '../modules/gstproprietorship/views/gstproprietorship_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/loginpage/bindings/loginpage_binding.dart';
import '../modules/loginpage/views/loginpage_view.dart';
import '../modules/myorder/bindings/myorder_binding.dart';
import '../modules/myorder/views/myorder_view.dart';
import '../modules/myorder_document/bindings/myorder_document_binding.dart';
import '../modules/myorder_document/views/myorder_document_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/serviceview/bindings/serviceview_binding.dart';
import '../modules/serviceview/views/serviceview_view.dart';
import '../modules/startup/bindings/startup_binding.dart';
import '../modules/startup/views/startup_view.dart';
import '../modules/userprofile/bindings/userprofile_binding.dart';
import '../modules/userprofile/views/userprofile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGINPAGE,
      page: () => LoginpageView(),
      binding: LoginpageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMBAR,
      page: () => BottombarView(),
      binding: BottombarBinding(),
    ),
    GetPage(
      name: _Paths.GSTPROPRIETORSHIP,
      page: () => GstproprietorshipView(),
      binding: GstproprietorshipBinding(),
    ),
    GetPage(
      name: _Paths.STARTUP,
      page: () => StartupView(null),
      binding: StartupBinding(),
    ),
    GetPage(
      name: _Paths.GOODSERVICES,
      page: () => GoodservicesView(),
      binding: GoodservicesBinding(),
    ),
    GetPage(
      name: _Paths.SERVICEVIEW,
      page: () => const ServiceviewView(),
      binding: ServiceviewBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.USERPROFILE,
      page: () => UserprofileView(),
      binding: UserprofileBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.DOCUMENT,
      page: () => DocumentView(),
      binding: DocumentBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.FAMILYMEMBER,
      page: () => FamilymemberView(),
      binding: FamilymemberBinding(),
    ),
    GetPage(
      name: _Paths.ADDCOMPANY,
      page: () => AddcompanyView(),
      binding: AddcompanyBinding(),
    ),
    GetPage(
      name: _Paths.COMPANYMANAGMENT,
      page: () => CompanymanagmentView(),
      binding: CompanymanagmentBinding(),
    ),
    GetPage(
      name: _Paths.ADDFAMILYMEMBER,
      page: () => AddfamilymemberView(),
      binding: AddfamilymemberBinding(),
    ),
    GetPage(
      name: _Paths.MYORDER,
      page: () => MyorderView(),
      binding: MyorderBinding(),
    ),
    GetPage(
      name: _Paths.COMPANYDETAILS,
      page: () => CompanydetailsView(),
      binding: CompanydetailsBinding(),
    ),
    GetPage(
      name: _Paths.COMPANYUPDATE,
      page: () => CompanyupdateView(),
      binding: CompanyupdateBinding(),
    ),
    GetPage(
      name: _Paths.MYORDER_DOCUMENT,
      page: () =>  MyorderDocumentView(),
      binding: MyorderDocumentBinding(),
    ),
    GetPage(
      name: _Paths.CREATEPASSWORD,
      page: () => CreatepasswordView(),
      binding: CreatepasswordBinding(),
    ),
  ];
}
