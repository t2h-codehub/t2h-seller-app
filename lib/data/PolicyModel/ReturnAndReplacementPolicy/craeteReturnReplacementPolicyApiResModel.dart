class CreateReturnAndReplacementPolicyApiResModel {
  String? message;
  bool? success;

  CreateReturnAndReplacementPolicyApiResModel({this.message, this.success});

  CreateReturnAndReplacementPolicyApiResModel.fromJson(
      Map<String, dynamic> json) {
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
