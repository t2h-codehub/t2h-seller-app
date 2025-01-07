import 'package:swapnil_s_application4/data/PaymentGatewayModel/merchantPaymentApiResModel.dart';

class PaymentResponse {
  final MerchantPaymentAPIResModel? model;
  final int? statusCode;

  PaymentResponse({this.model, this.statusCode});
}