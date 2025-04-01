// To parse this JSON data, do
//
//     final manageVariantsCollectionApiResModel = manageVariantsCollectionApiResModelFromJson(jsonString);

import 'dart:convert';

ManageVariantsCollectionApiResModel manageVariantsCollectionApiResModelFromJson(String str) => ManageVariantsCollectionApiResModel.fromJson(json.decode(str));

String manageVariantsCollectionApiResModelToJson(ManageVariantsCollectionApiResModel data) => json.encode(data.toJson());

class ManageVariantsCollectionApiResModel {
  bool? success;
  String? message;
  List<Datum>? data;

  ManageVariantsCollectionApiResModel({
    this.success,
    this.message,
    this.data,
  });

  factory ManageVariantsCollectionApiResModel.fromJson(Map<String, dynamic> json) => ManageVariantsCollectionApiResModel(
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
  List<VariantType>? values;
  String? user;
  String? product;
  bool? active;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.variantType,
    this.values,
    this.user,
    this.product,
    this.active,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    variantType: VariantType.fromJson(json["variantType"]),
    values: List<VariantType>.from(json["values"].map((x) => VariantType.fromJson(x))),
    user: json["user"],
    product: json["product"],
    active: json["active"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "variantType": variantType?.toJson(),
    "values": List<dynamic>.from(values!.map((x) => x.toJson())),
    "user": user,
    "product": product,
    "active": active,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
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
