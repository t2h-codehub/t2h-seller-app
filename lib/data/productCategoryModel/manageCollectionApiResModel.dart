// class ManageCollectionApiResModel {
//   String? message;
//   List<SellerCollections>? sellerCollections;
//   bool? success;

//   ManageCollectionApiResModel(
//       {this.message, this.sellerCollections, this.success});

//   ManageCollectionApiResModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['sellerCollections'] != null) {
//       sellerCollections = <SellerCollections>[];
//       json['sellerCollections'].forEach((v) {
//         sellerCollections!.add(SellerCollections.fromJson(v));
//       });
//     }
//     success = json['success'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['message'] = message;
//     if (sellerCollections != null) {
//       data['sellerCollections'] =
//           sellerCollections!.map((v) => v.toJson()).toList();
//     }
//     data['success'] = success;
//     return data;
//   }
// }

// class SellerCollections {
//   String? sId;
//   String? title;
//   String? tag;
//   String? user;
//   List<String>? productIds;

//   SellerCollections(
//       {this.sId, this.title, this.tag, this.user, this.productIds});

//   SellerCollections.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     title = json['title'];
//     tag = json['tag'];
//     user = json['user'];
//     productIds = json['productIds'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['title'] = title;
//     data['tag'] = tag;
//     data['user'] = user;
//     data['productIds'] = productIds;
//     return data;
//   }
// }

// class ManageCollectionApiResModel {
//   String? message;
//   List<SellerCollections>? sellerCollections;
//   bool? success;

//   ManageCollectionApiResModel(
//       {this.message, this.sellerCollections, this.success});

//   ManageCollectionApiResModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['sellerCollections'] != null) {
//       sellerCollections = <SellerCollections>[];
//       json['sellerCollections'].forEach((v) {
//         sellerCollections!.add(new SellerCollections.fromJson(v));
//       });
//     }
//     success = json['success'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.sellerCollections != null) {
//       data['sellerCollections'] =
//           this.sellerCollections!.map((v) => v.toJson()).toList();
//     }
//     data['success'] = this.success;
//     return data;
//   }
// }

// class SellerCollections {
//   String? sId;
//   String? title;
//   String? tag;
//   String? user;
//   List<ProductIds>? productIds;

//   SellerCollections(
//       {this.sId, this.title, this.tag, this.user, this.productIds});

//   SellerCollections.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     title = json['title'];
//     tag = json['tag'];
//     user = json['user'];
//     if (json['productIds'] != null) {
//       productIds = <ProductIds>[];
//       json['productIds'].forEach((v) {
//         productIds!.add(new ProductIds.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['title'] = this.title;
//     data['tag'] = this.tag;
//     data['user'] = this.user;
//     if (this.productIds != null) {
//       data['productIds'] = this.productIds!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ProductIds {
//   String? sId;

//   ProductIds({this.sId});

//   ProductIds.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     return data;
//   }
// }

class ManageCollectionApiResModel {
  String? message;
  bool? success;
  List<Collections>? collections;

  ManageCollectionApiResModel({this.message, this.success, this.collections});

  ManageCollectionApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['collections'] != null) {
      collections = <Collections>[];
      json['collections'].forEach((v) {
        collections!.add(new Collections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.collections != null) {
      data['collections'] = this.collections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Collections {
  String? id;
  String? title;
  String? tag;
  String? user;
  List<Products>? products;

  Collections({this.id, this.title, this.tag, this.user, this.products});

  Collections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    tag = json['tag'];
    user = json['user'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['tag'] = this.tag;
    data['user'] = this.user;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? productId;
  int? order;

  Products({this.productId, this.order});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['order'] = this.order;
    return data;
  }
}


