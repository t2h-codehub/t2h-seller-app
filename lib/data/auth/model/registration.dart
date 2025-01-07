// To parse this JSON data, do
//
//     final reqistrationRequest = reqistrationRequestFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'registration.freezed.dart';
part 'registration.g.dart';

ReqistrationRequest reqistrationRequestFromJson(String str) =>
    ReqistrationRequest.fromJson(json.decode(str));

String reqistrationRequestToJson(ReqistrationRequest data) =>
    json.encode(data.toJson());

@freezed
class ReqistrationRequest with _$ReqistrationRequest {
  const factory ReqistrationRequest({
    String? name,
    String? email,
    String? phone,
    String? fcm,
    String? password,
  }) = _ReqistrationRequest;

  factory ReqistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$ReqistrationRequestFromJson(json);
}

ReqistrationResponse reqistrationResponseFromJson(String str) =>
    ReqistrationResponse.fromJson(json.decode(str));

String reqistrationResponseToJson(ReqistrationResponse data) =>
    json.encode(data.toJson());

@freezed
class ReqistrationResponse with _$ReqistrationResponse {
  const factory ReqistrationResponse({
    String? message,
    String? token,
    @JsonKey(name: "User") User? user,
    bool? success,
  }) = _ReqistrationResponse;

  factory ReqistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$ReqistrationResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    String? name,
    String? email,
    String? phone,
    String? id,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
