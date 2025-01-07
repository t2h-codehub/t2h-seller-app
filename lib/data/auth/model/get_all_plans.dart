// To parse this JSON data, do
//
//     final getPlanRequest = getPlanRequestFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_all_plans.freezed.dart';
part 'get_all_plans.g.dart';

GetPlanResponse getPlanResponseFromJson(String str) =>
    GetPlanResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String getPlanResponseToJson(GetPlanResponse data) =>
    json.encode(data.toJson());

@freezed
class GetPlanResponse with _$GetPlanResponse {
  const factory GetPlanResponse({
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "plans") List<Plan>? plans,
  }) = _GetPlanResponse;

  factory GetPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPlanResponseFromJson(json);
}

@freezed
class Plan with _$Plan {
  const factory Plan({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "mrp") int? mrp,
    @JsonKey(name: "duration") String? duration,
    @JsonKey(name: "shortBenefits") List<Benefit>? shortBenefits,
    @JsonKey(name: "benefits") List<Benefit>? benefits,
    @JsonKey(name: "active") bool? active,
    @JsonKey(name: "__v") int? v,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "features") List<String>? features,
    @JsonKey(name: "monthlyPrice") int? monthlyPrice,
    @JsonKey(name: "yearlyPrice") int? yearlyPrice,
  }) = _Plan;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}

@freezed
class Benefit with _$Benefit {
  const factory Benefit({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "_id") String? id,
  }) = _Benefit;

  factory Benefit.fromJson(Map<String, dynamic> json) =>
      _$BenefitFromJson(json);
}
