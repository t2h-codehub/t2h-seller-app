// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target, duplicate_ignore

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'login.freezed.dart';
part 'login.g.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    String? message,
    String? token,

    // ignore: invalid_annotation_target
    @JsonKey(name: "User") User? user,
    bool? success,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    String? name,
    String? email,
    String? phone,
    String? id,
    String? lang,
    String? qrCode,
    bool? isMobileVerified,
    String? coverVideo,
    String? profileImg,
    List<Service>? services,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    String? service,
    String? title,
    String? content,
    String? type,
    String? logo,
    @JsonKey(name: "_id") String? id,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    String? phone,
    String? email,
    String? fcm,
    String? password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}
