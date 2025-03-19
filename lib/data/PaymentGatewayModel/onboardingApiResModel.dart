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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['expires_at'] = expiresAt;
    data['onboarding_link'] = onboardingLink;
    return data;
  }
}
