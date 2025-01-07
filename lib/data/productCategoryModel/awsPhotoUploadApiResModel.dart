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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['fileUrl'] = this.fileUrl;
    return data;
  }
}
