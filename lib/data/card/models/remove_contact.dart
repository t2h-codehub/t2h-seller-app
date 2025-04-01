// To parse this JSON data, do
//
//     final removeConnectRequest = removeConnectRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'remove_contact.freezed.dart';
part 'remove_contact.g.dart';

RemoveConnectRequest removeConnectRequestFromJson(String str) =>
    RemoveConnectRequest.fromJson(json.decode(str));

String removeConnectRequestToJson(RemoveConnectRequest data) =>
    json.encode(data.toJson());

@freezed
class RemoveConnectRequest with _$RemoveConnectRequest {
  const factory RemoveConnectRequest({
    String? userId,
    String? connectUserId,
  }) = _RemoveConnectRequest;

  factory RemoveConnectRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoveConnectRequestFromJson(json);
}
// Check out my Hello profile ${AppConstants.websiteUrl}profile/651bbf0701c704cee9c4f4a2