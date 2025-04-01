// To parse this JSON data, do
//
//     final socialSigninRequest = socialSigninRequestFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'social_sigin.freezed.dart';
part 'social_sigin.g.dart';

SocialSigninRequest socialSigninRequestFromJson(String str) =>
    SocialSigninRequest.fromJson(json.decode(str));

String socialSigninRequestToJson(SocialSigninRequest data) =>
    json.encode(data.toJson());

@freezed
class SocialSigninRequest with _$SocialSigninRequest {
  const factory SocialSigninRequest({
    String? uid,
    String? email,
    String? type,
    String? name,
    String? fcm,

    String? phone,
  }) = _SocialSigninRequest;

  factory SocialSigninRequest.fromJson(Map<String, dynamic> json) =>
      _$SocialSigninRequestFromJson(json);
}

SocialSigninResponse socialSigninResponseFromJson(String str) =>
    SocialSigninResponse.fromJson(json.decode(str));

String socialSigninResponseToJson(SocialSigninResponse data) =>
    json.encode(data.toJson());

@freezed
class SocialSigninResponse with _$SocialSigninResponse {
  const factory SocialSigninResponse({
    String? message,
    String? token,
    @JsonKey(name: "User") User? user,
    bool? success,
  }) = _SocialSigninResponse;

  factory SocialSigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SocialSigninResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    String? id,
    String? email,
    List<dynamic>? services,
    bool? isMobileVerified,
    String? phone,
    bool? theme,
    List<dynamic>? contacts,
    bool? gainLeads,
    String? googleUid,
    bool? quickIntro,
    bool? helloDirect,
    bool? newUser,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
