class AWSFileUploadApiResModel {
  String? message;
  bool? success;
  String? fileUrl;

  AWSFileUploadApiResModel({this.message, this.success, this.fileUrl});

  AWSFileUploadApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    data['fileUrl'] = fileUrl;
    return data;
  }
}
