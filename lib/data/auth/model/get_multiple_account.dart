// To parse this JSON data, do
//
//     final getMultipleAccountsResponse = getMultipleAccountsResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_multiple_account.freezed.dart';
part 'get_multiple_account.g.dart';

GetMultipleAccountsResponse getMultipleAccountsResponseFromJson(String str) =>
    GetMultipleAccountsResponse.fromJson(json.decode(str));

String getMultipleAccountsResponseToJson(GetMultipleAccountsResponse data) =>
    json.encode(data.toJson());

@freezed
class GetMultipleAccountsResponse with _$GetMultipleAccountsResponse {
  const factory GetMultipleAccountsResponse({
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "accounts") List<Account>? accounts,
  }) = _GetMultipleAccountsResponse;

  factory GetMultipleAccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMultipleAccountsResponseFromJson(json);
}

@freezed
class Account with _$Account {
  const factory Account({
    @JsonKey(name: "plan") Plan? plan,
    @JsonKey(name: "customBranding") CustomBranding? customBranding,
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "parentId") String? parentId,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "domain") String? domain,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "isMobileVerified") bool? isMobileVerified,
    @JsonKey(name: "designation") String? designation,
    @JsonKey(name: "bio") String? bio,
    @JsonKey(name: "profileImg") String? profileImg,
    @JsonKey(name: "coverVideo") String? coverVideo,
    @JsonKey(name: "qrCode") String? qrCode,
    @JsonKey(name: "companyName") String? companyName,
    @JsonKey(name: "cards") List<String>? cards,
    @JsonKey(name: "active") bool? active,
    @JsonKey(name: "services") List<Service>? services,
    @JsonKey(name: "customServices") List<CustomService>? customServices,
    @JsonKey(name: "theme") bool? theme,
    @JsonKey(name: "gainLeads") bool? gainLeads,
    @JsonKey(name: "quickIntro") bool? quickIntro,
    @JsonKey(name: "isCustomBranding") bool? isCustomBranding,
    @JsonKey(name: "contacts") List<Contact>? contacts,
    @JsonKey(name: "helloDirect") bool? helloDirect,
    @JsonKey(name: "color") Color? color,
    @JsonKey(name: "isPro") bool? isPro,
    @JsonKey(name: "isProPlus") bool? isProPlus,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

@freezed
class Color with _$Color {
  const factory Color({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "color1") String? color1,
    @JsonKey(name: "color2") String? color2,
    @JsonKey(name: "index") int? index,
  }) = _Color;

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
}

@freezed
class Contact with _$Contact {
  const factory Contact({
    @JsonKey(name: "user") String? user,
    @JsonKey(name: "favorite") bool? favorite,
    @JsonKey(name: "_id") String? id,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

@freezed
class CustomBranding with _$CustomBranding {
  const factory CustomBranding({
    @JsonKey(name: "customTheme") CustomTheme? customTheme,
    @JsonKey(name: "color") String? color,
    @JsonKey(name: "image") String? image,
  }) = _CustomBranding;

  factory CustomBranding.fromJson(Map<String, dynamic> json) =>
      _$CustomBrandingFromJson(json);
}

@freezed
class CustomTheme with _$CustomTheme {
  const factory CustomTheme({
    @JsonKey(name: "color1") String? color1,
    @JsonKey(name: "color2") String? color2,
    @JsonKey(name: "logo") String? logo,
  }) = _CustomTheme;

  factory CustomTheme.fromJson(Map<String, dynamic> json) =>
      _$CustomThemeFromJson(json);
}

@freezed
class CustomService with _$CustomService {
  const factory CustomService({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "logo") String? logo,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "_id") String? id,
  }) = _CustomService;

  factory CustomService.fromJson(Map<String, dynamic> json) =>
      _$CustomServiceFromJson(json);
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
    @JsonKey(name: "service") String? service,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "logo") String? logo,
    @JsonKey(name: "orderId") int? orderId,
    @JsonKey(name: "active") bool? active,
    @JsonKey(name: "_id") String? id,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

CreatgeMultipleAccountRequest creatgeMultipleAccountRequestFromJson(
        String str) =>
    CreatgeMultipleAccountRequest.fromJson(json.decode(str));

String creatgeMultipleAccountRequestToJson(
        CreatgeMultipleAccountRequest data) =>
    json.encode(data.toJson());

@freezed
class CreatgeMultipleAccountRequest with _$CreatgeMultipleAccountRequest {
  const factory CreatgeMultipleAccountRequest({
    @JsonKey(name: "name") String? name,
  }) = _CreatgeMultipleAccountRequest;

  factory CreatgeMultipleAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatgeMultipleAccountRequestFromJson(json);
}
