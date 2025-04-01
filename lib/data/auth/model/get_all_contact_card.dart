// To parse this JSON data, do
//
//     final contactCardResponse = contactCardResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_all_contact_card.freezed.dart';
part 'get_all_contact_card.g.dart';

ContactCardResponse contactCardResponseFromJson(String str) =>
    ContactCardResponse.fromJson(json.decode(str));

String contactCardResponseToJson(ContactCardResponse data) =>
    json.encode(data.toJson());

@freezed
class ContactCardResponse with _$ContactCardResponse {
  const factory ContactCardResponse({
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "contactCards") List<ContactCard>? contactCards,
  }) = _ContactCardResponse;

  factory ContactCardResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactCardResponseFromJson(json);
}

@freezed
class ContactCard with _$ContactCard {
  const factory ContactCard({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "cmpName") String? cmpName,
    @JsonKey(name: "designation") String? designation,
    @JsonKey(name: "mobile") String? mobile,
    @JsonKey(name: "_id") String? id,
    // @JsonKey(name: "_id") String? id,
  }) = _ContactCard;

  factory ContactCard.fromJson(Map<String, dynamic> json) =>
      _$ContactCardFromJson(json);
}
