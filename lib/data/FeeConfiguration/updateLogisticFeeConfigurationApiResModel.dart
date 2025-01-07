class UpdateLogisticFeeConfiguration {
  String? message;
  bool? success;
  Data? data;

  UpdateLogisticFeeConfiguration({this.message, this.success, this.data});

  UpdateLogisticFeeConfiguration.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  int? status;
  int? type;
  String? feeValue;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.userId,
        this.status,
        this.type,
        this.feeValue,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    status = json['status'];
    type = json['type'];
    feeValue = json['feeValue'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['status'] = this.status;
    data['type'] = this.type;
    data['feeValue'] = this.feeValue;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
