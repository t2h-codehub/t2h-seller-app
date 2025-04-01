import 'dart:convert';
class ManualShipmentResponseModel {
  String? message;
  bool? success;
  String? shipmentId;
  String? awbCode;
  String? shipmentDate;
  String? courierPartner;

  ManualShipmentResponseModel(
      {this.message,
      this.success,
      this.shipmentId,
      this.awbCode,
      this.shipmentDate,
      this.courierPartner});

  ManualShipmentResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    shipmentId = json['shipment_id'];
    awbCode = json['awb_code'];
    shipmentDate = json['shipment_date'];
    courierPartner = json['courier_partner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['shipment_id'] = this.shipmentId;
    data['awb_code'] = this.awbCode;
    data['shipment_date'] = this.shipmentDate;
    data['courier_partner'] = this.courierPartner;
    return data;
  }
}
