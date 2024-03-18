// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';

CompanyModel companyModelFromJson(String str) => CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  int status;
  String message;
  List<Datum> data;

  CompanyModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  int customerId;
  String cin;
  dynamic companyType;
  String registrationNo;
  String companyName;
  String roc;
  String category;
  String subcategory;
  String datumClass;
  String status;
  String authorized;
  String paidup;
  String email;
  String phone;
  String address;
  String city;
  String state;
  String country;
  String postalNo;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> details;

  Datum({
    required this.id,
    required this.customerId,
    required this.cin,
    required this.companyType,
    required this.registrationNo,
    required this.companyName,
    required this.roc,
    required this.category,
    required this.subcategory,
    required this.datumClass,
    required this.status,
    required this.authorized,
    required this.paidup,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.postalNo,
    required this.createdAt,
    required this.updatedAt,
    required this.details,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    customerId: json["customer_id"],
    cin: json["CIN"],
    companyType: json["company_type"],
    registrationNo: json["registration_no"],
    companyName: json["company_name"],
    roc: json["roc"],
    category: json["category"],
    subcategory: json["subcategory"],
    datumClass: json["class"],
    status: json["status"],
    authorized: json["authorized"],
    paidup: json["paidup"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    postalNo: json["postal_no"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    details: List<dynamic>.from(json["details"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "CIN": cin,
    "company_type": companyType,
    "registration_no": registrationNo,
    "company_name": companyName,
    "roc": roc,
    "category": category,
    "subcategory": subcategory,
    "class": datumClass,
    "status": status,
    "authorized": authorized,
    "paidup": paidup,
    "email": email,
    "phone": phone,
    "address": address,
    "city": city,
    "state": state,
    "country": country,
    "postal_no": postalNo,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "details": List<dynamic>.from(details.map((x) => x)),
  };
}
