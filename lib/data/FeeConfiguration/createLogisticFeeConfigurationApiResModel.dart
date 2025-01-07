class CreateLogisticFeeConfiguration {
  String? message;
  bool? success;

  CreateLogisticFeeConfiguration({this.message, this.success});

  CreateLogisticFeeConfiguration.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}
