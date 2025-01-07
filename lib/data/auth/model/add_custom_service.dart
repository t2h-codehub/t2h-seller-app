// To parse this JSON data, do
//
//     final addCustomServiceRequest = addCustomServiceRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_custom_service.freezed.dart';
part 'add_custom_service.g.dart';

AddCustomServiceRequest addCustomServiceRequestFromJson(String str) =>
    AddCustomServiceRequest.fromJson(json.decode(str));

String addCustomServiceRequestToJson(AddCustomServiceRequest data) =>
    json.encode(data.toJson());

@freezed
class AddCustomServiceRequest with _$AddCustomServiceRequest {
  const factory AddCustomServiceRequest({
    String? title,
    String? logo,
    String? link,
  }) = _AddCustomServiceRequest;

  factory AddCustomServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCustomServiceRequestFromJson(json);
}
