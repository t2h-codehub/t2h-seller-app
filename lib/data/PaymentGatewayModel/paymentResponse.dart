import 'package:taptohello/data/PaymentGatewayModel/merchantPaymentApiResModel.dart';

class PaymentResponse {
  final MerchantPaymentAPIResModel? model;
  final int? statusCode;

  PaymentResponse({this.model, this.statusCode});
}