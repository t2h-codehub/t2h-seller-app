// To parse this JSON data, do
//
//     final getTempSellerVariantsApiResModel = getTempSellerVariantsApiResModelFromJson(jsonString);

import 'dart:convert';

GetTempSellerVariantsApiResModel getTempSellerVariantsApiResModelFromJson(String str) => GetTempSellerVariantsApiResModel.fromJson(json.decode(str));

String getTempSellerVariantsApiResModelToJson(GetTempSellerVariantsApiResModel data) => json.encode(data.toJson());

class GetTempSellerVariantsApiResModel {
  bool? success;
  String? message;
  List<Datum>? data;

  GetTempSellerVariantsApiResModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetTempSellerVariantsApiResModel.fromJson(Map<String, dynamic> json) => GetTempSellerVariantsApiResModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  VariantType? variantType;
  String? id;
  List<VariantType>? values;
  String? user;
  String? product;

  Datum({
    this.variantType,
    this.id,
    this.values,
    this.user,
    this.product,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    variantType: VariantType.fromJson(json["variantType"]),
    id: json["_id"],
    values: List<VariantType>.from(json["values"].map((x) => VariantType.fromJson(x))),
    user: json["user"],
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "variantType": variantType?.toJson(),
    "_id": id,
    "values": List<dynamic>.from(values!.map((x) => x.toJson())),
    "user": user,
    "product": product,
  };
}

class VariantType {
  String? id;
  String? title;

  VariantType({
    this.id,
    this.title,
  });

  factory VariantType.fromJson(Map<String, dynamic> json) => VariantType(
    id: json["_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
  };
}
