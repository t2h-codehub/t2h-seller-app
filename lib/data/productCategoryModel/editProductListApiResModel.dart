// class EditProductApiResModel {
//   String? message;
//   bool? success;
//   Product? product;

//   EditProductApiResModel({this.message, this.success, this.product});

//   EditProductApiResModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     success = json['success'];
//     product =
//     json['product'] != null ? Product.fromJson(json['product']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['message'] = message;
//     data['success'] = success;
//     if (product != null) {
//       data['product'] = product!.toJson();
//     }
//     return data;
//   }
// }

// class Product {
//   String? id;
//   String? title;
//   String? description;
//   List<String>? images;
//   String? sellerMobile;
//   int? mrp;
//   int? price;
//   int? stock;
//   bool? unlimitedStock;
//   Category? category;
//   Category? subcategory;
//   bool? active;
//   String? skuId;
//   String? productCollection;
//   List<String>? tags;
//   AdditionalInfo? additionalInfo;

//   Product(
//       {this.id,
//         this.title,
//         this.description,
//         this.images,
//         this.sellerMobile,
//         this.mrp,
//         this.price,
//         this.stock,
//         this.unlimitedStock,
//         this.category,
//         this.subcategory,
//         this.active,
//         this.skuId,
//         this.productCollection,
//         this.tags,
//         this.additionalInfo});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     images = json['images'].cast<String>();
//     sellerMobile = json['sellerMobile'];
//     mrp = json['mrp'];
//     price = json['price'];
//     stock = json['stock'];
//     unlimitedStock = json['unlimitedStock'];
//     category = json['category'] != null
//         ? Category.fromJson(json['category'])
//         : null;
//     subcategory = json['subcategory'] != null
//         ? Category.fromJson(json['subcategory'])
//         : null;
//     active = json['active'];
//     skuId = json['skuId'];
//     productCollection = json['productCollection'];
//     tags = json['tags'].cast<String>();
//     additionalInfo = json['additionalInfo'] != null
//         ? AdditionalInfo.fromJson(json['additionalInfo'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['description'] = description;
//     data['images'] = images;
//     data['sellerMobile'] = sellerMobile;
//     data['mrp'] = mrp;
//     data['price'] = price;
//     data['stock'] = stock;
//     data['unlimitedStock'] = unlimitedStock;
//     if (category != null) {
//       data['category'] = category!.toJson();
//     }
//     if (subcategory != null) {
//       data['subcategory'] = subcategory!.toJson();
//     }
//     data['active'] = active;
//     data['skuId'] = skuId;
//     data['productCollection'] = productCollection;
//     data['tags'] = tags;
//     if (additionalInfo != null) {
//       data['additionalInfo'] = additionalInfo!.toJson();
//     }
//     return data;
//   }
// }

// class Category {
//   String? sId;
//   String? title;

//   Category({this.sId, this.title});

//   Category.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['title'] = title;
//     return data;
//   }
// }

// class AdditionalInfo {
//   List<ProductVariants>? productVariants;
//   List<Attributes>? attributes;

//   AdditionalInfo({this.productVariants, this.attributes});

//   AdditionalInfo.fromJson(Map<String, dynamic> json) {
//     if (json['productVariants'] != null) {
//       productVariants = <ProductVariants>[];
//       json['productVariants'].forEach((v) {
//         productVariants!.add(ProductVariants.fromJson(v));
//       });
//     }
//     if (json['attributes'] != null) {
//       attributes = <Attributes>[];
//       json['attributes'].forEach((v) {
//         attributes!.add(Attributes.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (productVariants != null) {
//       data['productVariants'] =
//           productVariants!.map((v) => v.toJson()).toList();
//     }
//     if (attributes != null) {
//       data['attributes'] = attributes!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ProductVariants {
//   List<Variants>? variants;
//   bool? isDefault;
//   int? stock;
//   bool? unlimitedStock;
//   int? mrp;
//   int? price;
//   String? skuId;
//   String? sId;

//   ProductVariants(
//       {this.variants,
//         this.isDefault,
//         this.stock,
//         this.unlimitedStock,
//         this.mrp,
//         this.price,
//         this.skuId,
//         this.sId});

