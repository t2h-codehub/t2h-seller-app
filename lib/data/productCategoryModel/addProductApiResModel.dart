class AppProductApiResModel {
  String? message;
  bool? success;
  Product? product;

  AppProductApiResModel({this.message, this.success, this.product});

  AppProductApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  String? title;
  String? description;
  List<String>? images;
  String? user;
  double? mrp;
  double? price;
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
    mrp = json['mrp']?.toDouble();
    price = json['price']?.toDouble();
    stock = json['stock'];
    unlimitedStock = json['unlimitedStock'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    subcategory = json['subcategory'] != null
        ? Category.fromJson(json['subcategory'])
        : null;
    active = json['active'];
    skuId = json['skuId'];
    productCollection = json['productCollection'];
    tags = json['tags'].cast<String>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['images'] = images;
    data['user'] = user;
    data['mrp'] = mrp;
    data['price'] = price;
    data['stock'] = stock;
    data['unlimitedStock'] = unlimitedStock;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subcategory != null) {
      data['subcategory'] = subcategory!.toJson();
    }
    data['active'] = active;
    data['skuId'] = skuId;
    data['productCollection'] = productCollection;
    data['tags'] = tags;
    data['_id'] = sId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    return data;
  }
}
