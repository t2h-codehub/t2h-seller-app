// To parse this JSON data, do
//
//     final otpResponse = otpResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'send_otp.freezed.dart';
part 'send_otp.g.dart';

OtpResponse otpResponseFromJson(String str) =>
    OtpResponse.fromJson(json.decode(str));

String otpResponseToJson(OtpResponse data) => json.encode(data.toJson());

@freezed
class OtpResponse with _$OtpResponse {
  const factory OtpResponse({
    String? message,
  }) = _OtpResponse;

  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);
}

OtpRequest otpRequestFromJson(String str) =>
    OtpRequest.fromJson(json.decode(str));

String otpRequestToJson(OtpRequest data) => json.encode(data.toJson());

@freezed
class OtpRequest with _$OtpRequest {
  const factory OtpRequest({
    String? mobile,
  }) = _OtpRequest;

  factory OtpRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestFromJson(json);
}
