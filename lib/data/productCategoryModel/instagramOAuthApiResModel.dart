class InstagramAuthResModel {
  List<Data>? data;
  Paging? paging;

  InstagramAuthResModel({this.data, this.paging});

  InstagramAuthResModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    paging =
    json['paging'] != null ? Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (paging != null) {
      data['paging'] = paging!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['caption'] = caption;
    data['media_url'] = mediaUrl;
    data['thumbnail_url'] = thumbnailUrl;
    return data;
  }
}

class Paging {
  Cursors? cursors;
  String? next;

  Paging({this.cursors, this.next});

  Paging.fromJson(Map<String, dynamic> json) {
    cursors =
    json['cursors'] != null ? Cursors.fromJson(json['cursors']) : null;
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cursors != null) {
      data['cursors'] = cursors!.toJson();
    }
    data['next'] = next;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['before'] = before;
    data['after'] = after;
    return data;
  }
}
