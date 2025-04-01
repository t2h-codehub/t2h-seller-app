class GetAllActivePoliciesResponceModel {
  String? message;
   bool? success;
  List<Policies>? policies;

  GetAllActivePoliciesResponceModel({this.message, this.policies});

  GetAllActivePoliciesResponceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['policies'] != null) {
      policies = <Policies>[];
      json['policies'].forEach((v) {
        policies!.add(new Policies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.policies != null) {
      data['policies'] = this.policies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Policies {
  String? sId;
  String? policyType;
  String? policyDescription;
  String? policyHeader;
  String? status;

  Policies(
      {this.sId,
      this.policyType,
      this.policyDescription,
      this.policyHeader,
      this.status});

  Policies.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    policyType = json['policy_type'];
    policyDescription = json['policy_description'];
    policyHeader = json['policy_header'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['policy_type'] = this.policyType;
    data['policy_description'] = this.policyDescription;
    data['policy_header'] = this.policyHeader;
    data['status'] = this.status;
    return data;
  }
}
