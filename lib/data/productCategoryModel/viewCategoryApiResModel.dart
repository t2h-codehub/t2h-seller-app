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
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
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
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
    isCustom = json['isCustom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    data['isCustom'] = this.isCustom;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['_id'] = this.sId;
    return data;
  }
}
