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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
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
        variants!.add(Variants.fromJson(v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product;
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    data['user'] = user;
    data['isDefault'] = isDefault;
    data['stock'] = stock;
    data['unlimitedStock'] = unlimitedStock;
    data['mrp'] = mrp;
    data['price'] = price;
    data['sku_id'] = skuId;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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
    value = json['value'] != null ? Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    if (value != null) {
      data['value'] = value!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    return data;
  }
}
