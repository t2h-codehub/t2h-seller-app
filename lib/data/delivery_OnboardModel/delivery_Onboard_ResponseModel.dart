class DeliveryOnboardApiResModel {
  String? message;
  bool? success;

  DeliveryOnboardApiResModel({this.message, this.success});

  DeliveryOnboardApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    return data;
  }
}
