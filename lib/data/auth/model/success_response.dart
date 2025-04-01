// To parse this JSON data, do
//
//     final successResponse = successResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'success_response.freezed.dart';
part 'success_response.g.dart';

SuccessResponse successResponseFromJson(String str) =>
    SuccessResponse.fromJson(json.decode(str));

String successResponseToJson(SuccessResponse data) =>
    json.encode(data.toJson());

@freezed
class SuccessResponse with _$SuccessResponse {
  const factory SuccessResponse({
    String? message,
    bool? success,
  }) = _SuccessResponse;

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponseFromJson(json);
}
