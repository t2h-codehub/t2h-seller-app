// To parse this JSON data, do
//
//     final editProfileLinkRequest = editProfileLinkRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'edit_profile_link.freezed.dart';
part 'edit_profile_link.g.dart';

EditProfileLinkRequest editProfileLinkRequestFromJson(String str) =>
    EditProfileLinkRequest.fromJson(json.decode(str));

String editProfileLinkRequestToJson(EditProfileLinkRequest data) =>
    json.encode(data.toJson());

@freezed
class EditProfileLinkRequest with _$EditProfileLinkRequest {
  const factory EditProfileLinkRequest({
    String? username,
  }) = _EditProfileLinkRequest;

  factory EditProfileLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProfileLinkRequestFromJson(json);
}
