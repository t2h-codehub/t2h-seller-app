class UpdateBillingApiResModel {
  String? message;
  bool? success;
  Data? data;

  UpdateBillingApiResModel({this.message, this.success, this.data});

  UpdateBillingApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? sellerId;
  String? businessPan;
  String? gst;
  String? shipmentAddress;
  String? operationalAddress;
  String? city;
  String? state;
  String? registerOperationalAddress;
  String? registerShipmentAddress;
  String? registerCity;
  String? registerState;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? businessName;
  String? email;
  String? mobile;
  String? personName;
  String? relationship;
  String? businessCategory;
  String? businessEntityType;
  String? businessSubCategory;

  Data(
      {this.sId,
        this.sellerId,
        this.businessPan,
        this.gst,
        this.shipmentAddress,
        this.operationalAddress,
        this.city,
        this.state,
        this.registerOperationalAddress,
        this.registerShipmentAddress,
        this.registerCity,
        this.registerState,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.businessName,
        this.email,
        this.mobile,
        this.personName,
        this.relationship,
        this.businessCategory,
        this.businessEntityType,
        this.businessSubCategory});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sellerId = json['sellerId'];
    businessPan = json['businessPan'];
    gst = json['gst'];
    shipmentAddress = json['shipmentAddress'];
    operationalAddress = json['operationalAddress'];
    city = json['city'];
    state = json['state'];
    registerOperationalAddress = json['registerOperationalAddress'];
    registerShipmentAddress = json['registerShipmentAddress'];
    registerCity = json['registerCity'];
    registerState = json['registerState'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    businessName = json['businessName'];
    email = json['email'];
    mobile = json['mobile'];
    personName = json['personName'];
    relationship = json['relationship'];
    businessCategory = json['businessCategory'];
    businessEntityType = json['businessEntityType'];
    businessSubCategory = json['businessSubCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['sellerId'] = sellerId;
    data['businessPan'] = businessPan;
    data['gst'] = gst;
    data['shipmentAddress'] = shipmentAddress;
    data['operationalAddress'] = operationalAddress;
    data['city'] = city;
    data['state'] = state;
    data['registerOperationalAddress'] = registerOperationalAddress;
    data['registerShipmentAddress'] = registerShipmentAddress;
    data['registerCity'] = registerCity;
    data['registerState'] = registerState;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['businessName'] = businessName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['personName'] = personName;
    data['relationship'] = relationship;
    data['businessCategory'] = businessCategory;
    data['businessEntityType'] = businessEntityType;
    data['businessSubCategory'] = businessSubCategory;
    return data;
  }
}
