// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  int status;
  String message;
  List<Order> orders;

  OrderModel({
    required this.status,
    required this.message,
    required this.orders,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    status: json["status"],
    message: json["message"],
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order {
  int id;
  String orgId;
  int userId;
  String userType;
  String orderId;
  String orderStatus;
  List<dynamic> documents;
  String documentStatus;
  int amount;
  dynamic discount;
  dynamic discountType;
  String paymentStatus;
  dynamic paymentSessionId;
  String paymentMethod;
  dynamic txnId;
  int isTransfer;
  dynamic transferFrom;
  dynamic transferFromOrgId;
  String transferTo;
  String transferToOrgId;
  dynamic acceptedBy;
  dynamic remark;
  dynamic issueDate;
  dynamic customerCompanyId;
  dynamic renewalFrequency;
  dynamic couponId;
  dynamic couponCode;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic connectedCompany;
  Detail detail;
  List<dynamic> finalDoc;

  Order({
    required this.id,
    required this.orgId,
    required this.userId,
    required this.userType,
    required this.orderId,
    required this.orderStatus,
    required this.documents,
    required this.documentStatus,
    required this.amount,
    required this.discount,
    required this.discountType,
    required this.paymentStatus,
    required this.paymentSessionId,
    required this.paymentMethod,
    required this.txnId,
    required this.isTransfer,
    required this.transferFrom,
    required this.transferFromOrgId,
    required this.transferTo,
    required this.transferToOrgId,
    required this.acceptedBy,
    required this.remark,
    required this.issueDate,
    required this.customerCompanyId,
    required this.renewalFrequency,
    required this.couponId,
    required this.couponCode,
    required this.createdAt,
    required this.updatedAt,
    required this.connectedCompany,
    required this.detail,
    required this.finalDoc,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    orgId: json["org_id"],
    userId: json["user_id"],
    userType: json["user_type"],
    orderId: json["order_id"],
    orderStatus: json["order_status"],
    documents: List<dynamic>.from(json["documents"].map((x) => x)),
    documentStatus: json["document_status"],
    amount: json["amount"],
    discount: json["discount"],
    discountType: json["discount_type"],
    paymentStatus: json["payment_status"],
    paymentSessionId: json["payment_session_id"],
    paymentMethod: json["payment_method"],
    txnId: json["txn_id"],
    isTransfer: json["is_transfer"],
    transferFrom: json["transfer_from"],
    transferFromOrgId: json["transfer_from_org_id"],
    transferTo: json["transfer_to"],
    transferToOrgId: json["transfer_to_org_id"],
    acceptedBy: json["accepted_by"],
    remark: json["remark"],
    issueDate: json["issue_date"],
    customerCompanyId: json["customer_company_id"],
    renewalFrequency: json["renewal_frequency"],
    couponId: json["coupon_id"],
    couponCode: json["coupon_code"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    connectedCompany: json["connected_company"],
    detail: Detail.fromJson(json["detail"]),
    finalDoc: List<dynamic>.from(json["final_doc"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "org_id": orgId,
    "user_id": userId,
    "user_type": userType,
    "order_id": orderId,
    "order_status": orderStatus,
    "documents": List<dynamic>.from(documents.map((x) => x)),
    "document_status": documentStatus,
    "amount": amount,
    "discount": discount,
    "discount_type": discountType,
    "payment_status": paymentStatus,
    "payment_session_id": paymentSessionId,
    "payment_method": paymentMethod,
    "txn_id": txnId,
    "is_transfer": isTransfer,
    "transfer_from": transferFrom,
    "transfer_from_org_id": transferFromOrgId,
    "transfer_to": transferTo,
    "transfer_to_org_id": transferToOrgId,
    "accepted_by": acceptedBy,
    "remark": remark,
    "issue_date": issueDate,
    "customer_company_id": customerCompanyId,
    "renewal_frequency": renewalFrequency,
    "coupon_id": couponId,
    "coupon_code": couponCode,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "connected_company": connectedCompany,
    "detail": detail.toJson(),
    "final_doc": List<dynamic>.from(finalDoc.map((x) => x)),
  };
}

class Detail {
  int id;
  int ordersId;
  int cAServiceId;
  int customerId;
  DateTime createdAt;
  DateTime updatedAt;
  Service service;
  Customer customer;

  Detail({
    required this.id,
    required this.ordersId,
    required this.cAServiceId,
    required this.customerId,
    required this.createdAt,
    required this.updatedAt,
    required this.service,
    required this.customer,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    ordersId: json["orders_id"],
    cAServiceId: json["c_a__service_id"],
    customerId: json["customer_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    service: Service.fromJson(json["service"]),
    customer: Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orders_id": ordersId,
    "c_a__service_id": cAServiceId,
    "customer_id": customerId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "service": service.toJson(),
    "customer": customer.toJson(),
  };
}

class Customer {
  int id;
  String customerId;
  String name;
  String trade;
  String email;
  int emailVerified;
  String password;
  String permanentAddress;
  String tempAddress;
  String mobileNo;
  String pan;
  String aadhar;
  String panImage;
  String aadharImage;
  String gstin;
  String dinNo;
  String postalNo;
  String city;
  String state;
  String image;
  int status;
  String orgId;
  dynamic addedBy;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Customer({
    required this.id,
    required this.customerId,
    required this.name,
    required this.trade,
    required this.email,
    required this.emailVerified,
    required this.password,
    required this.permanentAddress,
    required this.tempAddress,
    required this.mobileNo,
    required this.pan,
    required this.aadhar,
    required this.panImage,
    required this.aadharImage,
    required this.gstin,
    required this.dinNo,
    required this.postalNo,
    required this.city,
    required this.state,
    required this.image,
    required this.status,
    required this.orgId,
    required this.addedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    customerId: json["customer_id"],
    name: json["name"],
    trade: json["trade"],
    email: json["email"],
    emailVerified: json["email_verified"],
    password: json["password"],
    permanentAddress: json["permanent_address"],
    tempAddress: json["temp_address"],
    mobileNo: json["mobile_no"],
    pan: json["pan"],
    aadhar: json["aadhar"],
    panImage: json["pan_image"],
    aadharImage: json["aadhar_image"],
    gstin: json["gstin"],
    dinNo: json["din_no"],
    postalNo: json["postal_no"],
    city: json["city"],
    state: json["state"],
    image: json["image"],
    status: json["status"],
    orgId: json["org_id"],
    addedBy: json["added_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "name": name,
    "trade": trade,
    "email": email,
    "email_verified": emailVerified,
    "password": password,
    "permanent_address": permanentAddress,
    "temp_address": tempAddress,
    "mobile_no": mobileNo,
    "pan": pan,
    "aadhar": aadhar,
    "pan_image": panImage,
    "aadhar_image": aadharImage,
    "gstin": gstin,
    "din_no": dinNo,
    "postal_no": postalNo,
    "city": city,
    "state": state,
    "image": image,
    "status": status,
    "org_id": orgId,
    "added_by": addedBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

class Service {
  int id;
  int cAServiceId;
  String orgId;
  String name;
  String slug;
  dynamic description;
  int marketPrice;
  int purchasePrice;
  int price;
  int gst;
  dynamic discount;
  dynamic discountType;
  String taxType;
  String serviceType;
  dynamic image;
  int isVideo;
  dynamic video;
  dynamic renewalFrequency;
  dynamic termsCondition;
  int status;
  int categorieId;
  int featured;
  String badges;
  DateTime createdAt;
  DateTime updatedAt;
  List<Doc> docs;

  Service({
    required this.id,
    required this.cAServiceId,
    required this.orgId,
    required this.name,
    required this.slug,
    required this.description,
    required this.marketPrice,
    required this.purchasePrice,
    required this.price,
    required this.gst,
    required this.discount,
    required this.discountType,
    required this.taxType,
    required this.serviceType,
    required this.image,
    required this.isVideo,
    required this.video,
    required this.renewalFrequency,
    required this.termsCondition,
    required this.status,
    required this.categorieId,
    required this.featured,
    required this.badges,
    required this.createdAt,
    required this.updatedAt,
    required this.docs,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    cAServiceId: json["c_a__service_id"],
    orgId: json["org_id"],
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    marketPrice: json["market_price"],
    purchasePrice: json["purchase_price"],
    price: json["price"],
    gst: json["gst"],
    discount: json["discount"],
    discountType: json["discount_type"],
    taxType: json["tax_type"],
    serviceType: json["service_type"],
    image: json["image"],
    isVideo: json["is_video"],
    video: json["video"],
    renewalFrequency: json["renewal_frequency"],
    termsCondition: json["terms_condition"],
    status: json["status"],
    categorieId: json["categorie_id"],
    featured: json["featured"],
    badges: json["badges"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "c_a__service_id": cAServiceId,
    "org_id": orgId,
    "name": name,
    "slug": slug,
    "description": description,
    "market_price": marketPrice,
    "purchase_price": purchasePrice,
    "price": price,
    "gst": gst,
    "discount": discount,
    "discount_type": discountType,
    "tax_type": taxType,
    "service_type": serviceType,
    "image": image,
    "is_video": isVideo,
    "video": video,
    "renewal_frequency": renewalFrequency,
    "terms_condition": termsCondition,
    "status": status,
    "categorie_id": categorieId,
    "featured": featured,
    "badges": badges,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
  };
}

class Doc {
  int id;
  int serviceCustomizationId;
  String documentType;
  String name;
  int isMultiple;
  String? createdAt;
  String? updatedAt;

  Doc({
    required this.id,
    required this.serviceCustomizationId,
    required this.documentType,
    required this.name,
    required this.isMultiple,
    this.createdAt,
    this.updatedAt,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["id"],
    serviceCustomizationId: json["service_customization_id"],
    documentType: json["document_type"],
    name: json["name"],
    isMultiple: json["is_multiple"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_customization_id": serviceCustomizationId,
    "document_type": documentType,
    "name": name,
    "is_multiple": isMultiple,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
