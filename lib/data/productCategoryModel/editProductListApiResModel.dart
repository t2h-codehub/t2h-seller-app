class EditProductApiResModel {
  String? message;
  bool? success;
  Product? product;

  EditProductApiResModel({this.message, this.success, this.product});

  EditProductApiResModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? title;
  String? description;
  List<String>? images;
  String? sellerMobile;
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
  AdditionalInfo? additionalInfo;

  Product(
      {this.id,
        this.title,
        this.description,
        this.images,
        this.sellerMobile,
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
        this.additionalInfo});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images'].cast<String>();
    sellerMobile = json['sellerMobile'];
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
    additionalInfo = json['additionalInfo'] != null
        ? new AdditionalInfo.fromJson(json['additionalInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['images'] = this.images;
    data['sellerMobile'] = this.sellerMobile;
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
    if (this.additionalInfo != null) {
      data['additionalInfo'] = this.additionalInfo!.toJson();
    }
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

class AdditionalInfo {
  List<ProductVariants>? productVariants;
  List<Attributes>? attributes;

  AdditionalInfo({this.productVariants, this.attributes});

  AdditionalInfo.fromJson(Map<String, dynamic> json) {
    if (json['productVariants'] != null) {
      productVariants = <ProductVariants>[];
      json['productVariants'].forEach((v) {
        productVariants!.add(new ProductVariants.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productVariants != null) {
      data['productVariants'] =
          this.productVariants!.map((v) => v.toJson()).toList();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductVariants {
  List<Variants>? variants;
  bool? isDefault;
  int? stock;
  bool? unlimitedStock;
  int? mrp;
  int? price;
  String? skuId;
  String? sId;

  ProductVariants(
      {this.variants,
        this.isDefault,
        this.stock,
        this.unlimitedStock,
        this.mrp,
        this.price,
        this.skuId,
        this.sId});

  ProductVariants.fromJson(Map<String, dynamic> json) {
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    isDefault = json['isDefault'];
    stock = json['stock'];
    unlimitedStock = json['unlimitedStock'];
    mrp = json['mrp'];
    price = json['price'];
    skuId = json['sku_id'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    data['isDefault'] = this.isDefault;
    data['stock'] = this.stock;
    data['unlimitedStock'] = this.unlimitedStock;
    data['mrp'] = this.mrp;
    data['price'] = this.price;
    data['sku_id'] = this.skuId;
    data['_id'] = this.sId;
    return data;
  }
}

class Variants {
  Category? value;

  Variants({this.value});

  Variants.fromJson(Map<String, dynamic> json) {
    value = json['value'] != null ? new Category.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? id;
  String? title;
  List<Values>? values;
  bool? isCustom;

  Attributes({this.id, this.title, this.values, this.isCustom});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
    isCustom = json['isCustom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    data['isCustom'] = this.isCustom;
    return data;
  }
}

class Values {
  String? id;
  String? title;

  Values({this.id, this.title});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}