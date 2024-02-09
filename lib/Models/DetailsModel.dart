// To parse this JSON data, do
//
//     final detailsModel = detailsModelFromJson(jsonString);

import 'dart:convert';

DetailsModel detailsModelFromJson(String str) => DetailsModel.fromJson(json.decode(str));

String detailsModelToJson(DetailsModel data) => json.encode(data.toJson());

class DetailsModel {
  int status;
  String message;
  CaServices caServices;

  DetailsModel({
    required this.status,
    required this.message,
    required this.caServices,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
    status: json["status"],
    message: json["message"],
    caServices: CaServices.fromJson(json["ca_services"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "ca_services": caServices.toJson(),
  };
}

class CaServices {
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
  String image;
  int isVideo;
  String video;
  dynamic renewalFrequency;
  String termsCondition;
  int status;
  int categorieId;
  int featured;
  String badges;
  DateTime createdAt;
  DateTime updatedAt;
  Category category;
  List<Doc> docs;

  CaServices({
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
    required this.category,
    required this.docs,
  });

  factory CaServices.fromJson(Map<String, dynamic> json) => CaServices(
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
    category: Category.fromJson(json["category"]),
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
    "category": category.toJson(),
    "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String name;
  String slug;
  String description;
  String image;
  dynamic bannerType;
  dynamic media;
  int status;
  dynamic parent;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.image,
    required this.bannerType,
    required this.media,
    required this.status,
    required this.parent,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    image: json["image"],
    bannerType: json["banner_type"],
    media: json["media"],
    status: json["status"],
    parent: json["parent"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "description": description,
    "image": image,
    "banner_type": bannerType,
    "media": media,
    "status": status,
    "parent": parent,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Doc {
  int id;
  int serviceCustomizationId;
  String documentType;
  String name;
  int isMultiple;
  DateTime? createdAt;
  DateTime? updatedAt;

  Doc({
    required this.id,
    required this.serviceCustomizationId,
    required this.documentType,
    required this.name,
    required this.isMultiple,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["id"],
    serviceCustomizationId: json["service_customization_id"],
    documentType: json["document_type"],
    name: json["name"],
    isMultiple: json["is_multiple"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_customization_id": serviceCustomizationId,
    "document_type": documentType,
    "name": name,
    "is_multiple": isMultiple,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
