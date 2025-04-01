// To parse this JSON data, do
//
//     final addThemeRequest = addThemeRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_theme_model.freezed.dart';
part 'add_theme_model.g.dart';

AddThemeRequest addThemeRequestFromJson(String str) =>
    AddThemeRequest.fromJson(json.decode(str));

String addThemeRequestToJson(AddThemeRequest data) =>
    json.encode(data.toJson());

@freezed
class AddThemeRequest with _$AddThemeRequest {
  const factory AddThemeRequest({
    @JsonKey(name: "color1") String? color1,
    @JsonKey(name: "color2") String? color2,
    @JsonKey(name: "logo") String? image,
  }) = _AddThemeRequest;

  factory AddThemeRequest.fromJson(Map<String, dynamic> json) =>
      _$AddThemeRequestFromJson(json);
}
