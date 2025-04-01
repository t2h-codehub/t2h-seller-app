// To parse this JSON data, do
//
//     final catalogueCategoryFilterApiResModel = catalogueCategoryFilterApiResModelFromJson(jsonString);

import 'dart:convert';

List<CatalogueCategoryFilterApiResModel> catalogueCategoryFilterApiResModelFromJson(String str) => List<CatalogueCategoryFilterApiResModel>.from(json.decode(str).map((x) => CatalogueCategoryFilterApiResModel.fromJson(x)));

String catalogueCategoryFilterApiResModelToJson(List<CatalogueCategoryFilterApiResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatalogueCategoryFilterApiResModel {
  String? id;
  String? title;
  List<Subcategory>? subcategories;

  CatalogueCategoryFilterApiResModel({
    this.id,
    this.title,
    this.subcategories,
  });

  factory CatalogueCategoryFilterApiResModel.fromJson(Map<String, dynamic> json) => CatalogueCategoryFilterApiResModel(
    id: json["_id"],
    title: json["title"],
    subcategories: List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "subcategories": List<dynamic>.from(subcategories!.map((x) => x.toJson())),
  };
}

class Subcategory {
  String? id;
  String? title;

  Subcategory({
    this.id,
    this.title,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    id: json["_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
  };
}
