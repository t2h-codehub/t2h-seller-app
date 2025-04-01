// To parse this JSON data, do
//
//     final getEligibilityResponse = getEligibilityResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'eligibility.freezed.dart';
part 'eligibility.g.dart';

GetEligibilityResponse getEligibilityResponseFromJson(String str) =>
    GetEligibilityResponse.fromJson(json.decode(str));

String getEligibilityResponseToJson(GetEligibilityResponse data) =>
    json.encode(data.toJson());

@freezed
class GetEligibilityResponse with _$GetEligibilityResponse {
  const factory GetEligibilityResponse({
    @JsonKey(name: "value") bool? value,
  }) = _GetEligibilityResponse;

  factory GetEligibilityResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEligibilityResponseFromJson(json);
}
