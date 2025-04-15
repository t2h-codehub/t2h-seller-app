class GetDiscountByIdResModel {
  Discount? discount;

  GetDiscountByIdResModel({this.discount});

  GetDiscountByIdResModel.fromJson(Map<String, dynamic> json) {
    discount = json['discount'] != null
        ? Discount.fromJson(json['discount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (discount != null) {
      data['discount'] = discount!.toJson();
    }
    return data;
  }
}

class Discount {
  String? sId;
  String? name;
  String? user;
  String? type;
  String? code;
  String? description;
  int? discountValue;
  int? minOrderValue;
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

  Discount({
    this.sId,
    this.name,
    this.user,
    this.type,
    this.code,
    this.description,
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
    this.iV,
  });

  Discount.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    user = json['user'];
    type = json['type'];
    code = json['code'];
    description = json['description'];
    discountValue = json['discountValue'];
    minOrderValue = json['minOrderValue'];
    category = json['category'];
    collections = json['collections'] != null
        ? List<String>.from(json['collections'])
        : null;
    applicableProducts = json['applicableProducts'] != null
        ? List<String>.from(json['applicableProducts'])
        : null;
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
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['name'] = name;
    data['user'] = user;
    data['type'] = type;
    data['code'] = code;
    data['description'] = description;
    data['discountValue'] = discountValue;
    data['minOrderValue'] = minOrderValue;
    data['category'] = category;
    data['collections'] = collections;
    data['applicableProducts'] = applicableProducts;
    data['buyQuantity'] = buyQuantity;
    data['getQuantity'] = getQuantity;
    data['freeShipping'] = freeShipping;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['isCouponRequired'] = isCouponRequired;
    data['maxRedemptions'] = maxRedemptions;
    data['userEligibility'] = userEligibility;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
