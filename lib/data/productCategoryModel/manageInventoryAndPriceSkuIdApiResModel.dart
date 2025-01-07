// To parse this JSON data, do
//
//     final manageInventorySkuidPriceApiResModel = manageInventorySkuidPriceApiResModelFromJson(jsonString);

import 'dart:convert';

ManageInventorySkuidPriceApiResModel manageInventorySkuidPriceApiResModelFromJson(String str) => ManageInventorySkuidPriceApiResModel.fromJson(json.decode(str));

String manageInventorySkuidPriceApiResModelToJson(ManageInventorySkuidPriceApiResModel data) => json.encode(data.toJson());

class ManageInventorySkuidPriceApiResModel {
  List<List<Combination>>? combinations;

  ManageInventorySkuidPriceApiResModel({
    this.combinations,
  });

  factory ManageInventorySkuidPriceApiResModel.fromJson(Map<String, dynamic> json) => ManageInventorySkuidPriceApiResModel(
    combinations: List<List<Combination>>.from(json["combinations"].map((x) => List<Combination>.from(x.map((x) => Combination.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "combinations": List<dynamic>.from(combinations!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
  };
}

class Combination {
  String? variantTypeId;
  String? variantType;
  String? variantValueId;
  String? variantValue;
  int? price;
  int? stock;
  int? mrp;

  Combination({
    this.variantTypeId,
    this.variantType,
    this.variantValueId,
    this.variantValue,
    this.price,
    this.stock,
    this.mrp,
  });

  factory Combination.fromJson(Map<String, dynamic> json) => Combination(
    variantTypeId: json["variantTypeId"],
    variantType: json["variantType"],
    variantValueId: json["variantValueId"],
    variantValue: json["variantValue"],
    price: json["price"],
    stock: json["stock"],
    mrp: json["mrp"],
  );

  Map<String, dynamic> toJson() => {
    "variantTypeId": variantTypeId,
    "variantType": variantType,
    "variantValueId": variantValueId,
    "variantValue": variantValue,
    "price": price,
    "stock": stock,
    "mrp": mrp,
  };
}
