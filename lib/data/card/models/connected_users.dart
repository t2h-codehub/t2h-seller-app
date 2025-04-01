// To parse this JSON data, do
//
//     final connectedUserResponse = connectedUserResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'connected_users.freezed.dart';
part 'connected_users.g.dart';

ConnectedUserResponse connectedUserResponseFromJson(String str) =>
    ConnectedUserResponse.fromJson(json.decode(str));

String connectedUserResponseToJson(ConnectedUserResponse data) =>
    json.encode(data.toJson());

@freezed
class ConnectedUserResponse with _$ConnectedUserResponse {
  const factory ConnectedUserResponse({
    String? message,
    bool? success,
    List<Contact>? contacts,
  }) = _ConnectedUserResponse;

  factory ConnectedUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ConnectedUserResponseFromJson(json);
}

@freezed
class Contact with _$Contact {
  const factory Contact({
    @JsonKey(name: "_id") String? id,
    String? name,
    String? email,
      String? phone,
    String? designation,
    String? profileImg,
    String? companyName,
    Color? color,
    String? bio,
      List<Service>? services,
      List<CustomService>? customServices,
    int? contacts,
      bool? favorite
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
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
class Service with _$Service {
  const factory Service({
    String? service,
    String? title,
    String? content,
    String? type,
    String? logo,
    int? orderId,
    bool? active,
    @JsonKey(name: "_id") String? id,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
