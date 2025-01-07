class EditVariantApiResModel {
  bool? success;
  String? message;
  Data? data;

  EditVariantApiResModel({this.success, this.message, this.data});

  EditVariantApiResModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  VariantType? variantType;
  String? sId;
  String? user;
  String? product;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.variantType,
        this.sId,
        this.user,
        this.product,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    variantType = json['variantType'] != null
        ? new VariantType.fromJson(json['variantType'])
        : null;
    sId = json['_id'];
    user = json['user'];
    product = json['product'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.variantType != null) {
      data['variantType'] = this.variantType!.toJson();
    }
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['product'] = this.product;
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class VariantType {
  String? sId;
  String? title;

  VariantType({this.sId, this.title});

  VariantType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    return data;
  }
}
