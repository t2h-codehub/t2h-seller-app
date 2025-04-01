// To parse this JSON data, do
//
//     final getFilterCatalogueApiResModel = getFilterCatalogueApiResModelFromJson(jsonString);

import 'dart:convert';

GetFilterCatalogueApiResModel getFilterCatalogueApiResModelFromJson(String str) => GetFilterCatalogueApiResModel.fromJson(json.decode(str));

String getFilterCatalogueApiResModelToJson(GetFilterCatalogueApiResModel data) => json.encode(data.toJson());

class GetFilterCatalogueApiResModel {
  String? message;
  bool? success;
  int? totalProducts;
  List<Product>? products;

  GetFilterCatalogueApiResModel({
    this.message,
    this.success,
    this.totalProducts,
    this.products,
  });

  factory GetFilterCatalogueApiResModel.fromJson(Map<String, dynamic> json) => GetFilterCatalogueApiResModel(
    message: json["message"],
    success: json["success"],
    totalProducts: json["totalProducts"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "totalProducts": totalProducts,
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  Category? category;
  Category? subcategory;
  AdditionalInfo? additionalInfo;
  String? id;
  String? title;
  String? description;
  List<String>? images;
  String? user;
  int? mrp;
  int? price;
  int? stock;
  bool? unlimitedStock;
  List<dynamic>? sizeChart;
  bool? active;
  String? skuId;
  String? productCollection;
  List<String>? tags;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Product({
    this.category,
    this.subcategory,
    this.additionalInfo,
    this.id,
    this.title,
    this.description,
    this.images,
    this.user,
    this.mrp,
    this.price,
    this.stock,
    this.unlimitedStock,
    this.sizeChart,
    this.active,
    this.skuId,
    this.productCollection,
    this.tags,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    category: Category.fromJson(json["category"]),
    subcategory: Category.fromJson(json["subcategory"]),
    additionalInfo: AdditionalInfo.fromJson(json["additionalInfo"]),
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    user: json["user"],
    mrp: json["mrp"],
    price: json["price"],
    stock: json["stock"],
    unlimitedStock: json["unlimitedStock"],
    sizeChart: List<dynamic>.from(json["sizeChart"].map((x) => x)),
    active: json["active"],
    skuId: json["skuId"],
    productCollection: json["productCollection"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "category": category?.toJson(),
    "subcategory": subcategory?.toJson(),
    "additionalInfo": additionalInfo?.toJson(),
    "_id": id,
    "title": title,
    "description": description,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "user": user,
    "mrp": mrp,
    "price": price,
    "stock": stock,
    "unlimitedStock": unlimitedStock,
    "sizeChart": List<dynamic>.from(sizeChart!.map((x) => x)),
    "active": active,
    "skuId": skuId,
    "productCollection": productCollection,
    "tags": List<dynamic>.from(tags!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class AdditionalInfo {
  List<AdditionalInfoVariant>? variants;
  List<Attribute>? attributes;

  AdditionalInfo({
    this.variants,
    this.attributes,
  });

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) => AdditionalInfo(
    variants: List<AdditionalInfoVariant>.from(json["variants"].map((x) => AdditionalInfoVariant.fromJson(x))),
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "variants": List<dynamic>.from(variants!.map((x) => x.toJson())),
    "attributes": List<dynamic>.from(attributes!.map((x) => x.toJson())),
  };
}

class Attribute {
  Category? attributeId;
  String? product;
  List<Category>? values;
  String? user;
  bool? active;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Attribute({
    this.attributeId,
    this.product,
    this.values,
    this.user,
    this.active,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    attributeId: Category.fromJson(json["attributeId"]),
    product: json["product"],
    values: List<Category>.from(json["values"].map((x) => Category.fromJson(x))),
    user: json["user"],
    active: json["active"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "attributeId": attributeId?.toJson(),
    "product": product,
    "values": List<dynamic>.from(values!.map((x) => x.toJson())),
    "user": user,
    "active": active,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Category {
  String? id;
  String? title;

  Category({
    this.id,
    this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
  };
}

class AdditionalInfoVariant {
  String? product;
  List<VariantVariant>? variants;
  String? user;
  bool? isDefault;
  int? stock;
  bool? unlimitedStock;
  int? mrp;
  int? price;
  String? skuId;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  AdditionalInfoVariant({
    this.product,
    this.variants,
    this.user,
    this.isDefault,
    this.stock,
    this.unlimitedStock,
    this.mrp,
    this.price,
    this.skuId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AdditionalInfoVariant.fromJson(Map<String, dynamic> json) => AdditionalInfoVariant(
    product: json["product"],
    variants: List<VariantVariant>.from(json["variants"].map((x) => VariantVariant.fromJson(x))),
    user: json["user"],
    isDefault: json["isDefault"],
    stock: json["stock"],
    unlimitedStock: json["unlimitedStock"],
    mrp: json["mrp"],
    price: json["price"],
    skuId: json["sku_id"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "variants": List<dynamic>.from(variants!.map((x) => x.toJson())),
    "user": user,
    "isDefault": isDefault,
    "stock": stock,
    "unlimitedStock": unlimitedStock,
    "mrp": mrp,
    "price": price,
    "sku_id": skuId,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class VariantVariant {
  Category? value;
  String? id;
  String? title;

  VariantVariant({
    this.value,
    this.id,
    this.title,
  });

  factory VariantVariant.fromJson(Map<String, dynamic> json) => VariantVariant(
    value: Category.fromJson(json["value"]),
    id: json["_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "value": value?.toJson(),
    "_id": id,
    "title": title,
  };
}
