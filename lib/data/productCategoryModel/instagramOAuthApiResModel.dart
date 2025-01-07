class InstagramAuthResModel {
  List<Data>? data;
  Paging? paging;

  InstagramAuthResModel({this.data, this.paging});

  InstagramAuthResModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    paging =
    json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? caption;
  String? mediaUrl;
  String? thumbnailUrl;

  Data({this.id, this.caption, this.mediaUrl, this.thumbnailUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    mediaUrl = json['media_url'];
    thumbnailUrl = json['thumbnail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['caption'] = this.caption;
    data['media_url'] = this.mediaUrl;
    data['thumbnail_url'] = this.thumbnailUrl;
    return data;
  }
}

class Paging {
  Cursors? cursors;
  String? next;

  Paging({this.cursors, this.next});

  Paging.fromJson(Map<String, dynamic> json) {
    cursors =
    json['cursors'] != null ? new Cursors.fromJson(json['cursors']) : null;
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cursors != null) {
      data['cursors'] = this.cursors!.toJson();
    }
    data['next'] = this.next;
    return data;
  }
}

class Cursors {
  String? before;
  String? after;

  Cursors({this.before, this.after});

  Cursors.fromJson(Map<String, dynamic> json) {
    before = json['before'];
    after = json['after'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['before'] = this.before;
    data['after'] = this.after;
    return data;
  }
}
