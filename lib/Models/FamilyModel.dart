class FamilyMembersModel {
  int? status;
  String? message;
  List<Members>? members;

  FamilyMembersModel({this.status, this.message, this.members});

  FamilyMembersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
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
  Null? gstin;
  String? dinNo;
  Null? postalNo;
  Null? city;
  Null? state;
  String? image;
  int? status;
  String? orgId;
  int? addedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Members(
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
        this.deletedAt});

  Members.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['name'] = this.name;
    data['trade'] = this.trade;
    data['email'] = this.email;
    data['email_verified'] = this.emailVerified;
    data['password'] = this.password;
    data['permanent_address'] = this.permanentAddress;
    data['temp_address'] = this.tempAddress;
    data['mobile_no'] = this.mobileNo;
    data['pan'] = this.pan;
    data['aadhar'] = this.aadhar;
    data['pan_image'] = this.panImage;
    data['aadhar_image'] = this.aadharImage;
    data['gstin'] = this.gstin;
    data['din_no'] = this.dinNo;
    data['postal_no'] = this.postalNo;
    data['city'] = this.city;
    data['state'] = this.state;
    data['image'] = this.image;
    data['status'] = this.status;
    data['org_id'] = this.orgId;
    data['added_by'] = this.addedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
