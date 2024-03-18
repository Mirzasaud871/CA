class DocumentModel {
  int? status;
  String? mesage;
  List<Documents>? documents;

  DocumentModel({this.status, this.mesage, this.documents});

  DocumentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mesage = json['mesage'];
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(new Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['mesage'] = this.mesage;
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  int? id;
  int? customerId;
  String? orgId;
  String? documentFor;
  String? name;
  String? documentType;
  String? document;
  String? createdAt;
  String? updatedAt;

  Documents(
      {this.id,
        this.customerId,
        this.orgId,
        this.documentFor,
        this.name,
        this.documentType,
        this.document,
        this.createdAt,
        this.updatedAt});

  Documents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    orgId = json['org_id'];
    documentFor = json['document_for'];
    name = json['name'];
    documentType = json['document_type'];
    document = json['document'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['org_id'] = this.orgId;
    data['document_for'] = this.documentFor;
    data['name'] = this.name;
    data['document_type'] = this.documentType;
    data['document'] = this.document;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
