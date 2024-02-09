// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  int status;
  String message;
  List<CaService> caServices;

  SearchModel({
    required this.status,
    required this.message,
    required this.caServices,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    status: json["status"],
    message: json["message"],
    caServices: List<CaService>.from(json["ca_services"].map((x) => CaService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "ca_services": List<dynamic>.from(caServices.map((x) => x.toJson())),
  };
}

class CaService {
  int id;
  int cAServiceId;
  OrgId orgId;
  String name;
  String slug;
  String? description;
  int marketPrice;
  int purchasePrice;
  int price;
  int gst;
  dynamic discount;
  dynamic discountType;
  TaxType taxType;
  ServiceType serviceType;
  String? image;
  int isVideo;
  String? video;
  RenewalFrequency? renewalFrequency;
  String? termsCondition;
  int status;
  int categorieId;
  int featured;
  Badges badges;
  DateTime createdAt;
  DateTime updatedAt;
  List<Doc> docs;
  Category category;

  CaService({
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
    required this.category,
  });

  factory CaService.fromJson(Map<String, dynamic> json) => CaService(
    id: json["id"],
    cAServiceId: json["c_a__service_id"],
    orgId: orgIdValues.map[json["org_id"]]!,
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    marketPrice: json["market_price"],
    purchasePrice: json["purchase_price"],
    price: json["price"],
    gst: json["gst"],
    discount: json["discount"],
    discountType: json["discount_type"],
    taxType: taxTypeValues.map[json["tax_type"]]!,
    serviceType: serviceTypeValues.map[json["service_type"]]!,
    image: json["image"],
    isVideo: json["is_video"],
    video: json["video"],
    renewalFrequency: renewalFrequencyValues.map[json["renewal_frequency"]]!,
    termsCondition: json["terms_condition"],
    status: json["status"],
    categorieId: json["categorie_id"],
    featured: json["featured"],
    badges: badgesValues.map[json["badges"]]!,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "c_a__service_id": cAServiceId,
    "org_id": orgIdValues.reverse[orgId],
    "name": name,
    "slug": slug,
    "description": description,
    "market_price": marketPrice,
    "purchase_price": purchasePrice,
    "price": price,
    "gst": gst,
    "discount": discount,
    "discount_type": discountType,
    "tax_type": taxTypeValues.reverse[taxType],
    "service_type": serviceTypeValues.reverse[serviceType],
    "image": image,
    "is_video": isVideo,
    "video": video,
    "renewal_frequency": renewalFrequencyValues.reverse[renewalFrequency],
    "terms_condition": termsCondition,
    "status": status,
    "categorie_id": categorieId,
    "featured": featured,
    "badges": badgesValues.reverse[badges],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
    "category": category.toJson(),
  };
}

enum Badges {
  LOGO,
  NONE,
  OFFER
}

final badgesValues = EnumValues({
  "logo": Badges.LOGO,
  "none": Badges.NONE,
  "offer": Badges.OFFER
});

class Category {
  int id;
  Name name;
  Slug? slug;
  Description description;
  String image;
  BannerType? bannerType;
  String? media;
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
    name: nameValues.map[json["name"]]!,
    slug: slugValues.map[json["slug"]]!,
    description: descriptionValues.map[json["description"]]!,
    image: json["image"],
    bannerType: bannerTypeValues.map[json["banner_type"]]!,
    media: json["media"],
    status: json["status"],
    parent: json["parent"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "slug": slugValues.reverse[slug],
    "description": descriptionValues.reverse[description],
    "image": image,
    "banner_type": bannerTypeValues.reverse[bannerType],
    "media": media,
    "status": status,
    "parent": parent,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum BannerType {
  URL,
  VIDEO
}

final bannerTypeValues = EnumValues({
  "url": BannerType.URL,
  "video": BannerType.VIDEO
});

enum Description {
  ACCOUNTING_SERVICES,
  ALL_GST_AND_TAX_SERVICES,
  AUDIT_SERVICE,
  COMPANY_CONVERT_SERVICES,
  CO_FORMATION_SERVICES,
  DSC_SERVICES,
  E_WAY,
  FSSAI,
  TEST
}

final descriptionValues = EnumValues({
  "Accounting services": Description.ACCOUNTING_SERVICES,
  "All Gst and tax services": Description.ALL_GST_AND_TAX_SERVICES,
  "Audit Service": Description.AUDIT_SERVICE,
  "company convert services": Description.COMPANY_CONVERT_SERVICES,
  "Co Formation Services": Description.CO_FORMATION_SERVICES,
  "DSC Services": Description.DSC_SERVICES,
  "E-way": Description.E_WAY,
  "FSSAI": Description.FSSAI,
  "test": Description.TEST
});

enum Name {
  COMPANY_CONVERT,
  COMPLIANCE,
  GOODS_SERVICES,
  IMPORT_EXPORT,
  INCOME_TAX,
  LEGAL_DOCUMENTATION,
  LOAN,
  STARTUP,
  TRADEMARK
}

final nameValues = EnumValues({
  "Company Convert": Name.COMPANY_CONVERT,
  "Compliance": Name.COMPLIANCE,
  "Goods & Services": Name.GOODS_SERVICES,
  "Import & Export": Name.IMPORT_EXPORT,
  "Income Tax": Name.INCOME_TAX,
  "Legal Documentation": Name.LEGAL_DOCUMENTATION,
  "Loan": Name.LOAN,
  "Startup": Name.STARTUP,
  "Trademark": Name.TRADEMARK
});

enum Slug {
  COMPLIANCE,
  GOODS_SERVICES,
  IMPORT_EXPORT,
  INCOME_TAX,
  LEGAL_DOCUMENTATION,
  LOAN,
  STARTUP,
  TRADEMARK
}

final slugValues = EnumValues({
  "compliance": Slug.COMPLIANCE,
  "goods-services": Slug.GOODS_SERVICES,
  "import-export": Slug.IMPORT_EXPORT,
  "income-tax": Slug.INCOME_TAX,
  "legal-documentation": Slug.LEGAL_DOCUMENTATION,
  "loan": Slug.LOAN,
  "startup": Slug.STARTUP,
  "trademark": Slug.TRADEMARK
});

class Doc {
  int id;
  int cAServiceId;
  DocumentType documentType;
  String name;
  int isMultiple;
  int multipleQty;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Doc({
    required this.id,
    required this.cAServiceId,
    required this.documentType,
    required this.name,
    required this.isMultiple,
    required this.multipleQty,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["id"],
    cAServiceId: json["c_a__service_id"],
    documentType: documentTypeValues.map[json["document_type"]]!,
    name: json["name"],
    isMultiple: json["is_multiple"],
    multipleQty: json["multiple_qty"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "c_a__service_id": cAServiceId,
    "document_type": documentTypeValues.reverse[documentType],
    "name": name,
    "is_multiple": isMultiple,
    "multiple_qty": multipleQty,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

enum DocumentType {
  EXCEL,
  IMAGE,
  PDF,
  WORD
}

final documentTypeValues = EnumValues({
  "excel": DocumentType.EXCEL,
  "image": DocumentType.IMAGE,
  "pdf": DocumentType.PDF,
  "word": DocumentType.WORD
});

enum OrgId {
  BR01_KFAQ
}

final orgIdValues = EnumValues({
  "BR01KFAQ": OrgId.BR01_KFAQ
});

enum RenewalFrequency {
  YEARLY
}

final renewalFrequencyValues = EnumValues({
  "yearly": RenewalFrequency.YEARLY
});

enum ServiceType {
  NEW_COMPANY,
  PERSONAL
}

final serviceTypeValues = EnumValues({
  "new-company": ServiceType.NEW_COMPANY,
  "personal": ServiceType.PERSONAL
});

enum TaxType {
  EXCLUSIVE,
  INCLUSIVE,
  SELECT
}

final taxTypeValues = EnumValues({
  "exclusive": TaxType.EXCLUSIVE,
  "inclusive": TaxType.INCLUSIVE,
  "select": TaxType.SELECT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
