// To parse this JSON data, do
//
//     final changeThemeRequest = changeThemeRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'change_theme.freezed.dart';
part 'change_theme.g.dart';

ChangeThemeRequest changeThemeRequestFromJson(String str) =>
    ChangeThemeRequest.fromJson(json.decode(str));

String changeThemeRequestToJson(ChangeThemeRequest data) =>
    json.encode(data.toJson());

@freezed
class ChangeThemeRequest with _$ChangeThemeRequest {
  const factory ChangeThemeRequest({
    int? index,
  }) = _ChangeThemeRequest;

  factory ChangeThemeRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeThemeRequestFromJson(json);
}

ChangeThemeResponse changeThemeResponseFromJson(String str) =>
    ChangeThemeResponse.fromJson(json.decode(str));

String changeThemeResponseToJson(ChangeThemeResponse data) =>
    json.encode(data.toJson());

@freezed
class ChangeThemeResponse with _$ChangeThemeResponse {
  const factory ChangeThemeResponse({
    String? message,
    bool? success,
  }) = _ChangeThemeResponse;

  factory ChangeThemeResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeThemeResponseFromJson(json);
}
