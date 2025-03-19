class InsertBillingApiResModel {
  String? message;
  bool? success;

  InsertBillingApiResModel({this.message, this.success});

  InsertBillingApiResModel.fromJson(Map<String, dynamic> json) {
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
