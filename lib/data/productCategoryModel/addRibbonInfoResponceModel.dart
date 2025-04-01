class AddCustomRibbonInfo {
  List<CustomRibbonInfo>? customRibbonInfo;

  AddCustomRibbonInfo({this.customRibbonInfo});

  AddCustomRibbonInfo.fromJson(Map<String, dynamic> json) {
    if (json['customRibbonInfo'] != null) {
      customRibbonInfo = <CustomRibbonInfo>[];
      json['customRibbonInfo'].forEach((v) {
        customRibbonInfo!.add(new CustomRibbonInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customRibbonInfo != null) {
      data['customRibbonInfo'] =
          this.customRibbonInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomRibbonInfo {
  String? title;
  String? order;

  CustomRibbonInfo({this.title, this.order});

  CustomRibbonInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['order'] = this.order;
    return data;
  }
}
