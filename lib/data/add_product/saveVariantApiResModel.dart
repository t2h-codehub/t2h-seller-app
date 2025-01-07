class GetSaveVariantApiResModel {
  bool? success;
  String? message;
  List<Data>? data;

  GetSaveVariantApiResModel({this.success, this.message, this.data});

  GetSaveVariantApiResModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? product;
  List<Variants>? variants;
  String? user;
  bool? isDefault;
  int? stock;
  bool? unlimitedStock;
  int? mrp;
  int? price;
  String? skuId;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.product,
        this.variants,
        this.user,
        this.isDefault,
        this.stock,
        this.unlimitedStock,
        this.mrp,
        this.price,
        this.skuId,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    user = json['user'];
    isDefault = json['isDefault'];
    stock = json['stock'];
    unlimitedStock = json['unlimitedStock'];
    mrp = json['mrp'];
    price = json['price'];
    skuId = json['sku_id'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    data['user'] = this.user;
    data['isDefault'] = this.isDefault;
    data['stock'] = this.stock;
    data['unlimitedStock'] = this.unlimitedStock;
    data['mrp'] = this.mrp;
    data['price'] = this.price;
    data['sku_id'] = this.skuId;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Variants {
  String? sId;
  String? title;
  Value? value;

  Variants({this.sId, this.title, this.value});

  Variants.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Value {
  String? sId;
  String? title;

  Value({this.sId, this.title});

  Value.fromJson(Map<String, dynamic> json) {
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
