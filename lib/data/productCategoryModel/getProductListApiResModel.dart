// To parse this JSON data, do
//
//     final getProductApiResModel = getProductApiResModelFromJson(jsonString);

import 'dart:convert';

// GetProductApiResModel getProductApiResModelFromJson(String str) => GetProductApiResModel.fromJson(json.decode(str));

// String getProductApiResModelToJson(GetProductApiResModel data) => json.encode(data.toJson());

// class GetProductApiResModel {
//   String? message;
//   bool? success;
//   List<Products>? products;

//   GetProductApiResModel({
//     this.message,
//     this.success,
//     this.products,
//   });

//   GetProductApiResModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     success = json['success'];
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(Products.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['message'] = message;
//     data['success'] = success;
//     if (products != null) {
//       data['products'] = products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Products {
//   String? id;
//   String? title;
//   String? description;
//   List<String>? images;
//   int? mrp;
//   int? price;
//   int? stock;
//   bool? unlimitedStock;
//   Category? category;
//   Category? subcategory;
//   List<dynamic>? sizeChart;
//   bool? active;
//   String? skuId;
//   String? productCollection;
//   List<String>? tags;

//   Products({
//     this.id,
//     this.title,
//     this.description,
//     this.images,
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
//   });

//   factory Products.fromJson(Map<String, dynamic> json) => Products(
//     id: json["id"],
//     title: json["title"],
//     description: json["description"],
//     images: List<String>.from(json["images"].map((x) => x)),
//     mrp: json["mrp"],
//     price: json["price"],
//     stock: json["stock"],
//     unlimitedStock: json["unlimitedStock"],
//     category: Category.fromJson(json["category"]),
//     subcategory: Category.fromJson(json["subcategory"]),
//     sizeChart: List<dynamic>.from(json["sizeChart"].map((x) => x)),
//     active: json["active"],
//     skuId: json["skuId"],
//     productCollection: json["productCollection"],
//     tags: List<String>.from(json["tags"].map((x) => x)),
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "description": description,
//     "images": List<dynamic>.from(images!.map((x) => x)),
//     "mrp": mrp,
//     "price": price,
//     "stock": stock,
//     "unlimitedStock": unlimitedStock,
//     "category": category!.toJson(),
//     "subcategory": subcategory!.toJson(),
//     "sizeChart": List<dynamic>.from(sizeChart!.map((x) => x)),
//     "active": active,
//     "skuId": skuId,
//     "productCollection": productCollection,
//     "tags": List<dynamic>.from(tags!.map((x) => x)),
//   };
// }

// class AdditionalInfo {
//   List<Variant>? variants;
//   List<Attribute>? attributes;

//   AdditionalInfo({
//     this.variants,
//     this.attributes,
//   });

//   factory AdditionalInfo.fromJson(Map<String, dynamic> json) => AdditionalInfo(
//     variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
//     attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
//   );

//   Map<String, dynamic> toJson() => {
//     "variants": List<dynamic>.from(variants!.map((x) => x.toJson())),
//     "attributes": List<dynamic>.from(attributes!.map((x) => x.toJson())),
//   };
// }

// class Attribute {
//   String? id;
//   String? title;
//   List<AttributeValue>? values;
//   bool? isCustom;

//   Attribute({
//     this.id,
//     this.title,
//     this.values,
//     this.isCustom,
//   });

//   factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
//     id: json["id"],
//     title: json["title"],
//     values: List<AttributeValue>.from(json["values"].map((x) => AttributeValue.fromJson(x))),
//     isCustom: json["isCustom"],
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "values": List<dynamic>.from(values!.map((x) => x.toJson())),
//     "isCustom": isCustom,
//   };
// }

// class AttributeValue {
//   String? id;
//   String? title;

//   AttributeValue({
//     this.id,
//     this.title,
//   });

//   factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
//     id: json["id"],
//     title: json["title"],
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//   };
// }

// class Variant {
//   String? variantId;
//   String? variantTitle;
//   bool? isCustom;
//   int? count;
//   List<VariantValue>? values;

//   Variant({
//     this.variantId,
//     this.variantTitle,
//     this.isCustom,
//     this.count,
//     this.values,
//   });

//   factory Variant.fromJson(Map<String, dynamic> json) => Variant(
//     variantId: json["variantId"],
//     variantTitle: json["variantTitle"],
//     isCustom: json["isCustom"],
//     count: json["count"],
//     values: List<VariantValue>.from(json["values"].map((x) => VariantValue.fromJson(x))),
//   );

//   Map<String, dynamic> toJson() => {
//     "variantId": variantId,
//     "variantTitle": variantTitle,
//     "isCustom": isCustom,
//     "count": count,
//     "values": List<dynamic>.from(values!.map((x) => x.toJson())),
//   };
// }

// class VariantValue {
//   String? valueId;
//   String? valueTitle;
//   List<Detail>? details;

//   VariantValue({
//     this.valueId,
//     this.valueTitle,
//     this.details,
//   });

//   factory VariantValue.fromJson(Map<String, dynamic> json) => VariantValue(
//     valueId: json["valueId"],
//     valueTitle: json["valueTitle"],
//     details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
//   );

//   Map<String, dynamic> toJson() => {
//     "valueId": valueId,
//     "valueTitle": valueTitle,
//     "details": List<dynamic>.from(details!.map((x) => x.toJson())),
//   };
// }

// class Detail {
//   bool? isDefault;
//   int? stock;
//   int? mrp;
//   int? price;
//   String? skuId;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   Detail({
//     this.isDefault,
//     this.stock,
//     this.mrp,
//     this.price,
//     this.skuId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory Detail.fromJson(Map<String, dynamic> json) => Detail(
//     isDefault: json["isDefault"],
//     stock: json["stock"],
//     mrp: json["mrp"],
//     price: json["price"],
//     skuId: json["sku_id"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "isDefault": isDefault,
//     "stock": stock,
//     "mrp": mrp,
//     "price": price,
//     "sku_id": skuId,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//   };
// }

// class Category {
//   Category();

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//   );

//   Map<String, dynamic> toJson() => {
//   };
// }


class GetProductApiResModel {
  String? message;
  bool? success;
  List<Products>? products;

  GetProductApiResModel({this.message, this.success, this.products});

  GetProductApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Products {
//   String? id;
//   String? title;
//   String? description;
//   List<String>? images;
//   int? mrp;
//   int? price;
//   int? stock;
//   bool? unlimitedStock;
//   Category? category;
//   Category? subcategory;
//   List<String>? sizeChart;
//   bool? active;
//   String? skuId;
//   String? productCollection;
//   List<String>? tags;
//   AdditionalInfo? additionalInfo;

//   Products(
//       {this.id,
//       this.title,
//       this.description,
//       this.images,
//       this.mrp,
//       this.price,
//       this.stock,
//       this.unlimitedStock,
//       this.category,
//       this.subcategory,
//       this.sizeChart,
//       this.active,
//       this.skuId,
//       this.productCollection,
//       this.tags,
//       this.additionalInfo});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     images = json['images'].cast<String>();
//     mrp = json['mrp'];
//     price = json['price'];
//     stock = json['stock'];
//     unlimitedStock = json['unlimitedStock'];
//     category = json['category'] != null
//         ? new Category.fromJson(json['category'])
//         : null;
//     subcategory = json['subcategory'] != null
//         ? new Category.fromJson(json['subcategory'])
//         : null;
//     sizeChart = json['sizeChart'].cast<String>();
//     active = json['active'];
//     skuId = json['skuId'];
//     productCollection = json['productCollection'];
//     tags = json['tags'].cast<String>();
//     additionalInfo = json['additionalInfo'] != null
//         ? new AdditionalInfo.fromJson(json['additionalInfo'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['images'] = this.images;
//     data['mrp'] = this.mrp;
//     data['price'] = this.price;
//     data['stock'] = this.stock;
//     data['unlimitedStock'] = this.unlimitedStock;
//     if (this.category != null) {
//       data['category'] = this.category!.toJson();
//     }
//     if (this.subcategory != null) {
//       data['subcategory'] = this.subcategory!.toJson();
//     }
//     data['sizeChart'] = this.sizeChart;
//     data['active'] = this.active;
//     data['skuId'] = this.skuId;
//     data['productCollection'] = this.productCollection;
//     data['tags'] = this.tags;
//     if (this.additionalInfo != null) {
//       data['additionalInfo'] = this.additionalInfo!.toJson();
//     }
//     return data;
//   }
// }

class Products {
  String? id;
  String? title;
  String? description;
  List<String>? images;
  double? mrp;
  double? price;
  int? stock;
  bool? unlimitedStock;
  Category? category;
  Category? subcategory;
  List<String>? sizeChart;
  bool? active;
  String? skuId;
  String? productCollection;
  List<String>? tags;
  AdditionalInfo? additionalInfo;

  Products({
    this.id,
    this.title,
    this.description,
    this.images,
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

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images']?.cast<String>();
    mrp = json['mrp']?.toDouble();
    price = json['price']?.toDouble();
    stock = json['stock'];
    unlimitedStock = json['unlimitedStock'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    subcategory = json['subcategory'] != null
        ? Category.fromJson(json['subcategory'])
        : null;
    sizeChart = json['sizeChart']?.cast<String>();
    active = json['active'];
    skuId = json['skuId'];
    productCollection = json['productCollection'];
    tags = json['tags']?.cast<String>();
    additionalInfo = json['additionalInfo'] != null
        ? AdditionalInfo.fromJson(json['additionalInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['images'] = images;
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
    data['sizeChart'] = sizeChart;
    data['active'] = active;
    data['skuId'] = skuId;
    data['productCollection'] = productCollection;
    data['tags'] = tags;
    if (additionalInfo != null) {
      data['additionalInfo'] = additionalInfo!.toJson();
    }
    return data;
  }
}



class Category {
  String? id;
  String? title;

  Category({this.id, this.title});

  Category.fromJson(Map<String, dynamic> json) {
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

class AdditionalInfo {
  List<Variants>? variants;
  List<Attribute>? attributes;

  AdditionalInfo({this.variants, this.attributes});

  AdditionalInfo.fromJson(Map<String, dynamic> json) {
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = <Attribute>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attribute.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variants {
  String? valueId;
  String? valueTitle;
  List<Details>? details;

  Variants({this.valueId, this.valueTitle, this.details});

  Variants.fromJson(Map<String, dynamic> json) {
    valueId = json['valueId'];
    valueTitle = json['valueTitle'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valueId'] = this.valueId;
    data['valueTitle'] = this.valueTitle;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  bool? isDefault;
  int? stock;
  bool? unlimitedStock;
  double? mrp;
  double? price;
  String? createdAt;
  String? updatedAt;

  Details({
    this.isDefault,
    this.stock,
    this.unlimitedStock,
    this.mrp,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  Details.fromJson(Map<String, dynamic> json) {
    isDefault = json['isDefault'];
    stock = json['stock'];
    unlimitedStock = json['unlimitedStock'];
    mrp = json['mrp']?.toDouble();
    price = json['price']?.toDouble();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isDefault'] = isDefault;
    data['stock'] = stock;
    data['unlimitedStock'] = unlimitedStock;
    data['mrp'] = mrp;
    data['price'] = price;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

// class Details {
//   bool? isDefault;
//   int? stock;
//   bool? unlimitedStock;
//   int? mrp;
//   int? price;
//   String? createdAt;
//   String? updatedAt;

//   Details(
//       {this.isDefault,
//       this.stock,
//       this.unlimitedStock,
//       this.mrp,
//       this.price,
//       this.createdAt,
//       this.updatedAt});

//   Details.fromJson(Map<String, dynamic> json) {
//     isDefault = json['isDefault'];
//     stock = json['stock'];
//     unlimitedStock = json['unlimitedStock'];
//     mrp = json['mrp'];
//     price = json['price'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['isDefault'] = this.isDefault;
//     data['stock'] = this.stock;
//     data['unlimitedStock'] = this.unlimitedStock;
//     data['mrp'] = this.mrp;
//     data['price'] = this.price;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }

class Attribute {
  String? id;
  String? title;
  List<AttributeValue>? values;
  bool? isCustom;

  Attribute({
    this.id,
    this.title,
    this.values,
    this.isCustom,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    id: json["id"],
    title: json["title"],
    values: List<AttributeValue>.from(json["values"].map((x) => AttributeValue.fromJson(x))),
    isCustom: json["isCustom"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "values": List<dynamic>.from(values!.map((x) => x.toJson())),
    "isCustom": isCustom,
  };
}

class AttributeValue {
  String? id;
  String? title;

  AttributeValue({
    this.id,
    this.title,
  });

  factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}

// class Attributes {
//   String? id;
//   String? title;
//   List<Values>? values;

//   Attributes({this.id, this.title, this.values});

//   Attributes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     if (json['values'] != null) {
//       values = <Values>[];
//       json['values'].forEach((v) {
//         values!.add(new Values.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     if (this.values != null) {
//       data['values'] = this.values!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

