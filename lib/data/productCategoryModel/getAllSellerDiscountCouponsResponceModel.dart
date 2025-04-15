class GetAllSellerDiscountCouponsResponceModel {
  int? total;
  int? page;
  int? pageSize;
   String? message;
  List<Discounts>? discounts;
  

  GetAllSellerDiscountCouponsResponceModel(
      {this.total, this.page, this.pageSize, this.discounts});

  GetAllSellerDiscountCouponsResponceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    total = json['total'];
    page = json['page'];
    pageSize = json['pageSize'];
    if (json['discounts'] != null) {
      discounts = <Discounts>[];
      json['discounts'].forEach((v) {
        discounts!.add(new Discounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['total'] = this.total;
    data['page'] = this.page;
    data['pageSize'] = this.pageSize;
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Discounts {
  String? sId;
  String? name;
  String? user;
  String? type;
  String? code;
  // int? discountValue;
  // int? minOrderValue;
  double? discountValue;
double? minOrderValue;
  String? category;
  List<String>? collections;
  List<String>? applicableProducts;
  int? buyQuantity;
  int? getQuantity;
  bool? freeShipping;
  String? startDate;
  String? endDate;
  bool? isCouponRequired;
  int? maxRedemptions;
  String? userEligibility;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Discounts(
      {this.sId,
      this.name,
      this.user,
      this.type,
      this.code,
      this.discountValue,
      this.minOrderValue,
      this.category,
      this.collections,
      this.applicableProducts,
      this.buyQuantity,
      this.getQuantity,
      this.freeShipping,
      this.startDate,
      this.endDate,
      this.isCouponRequired,
      this.maxRedemptions,
      this.userEligibility,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV});

  // Discounts.fromJson(Map<String, dynamic> json) {
  //   sId = json['_id'];
  //   name = json['name'];
  //   user = json['user'];
  //   type = json['type'];
  //   code = json['code'];
  //   discountValue = json['discountValue'];
  //   minOrderValue = json['minOrderValue'];
  //   category = json['category'];
  //   collections = json['collections'].cast<String>();
  //   applicableProducts = json['applicableProducts'].cast<String>();
  //   buyQuantity = json['buyQuantity'];
  //   getQuantity = json['getQuantity'];
  //   freeShipping = json['freeShipping'];
  //   startDate = json['startDate'];
  //   endDate = json['endDate'];
  //   isCouponRequired = json['isCouponRequired'];
  //   maxRedemptions = json['maxRedemptions'];
  //   userEligibility = json['userEligibility'];
  //   isActive = json['isActive'];
  //   createdAt = json['createdAt'];
  //   updatedAt = json['updatedAt'];
  //   iV = json['__v'];
  // }

  Discounts.fromJson(Map<String, dynamic> json) {
  sId = json['_id'];
  name = json['name'];
  user = json['user'];
  type = json['type'];
  code = json['code'];
  // discountValue = json['discountValue'];
  // minOrderValue = json['minOrderValue'];
  discountValue = json['discountValue'] != null ? (json['discountValue'] as num).toDouble() : null;
minOrderValue = json['minOrderValue'] != null ? (json['minOrderValue'] as num).toDouble() : null;

  category = json['category'];
  collections = json['collections'] != null ? List<String>.from(json['collections']) : null;
  applicableProducts = json['applicableProducts'] != null ? List<String>.from(json['applicableProducts']) : null;
  buyQuantity = json['buyQuantity'];
  getQuantity = json['getQuantity'];
  freeShipping = json['freeShipping'];
  startDate = json['startDate'];
  endDate = json['endDate'];
  isCouponRequired = json['isCouponRequired'];
  maxRedemptions = json['maxRedemptions'];
  userEligibility = json['userEligibility'];
  isActive = json['isActive'];
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  iV = json['__v'];
}


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['user'] = this.user;
    data['type'] = this.type;
    data['code'] = this.code;
    data['discountValue'] = this.discountValue;
    data['minOrderValue'] = this.minOrderValue;
    data['category'] = this.category;
    data['collections'] = this.collections;
    data['applicableProducts'] = this.applicableProducts;
    data['buyQuantity'] = this.buyQuantity;
    data['getQuantity'] = this.getQuantity;
    data['freeShipping'] = this.freeShipping;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['isCouponRequired'] = this.isCouponRequired;
    data['maxRedemptions'] = this.maxRedemptions;
    data['userEligibility'] = this.userEligibility;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
