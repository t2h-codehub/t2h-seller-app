// class ShipmentResponse {
//   String? message;
//   bool? success;
//   int? shipmentId;
//   CourierServiceResponse? courierServiceResponse;

//   ShipmentResponse({
//     this.message,
//     this.success,
//     this.shipmentId,
//     this.courierServiceResponse,
//   });

//   ShipmentResponse.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     success = json['success'];
//     shipmentId = json['shipment_id'];
//     courierServiceResponse = json['courierServiceResponse'] != null
//         ? CourierServiceResponse.fromJson(json['courierServiceResponse'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'success': success,
//       'shipment_id': shipmentId,
//       'courierServiceResponse': courierServiceResponse?.toJson(),
//     };
//   }
// }

// class CourierServiceResponse {
//   bool? companyAutoShipmentInsuranceSetting;
//   CovidZones? covidZones;
//   String? currency;
//   CourierData? data;
//   int? dgCourier;
//   int? eligibleForInsurance;
//   bool? insuranceOptedAtOrderCreation;
//   bool? isAllowTemplatizedPricing;
//   int? isLatlong;
//   bool? isOldZoneOpted;
//   bool? isZoneFromMongo;
//   int? labelGenerateType;
//   int? onNewZone;
//   List<dynamic>? sellerAddress;
//   int? status;
//   bool? userInsuranceMandatory;

//   CourierServiceResponse({
//     this.companyAutoShipmentInsuranceSetting,
//     this.covidZones,
//     this.currency,
//     this.data,
//     this.dgCourier,
//     this.eligibleForInsurance,
//     this.insuranceOptedAtOrderCreation,
//     this.isAllowTemplatizedPricing,
//     this.isLatlong,
//     this.isOldZoneOpted,
//     this.isZoneFromMongo,
//     this.labelGenerateType,
//     this.onNewZone,
//     this.sellerAddress,
//     this.status,
//     this.userInsuranceMandatory,
//   });

//   CourierServiceResponse.fromJson(Map<String, dynamic> json) {
//     companyAutoShipmentInsuranceSetting =
//         json['company_auto_shipment_insurance_setting'];
//     covidZones = json['covid_zones'] != null
//         ? CovidZones.fromJson(json['covid_zones'])
//         : null;
//     currency = json['currency'];
//     data = json['data'] != null ? CourierData.fromJson(json['data']) : null;
//     dgCourier = json['dg_courier'];
//     eligibleForInsurance = json['eligible_for_insurance'];
//     insuranceOptedAtOrderCreation = json['insurace_opted_at_order_creation'];
//     isAllowTemplatizedPricing = json['is_allow_templatized_pricing'];
//     isLatlong = json['is_latlong'];
//     isOldZoneOpted = json['is_old_zone_opted'];
//     isZoneFromMongo = json['is_zone_from_mongo'];
//     labelGenerateType = json['label_generate_type'];
//     onNewZone = json['on_new_zone'];
//     sellerAddress = json['seller_address'];
//     status = json['status'];
//     userInsuranceMandatory = json['user_insurance_manadatory'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'company_auto_shipment_insurance_setting':
//           companyAutoShipmentInsuranceSetting,
//       'covid_zones': covidZones?.toJson(),
//       'currency': currency,
//       'data': data?.toJson(),
//       'dg_courier': dgCourier,
//       'eligible_for_insurance': eligibleForInsurance,
//       'insurace_opted_at_order_creation': insuranceOptedAtOrderCreation,
//       'is_allow_templatized_pricing': isAllowTemplatizedPricing,
//       'is_latlong': isLatlong,
//       'is_old_zone_opted': isOldZoneOpted,
//       'is_zone_from_mongo': isZoneFromMongo,
//       'label_generate_type': labelGenerateType,
//       'on_new_zone': onNewZone,
//       'seller_address': sellerAddress,
//       'status': status,
//       'user_insurance_manadatory': userInsuranceMandatory,
//     };
//   }
// }

// class CovidZones {
//   String? deliveryZone;
//   String? pickupZone;

//   CovidZones({this.deliveryZone, this.pickupZone});

