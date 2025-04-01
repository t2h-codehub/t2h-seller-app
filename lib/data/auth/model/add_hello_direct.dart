// To parse this JSON data, do
//
//     final addhelloDirectRequest = addhelloDirectRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_hello_direct.freezed.dart';
part 'add_hello_direct.g.dart';

AddhelloDirectRequest addhelloDirectRequestFromJson(String str) =>
    AddhelloDirectRequest.fromJson(json.decode(str));

String addhelloDirectRequestToJson(AddhelloDirectRequest data) =>
    json.encode(data.toJson());

@freezed
class AddhelloDirectRequest with _$AddhelloDirectRequest {
  const factory AddhelloDirectRequest({
    String? serviceId,
  }) = _AddhelloDirectRequest;

  factory AddhelloDirectRequest.fromJson(Map<String, dynamic> json) =>
      _$AddhelloDirectRequestFromJson(json);
}