//   ProductVariants.fromJson(Map<String, dynamic> json) {
//     if (json['variants'] != null) {
//       variants = <Variants>[];
//       json['variants'].forEach((v) {
//         variants!.add(Variants.fromJson(v));
//       });
//     }
//     isDefault = json['isDefault'];
//     stock = json['stock'];
//     unlimitedStock = json['unlimitedStock'];
//     mrp = json['mrp'];
//     price = json['price'];
//     skuId = json['sku_id'];
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (variants != null) {
//       data['variants'] = variants!.map((v) => v.toJson()).toList();
//     }
//     data['isDefault'] = isDefault;
//     data['stock'] = stock;
//     data['unlimitedStock'] = unlimitedStock;
//     data['mrp'] = mrp;
//     data['price'] = price;
//     data['sku_id'] = skuId;
//     data['_id'] = sId;
//     return data;
//   }
// }

// class Variants {
//   Category? value;

//   Variants({this.value});

//   Variants.fromJson(Map<String, dynamic> json) {
//     value = json['value'] != null ? Category.fromJson(json['value']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (value != null) {
//       data['value'] = value!.toJson();
//     }
//     return data;
//   }
// }

// class Attributes {
//   String? id;
//   String? title;
//   List<Values>? values;
//   bool? isCustom;

//   Attributes({this.id, this.title, this.values, this.isCustom});

//   Attributes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     if (json['values'] != null) {
//       values = <Values>[];
//       json['values'].forEach((v) {
//         values!.add(Values.fromJson(v));
//       });
//     }
//     isCustom = json['isCustom'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     if (values != null) {
//       data['values'] = values!.map((v) => v.toJson()).toList();
//     }
//     data['isCustom'] = isCustom;
//     return data;
//   }
// }

// class Values {
//   String? id;
//   String? title;

//   Values({this.id, this.title});

//   Values.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     return data;
//   }
// }

// import 'dart:convert';

// class EditProductApiResModel {
//   final String? message;
//   final bool? success;
//   final Product? product;

//   EditProductApiResModel({
//     this.message,
//     this.success,
//     this.product,
//   });

//   factory EditProductApiResModel.fromJson(String source) =>
//       EditProductApiResModel.fromMap(json.decode(source));

//   factory EditProductApiResModel.fromMap(Map<String, dynamic> map) {
//     return EditProductApiResModel(
//       message: map['message'],
//       success: map['success'],
//       product: map['product'] != null ? Product.fromMap(map['product']) : null,
//     );
//   }
// }

// class Product {
//   final String? id;
//   final String? title;
//   final String? description;
//   final List<String>? images;
//   final String? sellerMobile;
//   final int? mrp;
//   final int? price;
//   final int? stock;
//   final bool? unlimitedStock;
//   final Category? category;
//   final Subcategory? subcategory;
//   final List<String>? sizeChart;
//   final bool? active;
//   final String? skuId;
//   final String? productCollection;
//   final List<String>? tags;
//   final AdditionalInfo? additionalInfo;

//   Product({
//     this.id,
//     this.title,
//     this.description,
//     this.images,
//     this.sellerMobile,
//     this.mrp,
//     this.price,
//     this.stock,
//     this.unlimitedStock,
//     this.category,
//     this.subcategory,
//     this.sizeChart,
//     this.active,
//     this.skuId,
//     this.productCollection,
//     this.tags,
//     this.additionalInfo,
//   });

//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//       id: map['id'],
//       title: map['title'],
//       description: map['description'],
//       images: map['images'] != null ? List<String>.from(map['images']) : null,
//       sellerMobile: map['sellerMobile'],
//       mrp: map['mrp'],
//       price: map['price'],
//       stock: map['stock'],
//       unlimitedStock: map['unlimitedStock'],
//       category: map['category'] != null ? Category.fromMap(map['category']) : null,
//       subcategory: map['subcategory'] != null ? Subcategory.fromMap(map['subcategory']) : null,
//       sizeChart: map['sizeChart'] != null ? List<String>.from(map['sizeChart']) : null,
//       active: map['active'],
//       skuId: map['skuId'],
//       productCollection: map['productCollection'],
//       tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
//       additionalInfo: map['additionalInfo'] != null ? AdditionalInfo.fromMap(map['additionalInfo']) : null,
//     );
//   }
// }

// class Category {
//   final String? id;
//   final String? title;

//   Category({this.id, this.title});

//   factory Category.fromMap(Map<String, dynamic> map) {
//     return Category(
//       id: map['_id'],
//       title: map['title'],
//     );
//   }
// }

// class Subcategory {
//   final String? id;
//   final String? title;

//   Subcategory({this.id, this.title});

//   factory Subcategory.fromMap(Map<String, dynamic> map) {
//     return Subcategory(
//       id: map['_id'],
//       title: map['title'],
//     );
//   }
// }

// class AdditionalInfo {
//   final List<String>? productVariants;
//   final List<String>? attributes;

//   AdditionalInfo({this.productVariants, this.attributes});

//   factory AdditionalInfo.fromMap(Map<String, dynamic> map) {
//     return AdditionalInfo(
//       productVariants: map['productVariants'] != null ? List<String>.from(map['productVariants']) : null,
//       attributes: map['attributes'] != null ? List<String>.from(map['attributes']) : null,
//     );
//   }
// }

import 'dart:convert';

class EditProductApiResModel {
  String? message;
  bool? success;
  Product? product;

  EditProductApiResModel({this.message, this.success, this.product});

  EditProductApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
  double? mrp;
  double? price;
  int? stock;
  bool? unlimitedStock;
  Category? category;
  Category? subcategory;
  List<dynamic>? sizeChart;  // Changed to dynamic
  bool? active;
  String? skuId;
  dynamic? productCollection;  // Changed to dynamic
  List<dynamic>? tags;  // Changed to dynamic
  AdditionalInfo? additionalInfo;

  Product({
    this.id,
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
    this.sizeChart,
    this.active,
    this.skuId,
    this.productCollection,
    this.tags,
    this.additionalInfo,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = List<String>.from(json['images'] ?? []);
    sellerMobile = json['sellerMobile'];
    mrp = json['mrp']?.toDouble();
    price = json['price']?.toDouble();
    stock = json['stock'];
    unlimitedStock = json['unlimitedStock'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    subcategory = json['subcategory'] != null ? Category.fromJson(json['subcategory']) : null;
    sizeChart = json['sizeChart'] ?? [];
    active = json['active'];
    skuId = json['skuId'];
    productCollection = json['productCollection'];
    tags = json['tags'] ?? [];
    additionalInfo = json['additionalInfo'] != null ? AdditionalInfo.fromJson(json['additionalInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['sizeChart'] = this.sizeChart;
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
        productVariants!.add(ProductVariants.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.productVariants != null) {
      data['productVariants'] = this.productVariants!.map((v) => v.toJson()).toList();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductVariants {
  String? sId;
  List<Variants>? variants;
  String? user;
  bool? isDefault;
  int? stock;
  bool? unlimitedStock;
  double? mrp;
  double? price;
  bool? isDisabled;
  List<String>? images;

  ProductVariants({
    this.sId,
    this.variants,
    this.user,
    this.isDefault,
    this.stock,
    this.unlimitedStock,
    this.mrp,
    this.price,
    this.isDisabled,
    this.images,
  });

  ProductVariants.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
    user = json['user'];
    isDefault = json['isDefault'];
    stock = json['stock'];
    unlimitedStock = json['unlimitedStock'];
    mrp = json['mrp']?.toDouble();
    price = json['price']?.toDouble();
    isDisabled = json['isDisabled'];
    images = List<String>.from(json['images'] ?? []);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    data['user'] = this.user;
    data['isDefault'] = this.isDefault;
    data['stock'] = this.stock;
    data['unlimitedStock'] = this.unlimitedStock;
    data['mrp'] = this.mrp;
    data['price'] = this.price;
    data['isDisabled'] = this.isDisabled;
    data['images'] = this.images;
    return data;
  }
}

class Variants {
  Category? value;
  String? sId;
  String? title;

  Variants({this.value, this.sId, this.title});

  Variants.fromJson(Map<String, dynamic> json) {
    value = json['value'] != null ? Category.fromJson(json['value']) : null;
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    data['_id'] = this.sId;
    data['title'] = this.title;
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
        values!.add(Values.fromJson(v));
      });
    }
    isCustom = json['isCustom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}


// class EditProductApiResModel {
//   final String? message;
//   final bool? success;
//   final Product? product;

//   EditProductApiResModel({
//     this.message,
//     this.success,
//     this.product,
//   });

//   factory EditProductApiResModel.fromJson(String source) =>
//       EditProductApiResModel.fromMap(json.decode(source));

//   factory EditProductApiResModel.fromMap(Map<String, dynamic> map) {
//     return EditProductApiResModel(
//       message: map['message'],
//       success: map['success'],
//       product: map['product'] != null ? Product.fromMap(map['product']) : null,
//     );
//   }
// }

// class Product {
//   final String? id;
//   final String? title;
//   final String? description;
//   final List<String>? images;
//   final String? sellerMobile;
//   final int? mrp;
//   final int? price;
//   final int? stock;
//   final bool? unlimitedStock;
//   final Category? category;
//   final Subcategory? subcategory;
//   final List<String>? sizeChart;
//   final bool? active;
//   final String? skuId;
//   final String? productCollection;
//   final List<String>? tags;
//   final AdditionalInfo? additionalInfo;

//   Product({
//     this.id,
//     this.title,
//     this.description,
//     this.images,
//     this.sellerMobile,
//     this.mrp,
//     this.price,
//     this.stock,
//     this.unlimitedStock,
//     this.category,
//     this.subcategory,
//     this.sizeChart,
//     this.active,
//     this.skuId,
//     this.productCollection,
//     this.tags,
//     this.additionalInfo,
//   });

//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//       id: map['id'],
//       title: map['title'],
//       description: map['description'],
//       images: map['images'] != null ? List<String>.from(map['images']) : null,
//       sellerMobile: map['sellerMobile'],
//       mrp: map['mrp'],
//       price: map['price'],
//       stock: map['stock'],
//       unlimitedStock: map['unlimitedStock'],
//       category: map['category'] != null ? Category.fromMap(map['category']) : null,
//       subcategory: map['subcategory'] != null ? Subcategory.fromMap(map['subcategory']) : null,
//       sizeChart: map['sizeChart'] != null ? List<String>.from(map['sizeChart']) : null,
//       active: map['active'],
//       skuId: map['skuId'],
//       productCollection: map['productCollection'],
//       tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
//       additionalInfo: map['additionalInfo'] != null ? AdditionalInfo.fromMap(map['additionalInfo']) : null,
//     );
//   }
// }

// class Category {
//   final String? id;
//   final String? title;

//   Category({this.id, this.title});

//   factory Category.fromMap(Map<String, dynamic> map) {
//     return Category(
//       id: map['_id'],
//       title: map['title'],
//     );
//   }
// }

// class Subcategory {
//   final String? id;
//   final String? title;

//   Subcategory({this.id, this.title});

//   factory Subcategory.fromMap(Map<String, dynamic> map) {
//     return Subcategory(
//       id: map['_id'],
//       title: map['title'],
//     );
//   }
// }

// class AdditionalInfo {
//   final List<ProductVariant>? productVariants;
//   final List<String>? attributes;

//   AdditionalInfo({this.productVariants, this.attributes});

//   // factory AdditionalInfo.fromMap(Map<String, dynamic> map) {
//   //   return AdditionalInfo(
//   //     productVariants: map['productVariants'] != null
//   //         ? List<ProductVariant>.from(
//   //             map['productVariants'].map((x) => ProductVariant.fromMap(x)))
//   //         : null,
//   //     attributes: map['attributes'] != null ? List<String>.from(map['attributes']) : null,
//   //   );
//   // }
//   factory AdditionalInfo.fromMap(Map<String, dynamic> map) {
//   return AdditionalInfo(
//     productVariants: map['productVariants'] != null && map['productVariants'] is List
//         ? List<ProductVariant>.from(
//             (map['productVariants'] as List).map(
//               (x) => x is Map<String, dynamic> ? ProductVariant.fromMap(x) : null,
//             ).whereType<ProductVariant>(), // Filters out null values
//           )
//         : null,
//     attributes: map['attributes'] != null ? List<String>.from(map['attributes']) : null,
//   );
// }

// }

// class ProductVariant {
//   final String? id;
//   final List<Variant>? variants;
//   final String? user;
//   final bool? isDefault;
//   final int? stock;
//   final bool? unlimitedStock;
//   final int? mrp;
//   final int? price;
//   final bool? isDisabled;
//   final List<String>? images;

//   ProductVariant({
//     this.id,
//     this.variants,
//     this.user,
//     this.isDefault,
//     this.stock,
//     this.unlimitedStock,
//     this.mrp,
//     this.price,
//     this.isDisabled,
//     this.images,
//   });

//   factory ProductVariant.fromMap(Map<String, dynamic> map) {
//     return ProductVariant(
//       id: map['_id'],
//       variants: map['variants'] != null
//           ? List<Variant>.from(map['variants'].map((x) => Variant.fromMap(x)))
//           : null,
//       user: map['user'],
//       isDefault: map['isDefault'],
//       stock: map['stock'],
//       unlimitedStock: map['unlimitedStock'],
//       mrp: map['mrp'],
//       price: map['price'],
//       isDisabled: map['isDisabled'],
//       images: map['images'] != null ? List<String>.from(map['images']) : null,
//     );
//   }
// }

// class Variant {
//   final String? id;
//   final String? title;
//   final VariantValue? value;

//   Variant({this.id, this.title, this.value});

//   factory Variant.fromMap(Map<String, dynamic> map) {
//     return Variant(
//       id: map['_id'],
//       title: map['title'],
//       value: map['value'] != null ? VariantValue.fromMap(map['value']) : null,
//     );
//   }
// }

// class VariantValue {
//   final String? id;
//   final String? title;

//   VariantValue({this.id, this.title});

//   factory VariantValue.fromMap(Map<String, dynamic> map) {
//     return VariantValue(
//       id: map['_id'],
//       title: map['title'],
//     );
//   }
// }

