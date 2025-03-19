class SaveSellerCategoriesApiResModel {
  String? message;
  bool? success;
  List<Categories>? categories;

  SaveSellerCategoriesApiResModel(
      {this.message, this.success, this.categories});

  SaveSellerCategoriesApiResModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? subcategories;
  bool? active;

  Categories({this.sId, this.title, this.subcategories, this.active});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    subcategories = json['subcategories'].cast<String>();
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['subcategories'] = subcategories;
    data['active'] = active;
    return data;
  }
}
