// To parse this JSON data, do
//
//     final contactCardRequest = contactCardRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_contact_card.freezed.dart';
part 'add_contact_card.g.dart';

ContactCardRequest contactCardRequestFromJson(String str) =>
    ContactCardRequest.fromJson(json.decode(str));

String contactCardRequestToJson(ContactCardRequest data) =>
    json.encode(data.toJson());

@freezed
class ContactCardRequest with _$ContactCardRequest {
  const factory ContactCardRequest({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "cmpName") String? cmpName,
    @JsonKey(name: "designation") String? designation,
    @JsonKey(name: "mobile") String? mobile,
  }) = _ContactCardRequest;

  factory ContactCardRequest.fromJson(Map<String, dynamic> json) =>
      _$ContactCardRequestFromJson(json);
}
