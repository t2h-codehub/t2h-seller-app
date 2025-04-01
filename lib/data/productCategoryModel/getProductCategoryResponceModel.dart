class GetProductCategoryResponceModel {
  String? message;
  bool? success;
  List<Categories>? categories;

  GetProductCategoryResponceModel(
      {this.message, this.success, this.categories});

  GetProductCategoryResponceModel.fromJson(Map<String, dynamic> json) {
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
  String? categoryId;
  String? title;
  String? categoryImage;
  bool? active;
  String? user;

  Categories(
      {this.sId,
      this.categoryId,
      this.title,
      this.categoryImage,
      this.active,
      this.user});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryId = json['categoryId'];
    title = json['title'];
    categoryImage = json['categoryImage'];
    active = json['active'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['categoryId'] = this.categoryId;
    data['title'] = this.title;
    data['categoryImage'] = this.categoryImage;
    data['active'] = this.active;
    data['user'] = this.user;
    return data;
  }
}
