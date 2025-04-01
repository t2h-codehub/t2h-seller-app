// To parse this JSON data, do
//
//     final otpVerifyRequest = otpVerifyRequestFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'otp_verify.freezed.dart';
part 'otp_verify.g.dart';

OtpVerifyRequest otpVerifyRequestFromJson(String str) =>
    OtpVerifyRequest.fromJson(json.decode(str));

String otpVerifyRequestToJson(OtpVerifyRequest data) =>
    json.encode(data.toJson());

@freezed
class OtpVerifyRequest with _$OtpVerifyRequest {
  const factory OtpVerifyRequest({
    int? otp,
    @JsonKey(name: "user_number") String? userNumber,
    @JsonKey(name: "auth_key", defaultValue: "") String? authKey,
  }) = _OtpVerifyRequest;

  factory OtpVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyRequestFromJson(json);
}

OtpVerifyResponse otpVerifyResponseFromJson(String str) =>
    OtpVerifyResponse.fromJson(json.decode(str));

String otpVerifyResponseToJson(OtpVerifyResponse data) =>
    json.encode(data.toJson());

@freezed
class OtpVerifyResponse with _$OtpVerifyResponse {
  const factory OtpVerifyResponse({
    String? message,
    bool? success,
    @JsonKey(name: "User") User? user,
    String? token,
  }) = _OtpVerifyResponse;

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "id") String? id,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
