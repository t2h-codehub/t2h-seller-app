// To parse this JSON data, do
//
//     final uploadResponse = uploadResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'upload_model.freezed.dart';
part 'upload_model.g.dart';

UploadResponse uploadResponseFromJson(String str) =>
    UploadResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String uploadResponseToJson(UploadResponse data) => json.encode(data.toJson());

@freezed
class UploadResponse with _$UploadResponse {
  const factory UploadResponse({
    String? message,
    String? fileUrl,
  }) = _UploadResponse;

  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);
}
