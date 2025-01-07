// To parse this JSON data, do
//
//     final addServiceRequest = addServiceRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_service.freezed.dart';
part 'add_service.g.dart';

AddServiceRequest addServiceRequestFromJson(String str) =>
    AddServiceRequest.fromJson(json.decode(str));

String addServiceRequestToJson(AddServiceRequest data) =>
    json.encode(data.toJson());

@freezed
class AddServiceRequest with _$AddServiceRequest {
  const factory AddServiceRequest({
    String? serviceId,
    String? content,
  }) = _AddServiceRequest;

  factory AddServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$AddServiceRequestFromJson(json);
}
// To parse this JSON data, do
//
//     final addServiceResponse = addServiceResponseFromJson(jsonString);

AddServiceResponse addServiceResponseFromJson(String str) =>
    AddServiceResponse.fromJson(json.decode(str));

String addServiceResponseToJson(AddServiceResponse data) =>
    json.encode(data.toJson());

@freezed
class AddServiceResponse with _$AddServiceResponse {
  const factory AddServiceResponse({
    String? message,
    bool? success,
  }) = _AddServiceResponse;

  factory AddServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$AddServiceResponseFromJson(json);
}
