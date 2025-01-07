class PaymentOnboardingApiResModel {
  String? createdAt;
  String? expiresAt;
  String? onboardingLink;

  PaymentOnboardingApiResModel(
      {this.createdAt, this.expiresAt, this.onboardingLink});

  PaymentOnboardingApiResModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    expiresAt = json['expires_at'];
    onboardingLink = json['onboarding_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['expires_at'] = this.expiresAt;
    data['onboarding_link'] = this.onboardingLink;
    return data;
  }
}
