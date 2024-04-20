class SearchServiceModel {
  int? status;
  String? message;
  List<CaServices>? caServices;

  SearchServiceModel({this.status, this.message, this.caServices});

  SearchServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['ca_services'] != null) {
      caServices = <CaServices>[];
      json['ca_services'].forEach((v) {
        caServices!.add(new CaServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.caServices != null) {
      data['ca_services'] = this.caServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CaServices {
  int? id;
  int? cAServiceId;
  String? orgId;
  String? name;
  String? slug;
  String? description;
  int? marketPrice;
  int? purchasePrice;
  int? price;
  int? gst;
  Null? discount;
  Null? discountType;
  String? taxType;
  String? serviceType;
  String? image;
  int? isVideo;
  String? video;
  String? renewalFrequency;
  String? termsCondition;
  int? status;
  int? categorieId;
  int? featured;
  String? badges;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<Docs>? docs;
  Category? category;

  CaServices(
      {this.id,
        this.cAServiceId,
        this.orgId,
        this.name,
        this.slug,
        this.description,
        this.marketPrice,
        this.purchasePrice,
        this.price,
        this.gst,
        this.discount,
        this.discountType,
        this.taxType,
        this.serviceType,
        this.image,
        this.isVideo,
        this.video,
        this.renewalFrequency,
        this.termsCondition,
        this.status,
        this.categorieId,
        this.featured,
        this.badges,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.docs,
        this.category});

  CaServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cAServiceId = json['c_a__service_id'];
    orgId = json['org_id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    marketPrice = json['market_price'];
    purchasePrice = json['purchase_price'];
    price = json['price'];
    gst = json['gst'];
    discount = json['discount'];
    discountType = json['discount_type'];
    taxType = json['tax_type'];
    serviceType = json['service_type'];
    image = json['image'];
    isVideo = json['is_video'];
    video = json['video'];
    renewalFrequency = json['renewal_frequency'];
    termsCondition = json['terms_condition'];
    status = json['status'];
    categorieId = json['categorie_id'];
    featured = json['featured'];
    badges = json['badges'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['docs'] != null) {
      docs = <Docs>[];
      json['docs'].forEach((v) {
        docs!.add(new Docs.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['c_a__service_id'] = this.cAServiceId;
    data['org_id'] = this.orgId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['market_price'] = this.marketPrice;
    data['purchase_price'] = this.purchasePrice;
    data['price'] = this.price;
    data['gst'] = this.gst;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['tax_type'] = this.taxType;
    data['service_type'] = this.serviceType;
    data['image'] = this.image;
    data['is_video'] = this.isVideo;
    data['video'] = this.video;
    data['renewal_frequency'] = this.renewalFrequency;
    data['terms_condition'] = this.termsCondition;
    data['status'] = this.status;
    data['categorie_id'] = this.categorieId;
    data['featured'] = this.featured;
    data['badges'] = this.badges;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.docs != null) {
      data['docs'] = this.docs!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Docs {
  int? id;
  int? cAServiceId;
  String? documentType;
  String? name;
  int? isMultiple;
  int? multipleQty;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Docs(
      {this.id,
        this.cAServiceId,
        this.documentType,
        this.name,
        this.isMultiple,
        this.multipleQty,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Docs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cAServiceId = json['c_a__service_id'];
    documentType = json['document_type'];
    name = json['name'];
    isMultiple = json['is_multiple'];
    multipleQty = json['multiple_qty'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['c_a__service_id'] = this.cAServiceId;
    data['document_type'] = this.documentType;
    data['name'] = this.name;
    data['is_multiple'] = this.isMultiple;
    data['multiple_qty'] = this.multipleQty;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? image;
  String? bannerType;
  String? media;
  int? status;
  Null? parent;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.name,
        this.slug,
        this.description,
        this.image,
        this.bannerType,
        this.media,
        this.status,
        this.parent,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    bannerType = json['banner_type'];
    media = json['media'];
    status = json['status'];
    parent = json['parent'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image'] = this.image;
    data['banner_type'] = this.bannerType;
    data['media'] = this.media;
    data['status'] = this.status;
    data['parent'] = this.parent;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
