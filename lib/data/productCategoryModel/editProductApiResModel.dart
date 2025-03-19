class EditProductDetailsApiResModel {
  String? message;
  bool? success;

  EditProductDetailsApiResModel({this.message, this.success});

  EditProductDetailsApiResModel.fromJson(Map<String, dynamic> json) {
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
