class CategoriesModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? image;
  String? bannerType;
  String? media;
  int? status;
  int? parent;
  String? createdAt;
  String? updatedAt;
  int? companyServiceCount;
  List<CategoriesModel>? childs;
  List<CompanyService>? companyService;

  CategoriesModel(
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
        this.updatedAt,
        this.companyServiceCount,
        this.childs,
        this.companyService});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
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
    companyServiceCount = json['company_service_count'];
    if (json['childs'] != null) {
      childs = <CategoriesModel>[];
      json['childs'].forEach((v) {
        childs!.add(new CategoriesModel.fromJson(v!));
      });
    }
    if (json['company_service'] != null) {
      companyService = <CompanyService>[];
      json['company_service'].forEach((v) {
        companyService!.add(new CompanyService.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['image'] = image;
    data['banner_type'] = bannerType;
    data['media'] = media;
    data['status'] = status;
    data['parent'] = parent;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['company_service_count'] = companyServiceCount;
    if (childs != null) {
      data['childs'] = childs!.map((v) => v.toJson()).toList();
    }
    if (companyService != null) {
      data['company_service'] =
          companyService!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyService {
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

  CompanyService(
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
        this.updatedAt});

  CompanyService.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['c_a__service_id'] = cAServiceId;
    data['org_id'] = orgId;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['market_price'] = marketPrice;
    data['purchase_price'] = purchasePrice;
    data['price'] = price;
    data['gst'] = gst;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['tax_type'] = taxType;
    data['service_type'] = serviceType;
    data['image'] = image;
    data['is_video'] = isVideo;
    data['video'] = video;
    data['renewal_frequency'] = renewalFrequency;
    data['terms_condition'] = termsCondition;
    data['status'] = status;
    data['categorie_id'] = categorieId;
    data['featured'] = featured;
    data['badges'] = badges;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CompanyData {
  int? id;
  String? email;
  String? orgId;
  String? subdomain;

  CompanyData({this.id, this.email, this.orgId, this.subdomain});

  CompanyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    orgId = json['org_id'];
    subdomain = json['subdomain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['org_id'] = orgId;
    data['subdomain'] = subdomain;
    return data;
  }
}