class ViewCategoriesApiResModel {
  String? message;
  bool? success;
  List<Categories>? categories;

  ViewCategoriesApiResModel({this.message, this.success, this.categories});

  ViewCategoriesApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? sId;
  String? title;
  List<Subcategories>? subcategories;
  bool? isCustom;

  Categories({this.sId, this.title, this.subcategories, this.isCustom});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(Subcategories.fromJson(v));
      });
    }
    isCustom = json['isCustom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    if (subcategories != null) {
      data['subcategories'] =
          subcategories!.map((v) => v.toJson()).toList();
    }
    data['isCustom'] = isCustom;
    return data;
  }
}

class Subcategories {
  String? title;
  String? sId;

  Subcategories({this.title, this.sId});

  Subcategories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['_id'] = sId;
    return data;
  }
}
