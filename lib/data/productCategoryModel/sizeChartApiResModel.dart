class SizeChartApiResModel {
  String? message;
  List<Data>? data;
  bool? success;

  SizeChartApiResModel({this.message, this.data, this.success});

  SizeChartApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? sId;
  String? category;
  String? gender;
  List<Images>? images;

  Data({this.sId, this.category, this.gender, this.images});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    gender = json['gender'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category'] = this.category;
    data['gender'] = this.gender;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? url;
  String? metrics;

  Images({this.url, this.metrics});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    metrics = json['metrics'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['metrics'] = this.metrics;
    return data;
  }
}
