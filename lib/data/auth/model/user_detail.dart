// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_detail.freezed.dart';
part 'user_detail.g.dart';

// To parse this JSON data, do
//
//     final userDetailResponse = userDetailResponseFromJson(jsonString);

UserDetailResponse userDetailResponseFromJson(String str) =>
    UserDetailResponse.fromJson(json.decode(str));

String userDetailResponseToJson(UserDetailResponse data) =>
    json.encode(data.toJson());

@freezed
class UserDetailResponse with _$UserDetailResponse {
  const factory UserDetailResponse({
    String? message,
    bool? success,
    @JsonKey(name: "User") User? user,
  }) = _UserDetailResponse;

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? designation,
    String? bio,
    String? profileImg,
    String? coverVideo,
    String? qrCode,
    String? companyName,
    bool? active,
    @JsonKey(name: "services") List<Service>? services,
    @JsonKey(name: "color") Color? color,
    bool? theme,
    String? lang,
    List<Contact>? contacts,
    bool? gainLeads,
    bool? quickIntro,
    bool? helloDirect,
    @JsonKey(name: "customServices") List<CustomService>? customServices,
    @JsonKey(name: "helloService") HelloService? helloService,
    bool? isPro,
    bool? isProPlus,
    bool? isMobileVerified,
    bool? isCustomBranding,
    @JsonKey(name: "customBranding") CustomBranding? customBranding,
    String? username,
    String? domain,
    List<String>? cards,
    @JsonKey(name: "plan") Plan? plan,
    String? type,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Plan with _$Plan {
  const factory Plan({
    @JsonKey(name: "planType") PlanType? planType,
    @JsonKey(name: "expiresAt") DateTime? expiresAt,
    @JsonKey(name: "active") bool? active,
  }) = _Plan;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}

@freezed
class PlanType with _$PlanType {
  const factory PlanType({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "active") bool? active,
    @JsonKey(name: "features") List<String>? features,
  }) = _PlanType;

  factory PlanType.fromJson(Map<String, dynamic> json) =>
      _$PlanTypeFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    String? name,
    List<Value>? value,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

@freezed
class Value with _$Value {
  const factory Value({
    String? service,
    String? title,
    String? content,
    String? type,
    String? logo,
    int? orderId,
    bool? active,
    @JsonKey(name: "_id") String? id,
  }) = _Value;

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}

@freezed
class Color with _$Color {
  const factory Color({
    @JsonKey(name: "_id") String? id,
    String? color1,
    String? color2,
    int? index,
  }) = _Color;

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
}

@freezed
class CustomService with _$CustomService {
  const factory CustomService({
    String? title,
    String? logo,
    String? link,
    @JsonKey(name: "_id") String? id,
  }) = _CustomService;

  factory CustomService.fromJson(Map<String, dynamic> json) =>
      _$CustomServiceFromJson(json);
}

@freezed
class CustomBranding with _$CustomBranding {
  const factory CustomBranding({
    String? color,
    String? image,
    CustomTheme? customTheme,
  }) = _CustomBranding;

  factory CustomBranding.fromJson(Map<String, dynamic> json) =>
      _$CustomBrandingFromJson(json);
}

@freezed
class CustomTheme with _$CustomTheme {
  const factory CustomTheme({
    String? color1,
    String? color2,
    String? logo,
  }) = _CustomTheme;

  factory CustomTheme.fromJson(Map<String, dynamic> json) =>
      _$CustomThemeFromJson(json);
}

@freezed
class Contact with _$Contact {
  const factory Contact({
    String? user,
    bool? favorite,
    String? fcm,
    @JsonKey(name: "_id") String? id,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

@freezed
class HelloService with _$HelloService {
  const factory HelloService({
    String? service,
    String? title,
    String? content,
    String? type,
    String? logo,
    int? orderId,
    bool? active,
    @JsonKey(name: "_id") String? id,
  }) = _HelloService;

  factory HelloService.fromJson(Map<String, dynamic> json) =>
      _$HelloServiceFromJson(json);
}
