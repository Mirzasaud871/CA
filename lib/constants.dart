// ignore_for_file: non_constant_identifier_names
import 'dart:math';

import 'package:flutter/material.dart';

//Blue Color
const Color primaryColor = Colors.blue;
//Yellow Color
const Color secondaryColor = Colors.blue;
//Red Color
const Color redColor = Color(0xFFDB4437);
//Green Color
const Color greenColor = Color(0xFF0F9D58);
const isUserLogin = 'is_user_login';
const userData = 'user_data';
const userToken = 'user_token';
const user_Id = 'user_id';
const userImage = 'user_image';
const userEmail = 'user_email';
const userName = 'user_name';
const userMobile = 'user_mobile';

const TextStyle appBarTitle = TextStyle(
  color: Colors.white,
  fontSize: 23,
  letterSpacing: 1,
  fontWeight: FontWeight.bold,
);

//Title Style
const TextStyle titleDark = TextStyle(
  color: Colors.black,
  fontSize: 20,
  letterSpacing: 0.7,
  fontWeight: FontWeight.bold,
);

const TextStyle titleLight = TextStyle(
  color: Colors.white,
  fontSize: 20,
  letterSpacing: 0.5,
  fontWeight: FontWeight.bold,
);

//SubTitle
const TextStyle subTitle = TextStyle(
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

const TextStyle subTitleDark = TextStyle(
  fontSize: 12,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
);

const TextStyle subTitleLight = TextStyle(
  fontSize: 13,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
);

//Headline
const TextStyle headlineDark = TextStyle(
  color: Colors.black,
  fontSize: 17,
  letterSpacing: 0.5,
  fontWeight: FontWeight.w600,
);

const TextStyle headlineLight = TextStyle(
  color: Colors.white,
  fontSize: 17,
  letterSpacing: 0.5,
  fontWeight: FontWeight.w600,
);

//Headline1
const TextStyle headlineDark1 = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: 1
);

const TextStyle headlineLight1 = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: 1
);

//Button Title
const TextStyle buttonTitleDark = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black
);
const TextStyle buttonTitleLight = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white
);


const TextStyle buttonsubTitleDark = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5
);

 const addDomain = "zynomatrix";
 const baseURL = "https://apis.rizrv.in/api/";
 const loginURL = 'customer/web/$addDomain/auth';
 const loginCheckURL = 'company/front/customer/check/$addDomain';
 const categoryURL = 'company/web/$addDomain/all/category';
 const featuredCategoryURL = 'company/front/featured/service/$addDomain';
 const detailsURL = 'company/web/service/show/$addDomain/';
 const searchURL = 'company/web/$addDomain?name=';
 const estimateURL = 'company/web/service/show/$addDomain/';
 const registrationURL = 'company/front/customer/$addDomain';
 const changePasswordURL = 'customer/web/$addDomain/password/create';
 const profileURL = "customer/web/$addDomain/profile";
 const updateProfileURL = "customer/web/$addDomain/profile/update";
 const documentURL = "customer/web/$addDomain/documents";
 const myOrderURL = "customer/web/$addDomain/orders";
 const familyMembersURL = "customer/web/$addDomain/family/members";
 const familyStoresURL = "customer/web/$addDomain/family/member/store";
 const companyURL = "customer/company/data/$addDomain";
 const companyViewURL = "customer/company/data/$addDomain/single/";
 const placeOrderURL = "company/front/customer/place-order/$addDomain";
 const applyCouponURL = "customer/company/data/$addDomain/coupon/show";
 const addDocumentURL = "customer/web/$addDomain/documents/upload";
 const addCompanyURL = "customer/company/data/$addDomain/store";
 const addDirectorsURL = "customer/company/data/$addDomain/director/add";
 const ledgerURL = "customer/web/$addDomain/ledger";



