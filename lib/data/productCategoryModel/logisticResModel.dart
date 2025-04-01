class ChangeLogisticApiResModel {
  String? message;
  bool? success;
  String? logisticId;
  String? token;

  ChangeLogisticApiResModel({this.message, this.success, this.logisticId, this.token});

  ChangeLogisticApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    logisticId = json['Logistic_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    data['Logistic_id'] = logisticId;
    data['token'] = token;
    return data;
  }
}
