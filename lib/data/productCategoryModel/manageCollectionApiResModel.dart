class ManageCollectionApiResModel {
  String? message;
  List<SellerCollections>? sellerCollections;
  bool? success;

  ManageCollectionApiResModel(
      {this.message, this.sellerCollections, this.success});

  ManageCollectionApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['sellerCollections'] != null) {
      sellerCollections = <SellerCollections>[];
      json['sellerCollections'].forEach((v) {
        sellerCollections!.add(new SellerCollections.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.sellerCollections != null) {
      data['sellerCollections'] =
          this.sellerCollections!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class SellerCollections {
  String? sId;
  String? title;
  String? tag;
  String? user;
  List<String>? productIds;

  SellerCollections(
      {this.sId, this.title, this.tag, this.user, this.productIds});

  SellerCollections.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    tag = json['tag'];
    user = json['user'];
    productIds = json['productIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['tag'] = this.tag;
    data['user'] = this.user;
    data['productIds'] = this.productIds;
    return data;
  }
}
