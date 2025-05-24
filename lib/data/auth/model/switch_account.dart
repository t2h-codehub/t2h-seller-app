import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'switch_account.freezed.dart';
part 'switch_account.g.dart';

SwitchAccountResponse switchAccountResponseFromJson(String str) =>
    SwitchAccountResponse.fromJson(json.decode(str));

String switchAccountResponseToJson(SwitchAccountResponse data) =>
    json.encode(data.toJson());

@freezed
class SwitchAccountResponse with _$SwitchAccountResponse {
  const factory SwitchAccountResponse({
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "User") User? user,
  }) = _SwitchAccountResponse;

  factory SwitchAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$SwitchAccountResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "plan") Plan? plan,
    @JsonKey(name: "customBranding") CustomBranding? customBranding,
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "parentId") String? parentId,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "isMobileVerified") bool? isMobileVerified,
    @JsonKey(name: "cards") List<dynamic>? cards,
    @JsonKey(name: "active") bool? active,
    @JsonKey(name: "theme") bool? theme,
    @JsonKey(name: "gainLeads") bool? gainLeads,
    @JsonKey(name: "quickIntro") bool? quickIntro,
    @JsonKey(name: "isCustomBranding") bool? isCustomBranding,
    @JsonKey(name: "helloDirect") bool? helloDirect,
    @JsonKey(name: "color") Color? color,
    @JsonKey(name: "isPro") bool? isPro,
    @JsonKey(name: "isProPlus") bool? isProPlus,
    @JsonKey(name: "services") List<Service>? services,
    @JsonKey(name: "customServices") List<CustomService>? customServices,
    @JsonKey(name: "contacts") List<Contact>? contacts,
    @JsonKey(name: "qrCode") String? qrCode,
    @JsonKey(name: "bio") String? bio,
    @JsonKey(name: "companyName") String? companyName,
    @JsonKey(name: "coverVideo") String? coverVideo,
    @JsonKey(name: "designation") String? designation,
    @JsonKey(name: "profileImg") String? profileImg,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "domain") String? domain,
    
   
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Plan with _$Plan {
  const factory Plan({
    @JsonKey(name: "planType") String? planType,
    @JsonKey(name: "expiresAt") DateTime? expiresAt,
    @JsonKey(name: "active") bool? active,
  }) = _Plan;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
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

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
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
class Contact with _$Contact {
  const factory Contact({
    @JsonKey(name: "user") String? user,
    @JsonKey(name: "favorite") bool? favorite,
    @JsonKey(name: "fcm") String? fcm,
    @JsonKey(name: "_id") String? id,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}
