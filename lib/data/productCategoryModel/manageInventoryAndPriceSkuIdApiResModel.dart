// // To parse this JSON data, do
// //
// //     final manageInventorySkuidPriceApiResModel = manageInventorySkuidPriceApiResModelFromJson(jsonString);

// import 'dart:convert';

// ManageInventorySkuidPriceApiResModel manageInventorySkuidPriceApiResModelFromJson(String str) => ManageInventorySkuidPriceApiResModel.fromJson(json.decode(str));

// String manageInventorySkuidPriceApiResModelToJson(ManageInventorySkuidPriceApiResModel data) => json.encode(data.toJson());

// class ManageInventorySkuidPriceApiResModel {
//   List<List<Combination>>? combinations;

//   ManageInventorySkuidPriceApiResModel({
//     this.combinations,
//   });

//   factory ManageInventorySkuidPriceApiResModel.fromJson(Map<String, dynamic> json) => ManageInventorySkuidPriceApiResModel(
//     combinations: List<List<Combination>>.from(json["combinations"].map((x) => List<Combination>.from(x.map((x) => Combination.fromJson(x))))),
//   );

//   Map<String, dynamic> toJson() => {
//     "combinations": List<dynamic>.from(combinations!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
//   };
// }

// class Combination {
//   String? variantTypeId;
//   String? variantType;
//   String? variantValueId;
//   String? variantValue;
//   int? price;
//   int? stock;
//   int? mrp;

//   Combination({
//     this.variantTypeId,
//     this.variantType,
//     this.variantValueId,
//     this.variantValue,
//     this.price,
//     this.stock,
//     this.mrp,
//   });

//   factory Combination.fromJson(Map<String, dynamic> json) => Combination(
//     variantTypeId: json["variantTypeId"],
//     variantType: json["variantType"],
//     variantValueId: json["variantValueId"],
//     variantValue: json["variantValue"],
//     price: json["price"],
//     stock: json["stock"],
//     mrp: json["mrp"],
//   );

//   Map<String, dynamic> toJson() => {
//     "variantTypeId": variantTypeId,
//     "variantType": variantType,
//     "variantValueId": variantValueId,
//     "variantValue": variantValue,
//     "price": price,
//     "stock": stock,
//     "mrp": mrp,
//   };
// }

// class ManageInventorySkuidPriceApiResModel {
//   List<Combinations>? combinations;
//   int? totalCount;

//   ManageInventorySkuidPriceApiResModel({this.combinations, this.totalCount});

//   ManageInventorySkuidPriceApiResModel.fromJson(Map<String, dynamic> json) {
//     if (json['combinations'] != null) {
//       combinations = <Combinations>[];
//       json['combinations'].forEach((v) {
//         combinations!.add(new Combinations.fromJson(v));
//       });
//     }
//     totalCount = json['totalCount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.combinations != null) {
//       data['combinations'] = this.combinations!.map((v) => v.toJson()).toList();
//     }
//     data['totalCount'] = this.totalCount;
//     return data;
//   }
// }

// class Combinations {
//   String? sId;
//   List<Variants>? variants;
//   int? stock;
//   bool? unlimitedStock;
//   int? mrp;
//   int? price;
//   bool? isDisabled;

//   Combinations(
//       {this.sId,
//       this.variants,
//       this.stock,
//       this.unlimitedStock,
//       this.mrp,
//       this.price,
//       this.isDisabled});

//   Combinations.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     if (json['variants'] != null) {
//       variants = <Variants>[];
//       json['variants'].forEach((v) {
//         variants!.add(new Variants.fromJson(v));
//       });
//     }
//     stock = json['stock'];
//     unlimitedStock = json['unlimitedStock'];
//     mrp = json['mrp'];
//     price = json['price'];
//     isDisabled = json['isDisabled'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     if (this.variants != null) {
//       data['variants'] = this.variants!.map((v) => v.toJson()).toList();
//     }
//     data['stock'] = this.stock;
//     data['unlimitedStock'] = this.unlimitedStock;
//     data['mrp'] = this.mrp;
//     data['price'] = this.price;
//     data['isDisabled'] = this.isDisabled;
//     return data;
//   }
// }

// class Variants {
//   Value? value;
//   String? sId;
//   String? title;

//   Variants({this.value, this.sId, this.title});

//   Variants.fromJson(Map<String, dynamic> json) {
//     value = json['value'] != null ? new Value.fromJson(json['value']) : null;
//     sId = json['_id'];
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.value != null) {
//       data['value'] = this.value!.toJson();
//     }
//     data['_id'] = this.sId;
//     data['title'] = this.title;
//     return data;
//   }
// }

// class Value {
//   String? sId;
//   String? title;

//   Value({this.sId, this.title});

//   Value.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['title'] = this.title;
//     return data;
//   }
// }

class ManageInventorySkuidPriceApiResModel {
  List<Combinations>? combinations;
  int? totalCount;

  ManageInventorySkuidPriceApiResModel({this.combinations, this.totalCount});

  ManageInventorySkuidPriceApiResModel.fromJson(Map<String, dynamic> json) {
    if (json['combinations'] != null) {
      combinations = <Combinations>[];
      json['combinations'].forEach((v) {
        combinations!.add(Combinations.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (combinations != null) {
      data['combinations'] = combinations!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = totalCount;
    return data;
  }
}

class Combinations {
  String? sId;
  List<Variants>? variants;
  int? stock;
  bool? unlimitedStock;
  double? mrp;
  double? price;
  bool? isDisabled;
  List<String>? images;

  Combinations({
    this.sId,
    this.variants,
    this.stock,
    this.unlimitedStock,
    this.mrp,
    this.price,
    this.isDisabled,
    this.images = const [],
  });

  Combinations.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        stock = json['stock'],
        unlimitedStock = json['unlimitedStock'],
        // mrp = json['mrp'],
        // price = json['price'],
         mrp = json['mrp']?.toDouble(),
    price = json['price']?.toDouble(),
        isDisabled = json['isDisabled'],
        images = List<String>.from(json['images'] ?? []),
        variants = (json['variants'] as List?)
            ?.map((v) => Variants.fromJson(v))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    data['stock'] = stock;
    data['unlimitedStock'] = unlimitedStock;
    data['mrp'] = mrp;
    data['price'] = price;
    data['isDisabled'] = isDisabled;
    data['images'] = images;
    return data;
  }
}

class Variants {
  Value? value;
  String? sId;
  String? title;

  Variants({this.value, this.sId, this.title});

  Variants.fromJson(Map<String, dynamic> json)
      : value = json['value'] != null ? Value.fromJson(json['value']) : null,
        sId = json['_id'],
        title = json['title'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (value != null) {
      data['value'] = value!.toJson();
    }
    data['_id'] = sId;
    data['title'] = title;
    return data;
  }
}

class Value {
  String? sId;
  String? title;

  Value({this.sId, this.title});

  Value.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        title = json['title'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['title'] = title;
    return data;
  }
}


