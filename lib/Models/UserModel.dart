class UserModel {
  int? id;
  String? customerId;
  String? name;
  String? trade;
  String? email;
  int? emailVerified;
  String? password;
  String? permanentAddress;
  String? tempAddress;
  String? mobileNo;
  String? pan;
  String? aadhar;
  String? panImage;
  String? aadharImage;
  String? gstin;
  String? dinNo;
  String? postalNo;
  String? city;
  String? state;
  String? image;
  int? status;
  String? orgId;
  String? addedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? token;

  UserModel(
      {this.id,
        this.customerId,
        this.name,
        this.trade,
        this.email,
        this.emailVerified,
        this.password,
        this.permanentAddress,
        this.tempAddress,
        this.mobileNo,
        this.pan,
        this.aadhar,
        this.panImage,
        this.aadharImage,
        this.gstin,
        this.dinNo,
        this.postalNo,
        this.city,
        this.state,
        this.image,
        this.status,
        this.orgId,
        this.addedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    name = json['name'];
    trade = json['trade'];
    email = json['email'];
    emailVerified = json['email_verified'];
    password = json['password'];
    permanentAddress = json['permanent_address'];
    tempAddress = json['temp_address'];
    mobileNo = json['mobile_no'];
    pan = json['pan'];
    aadhar = json['aadhar'];
    panImage = json['pan_image'];
    aadharImage = json['aadhar_image'];
    gstin = json['gstin'];
    dinNo = json['din_no'];
    postalNo = json['postal_no'];
    city = json['city'];
    state = json['state'];
    image = json['image'];
    status = json['status'];
    orgId = json['org_id'];
    addedBy = json['added_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['customer_id'] = customerId;
    data['name'] = name;
    data['trade'] = trade;
    data['email'] = email;
    data['email_verified'] = emailVerified;
    data['password'] = password;
    data['permanent_address'] = permanentAddress;
    data['temp_address'] = tempAddress;
    data['mobile_no'] = mobileNo;
    data['pan'] = pan;
    data['aadhar'] = aadhar;
    data['pan_image'] = panImage;
    data['aadhar_image'] = aadharImage;
    data['gstin'] = gstin;
    data['din_no'] = dinNo;
    data['postal_no'] = postalNo;
    data['city'] = city;
    data['state'] = state;
    data['image'] = image;
    data['status'] = status;
    data['org_id'] = orgId;
    data['added_by'] = addedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['token'] = token;
    return data;
  }
}