import 'package:taptohello/data/Orders/errorOrderDetailsApiResModel.dart';
import 'package:taptohello/data/Orders/newOrderDetailsApiResModel.dart';

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
