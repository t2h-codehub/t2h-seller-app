class DeliverypickuplocationApiResModel {
  String? message;
  bool? success;
  List<PickupLocation>? pickupLocations;

  DeliverypickuplocationApiResModel({this.message, this.success, this.pickupLocations});

  DeliverypickuplocationApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['pickupLocations'] != null) {
      pickupLocations = (json['pickupLocations'] as List)
          .map((e) => PickupLocation.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    if (pickupLocations != null) {
      data['pickupLocations'] = pickupLocations!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class PickupLocation {
  String? pinCode;
  String? pickupLocation;

  PickupLocation({this.pinCode, this.pickupLocation});

  PickupLocation.fromJson(Map<String, dynamic> json) {
    pinCode = json['pin_code'];
    pickupLocation = json['pickup_location'];
  }

  Map<String, dynamic> toJson() {
    return {
      'pin_code': pinCode,
      'pickup_location': pickupLocation,
    };
  }
}
