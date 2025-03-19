// To parse this JSON data, do
//
//     final updateUserRequest = updateUserRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'update_user.freezed.dart';
part 'update_user.g.dart';

UpdateUserRequest updateUserRequestFromJson(String str) =>
    UpdateUserRequest.fromJson(json.decode(str));

String updateUserRequestToJson(UpdateUserRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdateUserRequest with _$UpdateUserRequest {
  const factory UpdateUserRequest({
    String? name,
    String? bio,
    String? designation,
    String? profileImg,
    String? coverVideo,
    String? phone,
    String? companyName,
    String? lang,
  }) = _UpdateUserRequest;

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);
}
// To parse this JSON data, do
//
//     final updateUserResponse = updateUserResponseFromJson(jsonString);

UpdateUserResponse updateUserResponseFromJson(String str) =>
    UpdateUserResponse.fromJson(json.decode(str));

String updateUserResponseToJson(UpdateUserResponse data) =>
    json.encode(data.toJson());

@freezed
class UpdateUserResponse with _$UpdateUserResponse {
  const factory UpdateUserResponse({
    String? message,
    bool? success,
  }) = _UpdateUserResponse;

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);
}
// To parse this JSON data, do
//
//     final updateUserRequest = updateUserRequestFromJson(jsonString);

UpdateUserQrRequest updateUserQrRequestFromJson(String str) =>
    UpdateUserQrRequest.fromJson(json.decode(str));

String updateUserQrRequestToJson(UpdateUserRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdateUserQrRequest with _$UpdateUserQrRequest {
  const factory UpdateUserQrRequest({
    String? qrCode,
  }) = _UpdateUserQrRequest;

  factory UpdateUserQrRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserQrRequestFromJson(json);
}
// To parse this JSON data, do
//
//     final updateUserResponse = updateUserResponseFromJson(jsonString);

UpdateUserQrResponse updateUserQrResponseFromJson(String str) =>
    UpdateUserQrResponse.fromJson(json.decode(str));

String updateUserQrResponseToJson(UpdateUserResponse data) =>
    json.encode(data.toJson());

@freezed
class UpdateUserQrResponse with _$UpdateUserQrResponse {
  const factory UpdateUserQrResponse({
    String? message,
    bool? success,
  }) = _UpdateUserQrResponse;

  factory UpdateUserQrResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserQrResponseFromJson(json);
}
