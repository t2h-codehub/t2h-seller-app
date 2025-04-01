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
        productStatus!.add(ProductStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merchant_id'] = merchantId;
    data['created_at'] = createdAt;
    data['merchant_name'] = merchantName;
    data['merchant_email'] = merchantEmail;
    data['onboarding_status'] = onboardingStatus;
    if (productStatus != null) {
      data['product_status'] =
          productStatus!.map((v) => v.toJson()).toList();
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
        ? MetaData.fromJson(json['meta_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['product_min_kyc_status'] = productMinKycStatus;
    data['product_full_kyc_status'] = productFullKycStatus;
    data['activation_status'] = activationStatus;
    if (metaData != null) {
      data['meta_data'] = metaData!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_access'] = transactionAccess;
    return data;
  }
}
