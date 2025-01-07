import 'package:swapnil_s_application4/data/Orders/errorOrderDetailsApiResModel.dart';
import 'package:swapnil_s_application4/data/Orders/newOrderDetailsApiResModel.dart';

class OrderDetailsReviewModelAndStatusCode {
  final Order? newOrderDetailsApiResModel;
  final ErrorOrderDetailsApiResModel? errorOrderDetailsApiResModel;
  final int? statusCode;

  OrderDetailsReviewModelAndStatusCode({
    this.newOrderDetailsApiResModel,
    this.errorOrderDetailsApiResModel,
    this.statusCode,
  });
}
