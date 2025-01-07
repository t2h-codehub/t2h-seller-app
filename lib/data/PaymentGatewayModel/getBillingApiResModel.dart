class GetBillingApiResModel {
  String? message;
  bool? success;
  Data? data;

  GetBillingApiResModel({this.message, this.success, this.data});

  GetBillingApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
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
    businessCategory = json['businessCategory'];
    businessEntityType = json['businessEntityType'];
    businessSubCategory = json['businessSubCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sellerId'] = this.sellerId;
    data['businessPan'] = this.businessPan;
    data['gst'] = this.gst;
    data['shipmentAddress'] = this.shipmentAddress;
    data['operationalAddress'] = this.operationalAddress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['registerOperationalAddress'] = this.registerOperationalAddress;
    data['registerShipmentAddress'] = this.registerShipmentAddress;
    data['registerCity'] = this.registerCity;
    data['registerState'] = this.registerState;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['businessCategory'] = this.businessCategory;
    data['businessEntityType'] = this.businessEntityType;
    data['businessSubCategory'] = this.businessSubCategory;
    return data;
  }
}
