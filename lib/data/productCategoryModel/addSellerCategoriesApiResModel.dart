class AddSellerCategoriesApiResModel {
  String? message;
  bool? success;

  AddSellerCategoriesApiResModel({this.message, this.success});

  AddSellerCategoriesApiResModel.fromJson(Map<String, dynamic> json) {
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
