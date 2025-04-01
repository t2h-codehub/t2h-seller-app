class DeleteAttributesApiResModel {
  String? message;
  bool? success;

  DeleteAttributesApiResModel({this.message, this.success});

  DeleteAttributesApiResModel.fromJson(Map<String, dynamic> json) {
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
