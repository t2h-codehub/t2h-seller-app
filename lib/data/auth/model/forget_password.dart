// To parse this JSON data, do
//
//     final forgetPasswordRequest = forgetPasswordRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'forget_password.freezed.dart';
part 'forget_password.g.dart';

ForgetPasswordRequest forgetPasswordRequestFromJson(String str) =>
    ForgetPasswordRequest.fromJson(json.decode(str));

String forgetPasswordRequestToJson(ForgetPasswordRequest data) =>
    json.encode(data.toJson());

@freezed
class ForgetPasswordRequest with _$ForgetPasswordRequest {
  const factory ForgetPasswordRequest({
    String? mobile,
  }) = _ForgetPasswordRequest;

  factory ForgetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestFromJson(json);
}

ForgetPasswordResponse forgetPasswordResponseFromJson(String str) =>
    ForgetPasswordResponse.fromJson(json.decode(str));

String forgetPasswordResponseToJson(ForgetPasswordResponse data) =>
    json.encode(data.toJson());

@freezed
class ForgetPasswordResponse with _$ForgetPasswordResponse {
  const factory ForgetPasswordResponse({
    String? userId,
  }) = _ForgetPasswordResponse;

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);
}
