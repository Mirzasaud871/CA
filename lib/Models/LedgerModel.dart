// To parse this JSON data, do
//
//     final ledgerModel = ledgerModelFromJson(jsonString);

import 'dart:convert';

LedgerModel ledgerModelFromJson(String str) => LedgerModel.fromJson(json.decode(str));

String ledgerModelToJson(LedgerModel data) => json.encode(data.toJson());

class LedgerModel {
  int status;
  String message;
  Ledger ledger;

  LedgerModel({
    required this.status,
    required this.message,
    required this.ledger,
  });

  factory LedgerModel.fromJson(Map<String, dynamic> json) => LedgerModel(
    status: json["status"],
    message: json["message"],
    ledger: Ledger.fromJson(json["ledger"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "ledger": ledger.toJson(),
  };
}

class Ledger {
  int ledgerAmountDue;
  int totalOrders;
  LastPaymentData lastPaymentData;
  int totalAmountPaid;
  List<LastPaymentData> ledger;

  Ledger({
    required this.ledgerAmountDue,
    required this.totalOrders,
    required this.lastPaymentData,
    required this.totalAmountPaid,
    required this.ledger,
  });

  factory Ledger.fromJson(Map<String, dynamic> json) => Ledger(
    ledgerAmountDue: json["ledger_amount_due"],
    totalOrders: json["total_orders"],
    lastPaymentData: LastPaymentData.fromJson(json["last_payment_data"]),
    totalAmountPaid: json["total_amount_paid"],
    ledger: List<LastPaymentData>.from(json["ledger"].map((x) => LastPaymentData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ledger_amount_due": ledgerAmountDue,
    "total_orders": totalOrders,
    "last_payment_data": lastPaymentData.toJson(),
    "total_amount_paid": totalAmountPaid,
    "ledger": List<dynamic>.from(ledger.map((x) => x.toJson())),
  };
}

class LastPaymentData {
  int id;
  int customerId;
  String orgId;
  String orgType;
  int orderId;
  int amount;
  int paid;
  int due;
  dynamic advance;
  DateTime createdAt;
  DateTime updatedAt;
  List<History> history;
  Order? order;

  LastPaymentData({
    required this.id,
    required this.customerId,
    required this.orgId,
    required this.orgType,
    required this.orderId,
    required this.amount,
    required this.paid,
    required this.due,
    required this.advance,
    required this.createdAt,
    required this.updatedAt,
    required this.history,
    this.order,
  });

  factory LastPaymentData.fromJson(Map<String, dynamic> json) => LastPaymentData(
    id: json["id"],
    customerId: json["customer_id"],
    orgId: json["org_id"],
    orgType: json["org_type"],
    orderId: json["order_id"],
    amount: json["amount"],
    paid: json["paid"],
    due: json["due"],
    advance: json["advance"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    history: List<History>.from(json["history"].map((x) => History.fromJson(x))),
    order: json["order"] == null ? null : Order.fromJson(json["order"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "org_id": orgId,
    "org_type": orgType,
    "order_id": orderId,
    "amount": amount,
    "paid": paid,
    "due": due,
    "advance": advance,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "history": List<dynamic>.from(history.map((x) => x.toJson())),
    "order": order?.toJson(),
  };
}

class History {
  int id;
  int khataId;
  int paidAmount;
  String paymentMode;
  dynamic txnId;
  dynamic paymentStatus;
  DateTime createdAt;
  DateTime updatedAt;

  History({
    required this.id,
    required this.khataId,
    required this.paidAmount,
    required this.paymentMode,
    required this.txnId,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    id: json["id"],
    khataId: json["khata_id"],
    paidAmount: json["paid_amount"],
    paymentMode: json["payment_mode"],
    txnId: json["txn_id"],
    paymentStatus: json["payment_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "khata_id": khataId,
    "paid_amount": paidAmount,
    "payment_mode": paymentMode,
    "txn_id": txnId,
    "payment_status": paymentStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Order {
  int id;
  String orgId;
  int userId;
  String userType;
  String orderId;
  String orderStatus;
  dynamic documents;
  String documentStatus;
  int amount;
  int discount;
  String? discountType;
  String paymentStatus;
  String paymentSessionId;
  String paymentMethod;
  dynamic txnId;
  int isTransfer;
  dynamic transferFrom;
  dynamic transferFromOrgId;
  String transferTo;
  String transferToOrgId;
  int? acceptedBy;
  dynamic remark;
  dynamic issueDate;
  dynamic expiry;
  dynamic customerCompanyId;
  dynamic renewalFrequency;
  int couponId;
  String? couponCode;
  DateTime createdAt;
  DateTime updatedAt;
  Detail detail;

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
    required this.expiry,
    required this.customerCompanyId,
    required this.renewalFrequency,
    required this.couponId,
    required this.couponCode,
    required this.createdAt,
    required this.updatedAt,
    required this.detail,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    orgId: json["org_id"],
    userId: json["user_id"],
    userType: json["user_type"],
    orderId: json["order_id"],
    orderStatus: json["order_status"],
    documents: json["documents"],
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
    expiry: json["expiry"],
    customerCompanyId: json["customer_company_id"],
    renewalFrequency: json["renewal_frequency"],
    couponId: json["coupon_id"],
    couponCode: json["coupon_code"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    detail: Detail.fromJson(json["detail"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "org_id": orgId,
    "user_id": userId,
    "user_type": userType,
    "order_id": orderId,
    "order_status": orderStatus,
    "documents": documents,
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
    "expiry": expiry,
    "customer_company_id": customerCompanyId,
    "renewal_frequency": renewalFrequency,
    "coupon_id": couponId,
    "coupon_code": couponCode,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "detail": detail.toJson(),
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

  Detail({
    required this.id,
    required this.ordersId,
    required this.cAServiceId,
    required this.customerId,
    required this.createdAt,
    required this.updatedAt,
    required this.service,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    ordersId: json["orders_id"],
    cAServiceId: json["c_a__service_id"],
    customerId: json["customer_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    service: Service.fromJson(json["service"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orders_id": ordersId,
    "c_a__service_id": cAServiceId,
    "customer_id": customerId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "service": service.toJson(),
  };
}

class Service {
  int id;
  int cAServiceId;
  String orgId;
  String name;
  String slug;
  String description;
  int marketPrice;
  int purchasePrice;
  int price;
  int gst;
  dynamic discount;
  dynamic discountType;
  String taxType;
  String serviceType;
  String? image;
  int isVideo;
  String? video;
  dynamic renewalFrequency;
  String? termsCondition;
  int status;
  int categorieId;
  int featured;
  String badges;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

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
    required this.deletedAt,
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
    deletedAt: json["deleted_at"],
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
    "deleted_at": deletedAt,
  };
}
