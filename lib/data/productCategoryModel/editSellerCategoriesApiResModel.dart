class EditSellerCategoriesApiResModel {
  String? message;
  bool? success;

  EditSellerCategoriesApiResModel({this.message, this.success});

  EditSellerCategoriesApiResModel.fromJson(Map<String, dynamic> json) {
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
