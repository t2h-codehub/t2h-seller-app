// To parse this JSON data, do
//
//     final getSearchServicesResponse = getSearchServicesResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'search_services.freezed.dart';
part 'search_services.g.dart';

GetSearchServicesResponse getSearchServicesResponseFromJson(String str) =>
    GetSearchServicesResponse.fromJson(json.decode(str));

String getSearchServicesResponseToJson(GetSearchServicesResponse data) =>
    json.encode(data.toJson());

@freezed
class GetSearchServicesResponse with _$GetSearchServicesResponse {
  const factory GetSearchServicesResponse({
    String? message,
    List<Service>? services,
    bool? success,
  }) = _GetSearchServicesResponse;

  factory GetSearchServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSearchServicesResponseFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    @JsonKey(name: "_id") String? id,
    String? title,
    String? content,
    String? type,
    String? logo,
    bool? active,
    bool? isPro,
    bool? isProPlus,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

GetSearchServicesRequest getSearchServicesRequestFromJson(String str) =>
    GetSearchServicesRequest.fromJson(json.decode(str));

String getSearchServicesRequestToJson(GetSearchServicesRequest data) =>
    json.encode(data.toJson());

@freezed
class GetSearchServicesRequest with _$GetSearchServicesRequest {
  const factory GetSearchServicesRequest({
    String? title,
  }) = _GetSearchServicesRequest;

  factory GetSearchServicesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSearchServicesRequestFromJson(json);
}
