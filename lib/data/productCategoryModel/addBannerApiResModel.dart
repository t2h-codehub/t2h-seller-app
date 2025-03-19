class BannerGetResponseModel {
  bool? success;
  String? message;
  int? count;
  List<Data>? data;

  BannerGetResponseModel({this.success, this.message, this.count, this.data});

  BannerGetResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  List<Banners>? banners;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.userId,
      this.banners,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

// class Banners {
//   String? link;
//   String? title;
//   int? order;
//   String? status;
//   String? bannerImage;
//   String? sId;
//   bool isDeleted; 

//   Banners(
//       {this.link,
//       this.title,
//       this.order,
//       this.status,
//       this.bannerImage,
//       this.sId, 
//       this.isDeleted = false});

//   Banners.fromJson(Map<String, dynamic> json) {
//     link = json['link'];
//     title = json['title'];
//     order = json['order'];
//     status = json['status'];
//     bannerImage = json['banner_image'];
//     sId = json['_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['link'] = this.link;
//     data['title'] = this.title;
//     data['order'] = this.order;
//     data['status'] = this.status;
//     data['banner_image'] = this.bannerImage;
//     data['_id'] = this.sId;
//     return data;
//   }
// }

class Banners {
  String? link;
  String? title;
  int? order;
  String? status;
  String? bannerImage;
  String? sId;
  bool? isDeleted;  // isDeleted flag added

  Banners({
    this.link,
    this.title,
    this.order,
    this.status,
    this.bannerImage,
    this.sId,
    this.isDeleted = false,  // Default value for isDeleted
  });

  // Deserialize from JSON
  Banners.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
    order = json['order'];
    status = json['status'];
    bannerImage = json['banner_image'];
    sId = json['_id'];
    isDeleted = json['isDeleted'] ?? false;  // Read the isDeleted flag from JSON
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['title'] = this.title;
    data['order'] = this.order;
    data['status'] = this.status;
    data['banner_image'] = this.bannerImage;
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;  // Add isDeleted to the JSON
    return data;
  }
}

