class InsertBillingApiResModel {
  String? message;
  bool? success;

  InsertBillingApiResModel({this.message, this.success});

  InsertBillingApiResModel.fromJson(Map<String, dynamic> json) {
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
