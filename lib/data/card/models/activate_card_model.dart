// To parse this JSON data, do
//
//     final activateCardRequest = activateCardRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'activate_card_model.freezed.dart';
part 'activate_card_model.g.dart';

ActivateCardRequest activateCardRequestFromJson(String str) =>
    ActivateCardRequest.fromJson(json.decode(str));

String activateCardRequestToJson(ActivateCardRequest data) =>
    json.encode(data.toJson());

@freezed
class ActivateCardRequest with _$ActivateCardRequest {
  const factory ActivateCardRequest({
    @JsonKey(name: "card_id") String? cardId,
  }) = _ActivateCardRequest;

  factory ActivateCardRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivateCardRequestFromJson(json);
}
// To parse this JSON data, do
//
//     final activateCardResponse = activateCardResponseFromJson(jsonString);

ActivateCardResponse activateCardResponseFromJson(String str) =>
    ActivateCardResponse.fromJson(json.decode(str));

String activateCardResponseToJson(ActivateCardResponse data) =>
    json.encode(data.toJson());

@freezed
class ActivateCardResponse with _$ActivateCardResponse {
  const factory ActivateCardResponse({
    String? name,
    String? email,
    String? phone,
    String? success,
  }) = _ActivateCardResponse;

  factory ActivateCardResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivateCardResponseFromJson(json);
}
