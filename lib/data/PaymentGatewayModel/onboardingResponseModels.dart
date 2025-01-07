import 'package:swapnil_s_application4/data/PaymentGatewayModel/onboardingApiResModel.dart';

class OnboardingResponseModel {
  final PaymentOnboardingApiResModel? model;
  final int? statusCode;

  OnboardingResponseModel({
    this.model,
    this.statusCode,
  });
}