//   CovidZones.fromJson(Map<String, dynamic> json) {
//     deliveryZone = json['delivery_zone'];
//     pickupZone = json['pickup_zone'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'delivery_zone': deliveryZone,
//       'pickup_zone': pickupZone,
//     };
//   }
// }

// class CourierData {
//   List<CourierCompany>? availableCourierCompanies;
//   int? childCourierId;
//   int? isRecommendationEnabled;
//   int? promiseRecommendedCourierCompanyId;
//   int? recommendationAdvanceRule;
//   RecommendedBy? recommendedBy;
//   int? recommendedCourierCompanyId;
//   int? shiprocketRecommendedCourierId;

//   CourierData({
//     this.availableCourierCompanies,
//     this.childCourierId,
//     this.isRecommendationEnabled,
//     this.promiseRecommendedCourierCompanyId,
//     this.recommendationAdvanceRule,
//     this.recommendedBy,
//     this.recommendedCourierCompanyId,
//     this.shiprocketRecommendedCourierId,
//   });

//   CourierData.fromJson(Map<String, dynamic> json) {
//     if (json['available_courier_companies'] != null) {
//       availableCourierCompanies = (json['available_courier_companies'] as List)
//           .map((e) => CourierCompany.fromJson(e))
//           .toList();
//     }
//     childCourierId = json['child_courier_id'];
//     isRecommendationEnabled = json['is_recommendation_enabled'];
//     promiseRecommendedCourierCompanyId =
//         json['promise_recommended_courier_company_id'];
//     recommendationAdvanceRule = json['recommendation_advance_rule'];
//     recommendedBy = json['recommended_by'] != null
//         ? RecommendedBy.fromJson(json['recommended_by'])
//         : null;
//     recommendedCourierCompanyId = json['recommended_courier_company_id'];
//     shiprocketRecommendedCourierId = json['shiprocket_recommended_courier_id'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'available_courier_companies':
//           availableCourierCompanies?.map((e) => e.toJson()).toList(),
//       'child_courier_id': childCourierId,
//       'is_recommendation_enabled': isRecommendationEnabled,
//       'promise_recommended_courier_company_id':
//           promiseRecommendedCourierCompanyId,
//       'recommendation_advance_rule': recommendationAdvanceRule,
//       'recommended_by': recommendedBy?.toJson(),
//       'recommended_courier_company_id': recommendedCourierCompanyId,
//       'shiprocket_recommended_courier_id': shiprocketRecommendedCourierId,
//     };
//   }
// }

// class CourierCompany {
//   int? courierCompanyId;
//   String? courierName;
//   String? city;
//   String? state;
//   double? freightCharge;
//   double? rtoCharges;
//   int? estimatedDeliveryDays;
//   String? etd;
//   double? rating;

//   CourierCompany({
//     this.courierCompanyId,
//     this.courierName,
//     this.city,
//     this.state,
//     this.freightCharge,
//     this.rtoCharges,
//     this.estimatedDeliveryDays,
//     this.etd,
//     this.rating,
//   });

//   CourierCompany.fromJson(Map<String, dynamic> json) {
//     courierCompanyId = json['courier_company_id'];
//     courierName = json['courier_name'];
//     city = json['city'];
//     state = json['state'];
//     freightCharge = (json['freight_charge'] ?? 0).toDouble();
//     rtoCharges = (json['rto_charges'] ?? 0).toDouble();
//     estimatedDeliveryDays =
//         int.tryParse(json['estimated_delivery_days'] ?? "0");
//     etd = json['etd'];
//     rating = (json['rating'] ?? 0).toDouble();
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'courier_company_id': courierCompanyId,
//       'courier_name': courierName,
//       'city': city,
//       'state': state,
//       'freight_charge': freightCharge,
//       'rto_charges': rtoCharges,
//       'estimated_delivery_days': estimatedDeliveryDays,
//       'etd': etd,
//       'rating': rating,
//     };
//   }
// }

// class RecommendedBy {
//   int? id;
//   String? title;

//   RecommendedBy({this.id, this.title});

//   RecommendedBy.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//     };
//   }
// }


import 'dart:convert';

