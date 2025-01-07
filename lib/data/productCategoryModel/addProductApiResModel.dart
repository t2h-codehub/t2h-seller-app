class AppProductApiResModel {
  String? message;
  bool? success;
  Product? product;

  AppProductApiResModel({this.message, this.success, this.product});

  AppProductApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? title;
  String? description;
  List<String>? images;
  String? user;
  int? mrp;
  int? price;
  int? stock;
  bool? unlimitedStock;
  Category? category;
  Category? subcategory;
  bool? active;
  String? skuId;
  String? productCollection;
  List<String>? tags;
  String? sId;

  Product(
      {this.title,
        this.description,
        this.images,
        this.user,
        this.mrp,
        this.price,
        this.stock,
        this.unlimitedStock,
        this.category,
        this.subcategory,
        this.active,
        this.skuId,
        this.productCollection,
        this.tags,
        this.sId});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    images = json['images'].cast<String>();
    user = json['user'];
    mrp = json['mrp'];
    price = json['price'];
    stock = json['stock'];
    unlimitedStock = json['unlimitedStock'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subcategory = json['subcategory'] != null
        ? new Category.fromJson(json['subcategory'])
        : null;
    active = json['active'];
    skuId = json['skuId'];
    productCollection = json['productCollection'];
    tags = json['tags'].cast<String>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['images'] = this.images;
    data['user'] = this.user;
    data['mrp'] = this.mrp;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['unlimitedStock'] = this.unlimitedStock;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.toJson();
    }
    data['active'] = this.active;
    data['skuId'] = this.skuId;
    data['productCollection'] = this.productCollection;
    data['tags'] = this.tags;
    data['_id'] = this.sId;
    return data;
  }
}

class Category {
  String? sId;
  String? title;

  Category({this.sId, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    return data;
  }
}
