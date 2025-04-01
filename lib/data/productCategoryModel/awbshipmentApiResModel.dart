// class AwbResponse {
//   int? awbAssignStatus;
//   ShipmentData? shipmentData;
//   int? noPickupPopup;
//   int? quickPick;

//   AwbResponse({
//     this.awbAssignStatus,
//     this.shipmentData,
//     this.noPickupPopup,
//     this.quickPick,
//   });

//   factory AwbResponse.fromJson(Map<String, dynamic> json) {
//     return AwbResponse(
//       awbAssignStatus: json['awb_assign_status'],
//       shipmentData: json['response']?['data'] != null
//           ? ShipmentData.fromJson(json['response']['data'])
//           : null,
//       noPickupPopup: json['no_pickup_popup'],
//       quickPick: json['quick_pick'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'awb_assign_status': awbAssignStatus,
//       'response': {'data': shipmentData?.toJson()},
//       'no_pickup_popup': noPickupPopup,
//       'quick_pick': quickPick,
//     };
//   }
// }

// class ShipmentData {
//   int? courierCompanyId;
//   String? awbCode;
//   int? cod;
//   int? orderId;
//   int? shipmentId;
//   int? awbCodeStatus;
//   DateTime? assignedDateTime;
//   double? appliedWeight;
//   int? companyId;
//   String? courierName;
//   String? childCourierName;
//   double? freightCharges;
//   String? routingCode;
//   String? rtoRoutingCode;
//   String? invoiceNo;
//   String? transporterId;
//   String? transporterName;
//   ShipperDetails? shippedBy;

//   ShipmentData({
//     this.courierCompanyId,
//     this.awbCode,
//     this.cod,
//     this.orderId,
//     this.shipmentId,
//     this.awbCodeStatus,
//     this.assignedDateTime,
//     this.appliedWeight,
//     this.companyId,
//     this.courierName,
//     this.childCourierName,
//     this.freightCharges,
//     this.routingCode,
//     this.rtoRoutingCode,
//     this.invoiceNo,
//     this.transporterId,
//     this.transporterName,
//     this.shippedBy,
//   });

//   factory ShipmentData.fromJson(Map<String, dynamic> json) {
//     return ShipmentData(
//       courierCompanyId: json['courier_company_id'],
//       awbCode: json['awb_code'],
//       cod: json['cod'],
//       orderId: json['order_id'],
//       shipmentId: json['shipment_id'],
//       awbCodeStatus: json['awb_code_status'],
//       assignedDateTime: json['assigned_date_time'] != null
//           ? DateTime.parse(json['assigned_date_time']['date'])
//           : null,
//       appliedWeight: json['applied_weight']?.toDouble(),
//       companyId: json['company_id'],
//       courierName: json['courier_name'],
//       childCourierName: json['child_courier_name'],
//       freightCharges: json['freight_charges']?.toDouble(),
//       routingCode: json['routing_code'],
//       rtoRoutingCode: json['rto_routing_code'],
//       invoiceNo: json['invoice_no'],
//       transporterId: json['transporter_id'],
//       transporterName: json['transporter_name'],
//       shippedBy: json['shipped_by'] != null
//           ? ShipperDetails.fromJson(json['shipped_by'])
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'courier_company_id': courierCompanyId,
//       'awb_code': awbCode,
//       'cod': cod,
//       'order_id': orderId,
//       'shipment_id': shipmentId,
//       'awb_code_status': awbCodeStatus,
//       'assigned_date_time': {'date': assignedDateTime?.toIso8601String()},
//       'applied_weight': appliedWeight,
//       'company_id': companyId,
//       'courier_name': courierName,
//       'child_courier_name': childCourierName,
//       'freight_charges': freightCharges,
//       'routing_code': routingCode,
//       'rto_routing_code': rtoRoutingCode,
//       'invoice_no': invoiceNo,
//       'transporter_id': transporterId,
//       'transporter_name': transporterName,
//       'shipped_by': shippedBy?.toJson(),
//     };
//   }
// }

// class ShipperDetails {
//   String? shipperCompanyName;
//   String? shipperAddress1;
//   String? shipperCity;
//   String? shipperState;
//   String? shipperCountry;
//   String? shipperPostcode;
//   String? shipperPhone;
//   String? shipperEmail;
//   String? rtoCompanyName;
//   String? rtoAddress1;
//   String? rtoCity;
//   String? rtoState;
//   String? rtoCountry;
//   String? rtoPostcode;
//   String? rtoPhone;
//   String? rtoEmail;

//   ShipperDetails({
//     this.shipperCompanyName,
//     this.shipperAddress1,
//     this.shipperCity,
//     this.shipperState,
//     this.shipperCountry,
//     this.shipperPostcode,
//     this.shipperPhone,
//     this.shipperEmail,
//     this.rtoCompanyName,
//     this.rtoAddress1,
//     this.rtoCity,
//     this.rtoState,
//     this.rtoCountry,
//     this.rtoPostcode,
//     this.rtoPhone,
//     this.rtoEmail,
//   });

