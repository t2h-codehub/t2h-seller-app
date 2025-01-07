// To parse this JSON data, do
//
//     final getServiceResponse = getServiceResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'services.freezed.dart';
part 'services.g.dart';

GetServiceResponse getServiceResponseFromJson(String str) =>
    GetServiceResponse.fromJson(json.decode(str));

String getServiceResponseToJson(GetServiceResponse data) =>
    json.encode(data.toJson());

@freezed
class GetServiceResponse with _$GetServiceResponse {
  const factory GetServiceResponse({
    String? message,
    bool? success,
    List<Service>? services,
  }) = _GetServiceResponse;

  factory GetServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServiceResponseFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    String? name,
    List<Value>? value,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

@freezed
class Value with _$Value {
  const factory Value({
    @JsonKey(name: "_id") String? id,
    String? title,
    String? content,
    String? type,
    String? logo,
    bool? active,
    String? placeholder,
    bool? isPro,
    bool? isProPlus,
  }) = _Value;

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}
