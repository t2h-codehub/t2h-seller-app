class MerchantStatusApiResModel {
  String? merchantId;
  String? createdAt;
  String? merchantName;
  String? merchantEmail;
  String? onboardingStatus;
  List<ProductStatus>? productStatus;

  MerchantStatusApiResModel(
      {this.merchantId,
        this.createdAt,
        this.merchantName,
        this.merchantEmail,
        this.onboardingStatus,
        this.productStatus});

  MerchantStatusApiResModel.fromJson(Map<String, dynamic> json) {
    merchantId = json['merchant_id'];
    createdAt = json['created_at'];
    merchantName = json['merchant_name'];
    merchantEmail = json['merchant_email'];
    onboardingStatus = json['onboarding_status'];
    if (json['product_status'] != null) {
      productStatus = <ProductStatus>[];
      json['product_status'].forEach((v) {
        productStatus!.add(new ProductStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merchant_id'] = this.merchantId;
    data['created_at'] = this.createdAt;
    data['merchant_name'] = this.merchantName;
    data['merchant_email'] = this.merchantEmail;
    data['onboarding_status'] = this.onboardingStatus;
    if (this.productStatus != null) {
      data['product_status'] =
          this.productStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductStatus {
  String? productName;
  String? productMinKycStatus;
  String? productFullKycStatus;
  String? activationStatus;
  MetaData? metaData;

  ProductStatus(
      {this.productName,
        this.productMinKycStatus,
        this.productFullKycStatus,
        this.activationStatus,
        this.metaData});

  ProductStatus.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productMinKycStatus = json['product_min_kyc_status'];
    productFullKycStatus = json['product_full_kyc_status'];
    activationStatus = json['activation_status'];
    metaData = json['meta_data'] != null
        ? new MetaData.fromJson(json['meta_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['product_min_kyc_status'] = this.productMinKycStatus;
    data['product_full_kyc_status'] = this.productFullKycStatus;
    data['activation_status'] = this.activationStatus;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData!.toJson();
    }
    return data;
  }
}

class MetaData {
  String? transactionAccess;

  MetaData({this.transactionAccess});

  MetaData.fromJson(Map<String, dynamic> json) {
    transactionAccess = json['transaction_access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_access'] = this.transactionAccess;
    return data;
  }
}