//   factory ShipperDetails.fromJson(Map<String, dynamic> json) {
//     return ShipperDetails(
//       shipperCompanyName: json['shipper_company_name'],
//       shipperAddress1: json['shipper_address_1'],
//       shipperCity: json['shipper_city'],
//       shipperState: json['shipper_state'],
//       shipperCountry: json['shipper_country'],
//       shipperPostcode: json['shipper_postcode'],
//       shipperPhone: json['shipper_phone'],
//       shipperEmail: json['shipper_email'],
//       rtoCompanyName: json['rto_company_name'],
//       rtoAddress1: json['rto_address_1'],
//       rtoCity: json['rto_city'],
//       rtoState: json['rto_state'],
//       rtoCountry: json['rto_country'],
//       rtoPostcode: json['rto_postcode'],
//       rtoPhone: json['rto_phone'],
//       rtoEmail: json['rto_email'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'shipper_company_name': shipperCompanyName,
//       'shipper_address_1': shipperAddress1,
//       'shipper_city': shipperCity,
//       'shipper_state': shipperState,
//       'shipper_country': shipperCountry,
//       'shipper_postcode': shipperPostcode,
//       'shipper_phone': shipperPhone,
//       'shipper_email': shipperEmail,
//       'rto_company_name': rtoCompanyName,
//       'rto_address_1': rtoAddress1,
//       'rto_city': rtoCity,
//       'rto_state': rtoState,
//       'rto_country': rtoCountry,
//       'rto_postcode': rtoPostcode,
//       'rto_phone': rtoPhone,
//       'rto_email': rtoEmail,
//     };
//   }
// }

// class PickupResponse {
//   final bool? success;
//   final String? message;
//   final String? awbCode;
//   final String? current_status;
//   final String? courier_name;
//   final PickupDetails? pickupDetails;

//   PickupResponse({
//     this.success,
//     this.message,
//     this.awbCode,
//     this.current_status,
//     this.courier_name,
//     this.pickupDetails,
//   });

//   factory PickupResponse.fromJson(Map<String, dynamic> json) {
//     return PickupResponse(
//       current_status: json['current_status'],
//       courier_name: json['courier_name'],
//       success: json['success'],
//       message: json['message'],
//       awbCode: json['awb_code'],
//       pickupDetails: json['pickupResponse'] != null
//           ? PickupDetails.fromJson(json['pickupResponse'])
//           : null,
//     );
//   }
// }

// class PickupDetails {
//   final bool? status;
//   final String? message;
//   final String? bookedDate;
//   final bool? success;

//   PickupDetails({
//     this.status,
//     this.message,
//     this.bookedDate,
//     this.success,
//   });

//   factory PickupDetails.fromJson(Map<String, dynamic> json) {
//     return PickupDetails(
//       status: json['Status'],
//       message: json['Message'],
//       bookedDate: json['Booked_date'],
//       success: json['success'],
//     );
//   }
// }

class PickupResponseModel {
  String? message;
  bool? success;
  String? awbCode;
  PickupResponse? pickupResponse;

  PickupResponseModel(
      {this.message, this.success, this.awbCode, this.pickupResponse});

  PickupResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    awbCode = json['awb_code'];
    pickupResponse = json['pickupResponse'] != null
        ? new PickupResponse.fromJson(json['pickupResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['awb_code'] = this.awbCode;
    if (this.pickupResponse != null) {
      data['pickupResponse'] = this.pickupResponse!.toJson();
    }
    return data;
  }
}

class PickupResponse {
  int? pickupStatus;
  Response? response;
  bool? success;

  PickupResponse({this.pickupStatus, this.response, this.success});

  PickupResponse.fromJson(Map<String, dynamic> json) {
    pickupStatus = json['pickup_status'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pickup_status'] = this.pickupStatus;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Response {
  String? pickupScheduledDate;
  String? pickupTokenNumber;
  int? status;
  PickupGeneratedDate? pickupGeneratedDate;
  String? data;

  Response(
      {this.pickupScheduledDate,
      this.pickupTokenNumber,
      this.status,
      this.pickupGeneratedDate,
      this.data});

  Response.fromJson(Map<String, dynamic> json) {
    pickupScheduledDate = json['pickup_scheduled_date'];
    pickupTokenNumber = json['pickup_token_number'];
    status = json['status'];
    pickupGeneratedDate = json['pickup_generated_date'] != null
        ? new PickupGeneratedDate.fromJson(json['pickup_generated_date'])
        : null;
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pickup_scheduled_date'] = this.pickupScheduledDate;
    data['pickup_token_number'] = this.pickupTokenNumber;
    data['status'] = this.status;
    if (this.pickupGeneratedDate != null) {
      data['pickup_generated_date'] = this.pickupGeneratedDate!.toJson();
    }
    data['data'] = this.data;
    return data;
  }
}

class PickupGeneratedDate {
  String? date;
  int? timezoneType;
  String? timezone;

  PickupGeneratedDate({this.date, this.timezoneType, this.timezone});

  PickupGeneratedDate.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['timezone_type'] = this.timezoneType;
    data['timezone'] = this.timezone;
    return data;
  }
}
