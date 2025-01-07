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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['subcategories'] = this.subcategories;
    data['active'] = this.active;
    return data;
  }
}
