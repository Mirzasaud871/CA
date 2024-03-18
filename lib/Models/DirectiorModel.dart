// To parse this JSON data, do
//
//     final directorModel = directorModelFromJson(jsonString);

import 'dart:convert';

DirectorModel directorModelFromJson(String str) => DirectorModel.fromJson(json.decode(str));

String directorModelToJson(DirectorModel data) => json.encode(data.toJson());

class DirectorModel {
  int status;
  String message;
  Company company;

  DirectorModel({
    required this.status,
    required this.message,
    required this.company,
  });

  factory DirectorModel.fromJson(Map<String, dynamic> json) => DirectorModel(
    status: json["status"],
    message: json["message"],
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "company": company.toJson(),
  };
}

class Company {
  int id;
  int customerId;
  String cin;
  dynamic companyType;
  String registrationNo;
  String companyName;
  String roc;
  String category;
  String subcategory;
  String companyClass;
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
  List<Detail> details;

  Company({
    required this.id,
    required this.customerId,
    required this.cin,
    required this.companyType,
    required this.registrationNo,
    required this.companyName,
    required this.roc,
    required this.category,
    required this.subcategory,
    required this.companyClass,
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

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    customerId: json["customer_id"],
    cin: json["CIN"],
    companyType: json["company_type"],
    registrationNo: json["registration_no"],
    companyName: json["company_name"],
    roc: json["roc"],
    category: json["category"],
    subcategory: json["subcategory"],
    companyClass: json["class"],
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
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
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
    "class": companyClass,
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
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  int id;
  int customerCompanyDataId;
  String image;
  String dinNo;
  String name;
  String designation;
  DateTime appointDate;
  DateTime issueDate;
  DateTime expiryDate;
  DateTime createdAt;
  DateTime updatedAt;

  Detail({
    required this.id,
    required this.customerCompanyDataId,
    required this.image,
    required this.dinNo,
    required this.name,
    required this.designation,
    required this.appointDate,
    required this.issueDate,
    required this.expiryDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    customerCompanyDataId: json["customer_company_data_id"],
    image: json["image"],
    dinNo: json["din_no"],
    name: json["name"],
    designation: json["designation"],
    appointDate: DateTime.parse(json["appoint_date"]),
    issueDate: DateTime.parse(json["issue_date"]),
    expiryDate: DateTime.parse(json["expiry_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_company_data_id": customerCompanyDataId,
    "image": image,
    "din_no": dinNo,
    "name": name,
    "designation": designation,
    "appoint_date": "${appointDate.year.toString().padLeft(4, '0')}-${appointDate.month.toString().padLeft(2, '0')}-${appointDate.day.toString().padLeft(2, '0')}",
    "issue_date": "${issueDate.year.toString().padLeft(4, '0')}-${issueDate.month.toString().padLeft(2, '0')}-${issueDate.day.toString().padLeft(2, '0')}",
    "expiry_date": "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