class ShipmentResponse {
  final String? message; // Nullable type
  final bool? success; // Nullable type
  final int? shipmentId; // Nullable type
  final CourierServiceResponse? courierServiceResponse; // Nullable type

  ShipmentResponse({
    this.message,
    this.success,
    this.shipmentId,
    this.courierServiceResponse,
  });

  factory ShipmentResponse.fromJson(Map<String, dynamic> json) {
    return ShipmentResponse(
      message: json['message'],
      success: json['success'],
      shipmentId: json['shipment_id'],
      courierServiceResponse: json['courierServiceResponse'] != null
          ? CourierServiceResponse.fromJson(json['courierServiceResponse'])
          : null,
    );
  }
}

class CourierServiceResponse {
  final bool? companyAutoShipmentInsuranceSetting; // Nullable type
  final CovidZones? covidZones; // Nullable type
  final String? currency; // Nullable type
  final CourierData? data; // Nullable type

  CourierServiceResponse({
    this.companyAutoShipmentInsuranceSetting,
    this.covidZones,
    this.currency,
    this.data,
  });

  factory CourierServiceResponse.fromJson(Map<String, dynamic> json) {
    return CourierServiceResponse(
      companyAutoShipmentInsuranceSetting:
          json['company_auto_shipment_insurance_setting'],
      covidZones: json['covid_zones'] != null
          ? CovidZones.fromJson(json['covid_zones'])
          : null,
      currency: json['currency'],
      data: json['data'] != null ? CourierData.fromJson(json['data']) : null,
    );
  }
}

class CovidZones {
  final dynamic deliveryZone;
  final dynamic pickupZone;

  CovidZones({this.deliveryZone, this.pickupZone});

  factory CovidZones.fromJson(Map<String, dynamic> json) {
    return CovidZones(
      deliveryZone: json['delivery_zone'],
      pickupZone: json['pickup_zone'],
    );
  }
}

class CourierData {
  final List<CourierCompany>? availableCourierCompanies; // Nullable list
  final int? recommendedCourierCompanyId; // Nullable type

  CourierData({
    this.availableCourierCompanies,
    this.recommendedCourierCompanyId,
  });

  factory CourierData.fromJson(Map<String, dynamic> json) {
    return CourierData(
      availableCourierCompanies: json['available_courier_companies'] != null
          ? (json['available_courier_companies'] as List)
              .map((e) => CourierCompany.fromJson(e))
              .toList()
          : null,
      recommendedCourierCompanyId: json['recommended_courier_company_id'],
    );
  }
}

class CourierCompany {
  final String? courierName;
  final int? courierCompanyId;
  final String? state;
  final String? city;
  final double? rate;
  final String? estimatedDeliveryDays;
  final String? etd;
  final bool? isSurface;
  final double? freightCharge; // Add this if it's part of the response
  final double? rating; // Add this if it's part of the response

  CourierCompany({
    this.courierName,
    this.courierCompanyId,
    this.state,
    this.city,
    this.rate,
    this.estimatedDeliveryDays,
    this.etd,
    this.isSurface,
    this.freightCharge,
    this.rating,
  });

  // Define the toJson method
  Map<String, dynamic> toJson() {
    return {
      'courier_name': courierName,
      'courier_company_id': courierCompanyId,
      'state': state,
      'city': city,
      'rate': rate,
      'estimated_delivery_days': estimatedDeliveryDays,
      'etd': etd,
      'is_surface': isSurface,
      'freight_charge': freightCharge, // Include this if exists
      'rating': rating, // Include this if exists
    };
  }

  factory CourierCompany.fromJson(Map<String, dynamic> json) {
    return CourierCompany(
      courierName: json['courier_name'],
      courierCompanyId: json['courier_company_id'],
      state: json['state'],
      city: json['city'],
      rate: (json['rate'] as num?)?.toDouble(),
      estimatedDeliveryDays: json['estimated_delivery_days'],
      etd: json['etd'],
      isSurface: json['is_surface'],
      freightCharge: (json['freight_charge'] as num?)?.toDouble(), // Add this if exists
      rating: (json['rating'] as num?)?.toDouble(), // Add this if exists
    );
  }
}


