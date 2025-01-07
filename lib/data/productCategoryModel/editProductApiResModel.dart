class EditProductDetailsApiResModel {
  String? message;
  bool? success;

  EditProductDetailsApiResModel({this.message, this.success});

  EditProductDetailsApiResModel.fromJson(Map<String, dynamic> json) {
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
