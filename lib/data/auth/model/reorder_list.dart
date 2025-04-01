// To parse this JSON data, do
//
//     final reorderRequest = reorderRequestFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'reorder_list.freezed.dart';
part 'reorder_list.g.dart';




ReorderRequest reorderRequestFromJson(String str) => ReorderRequest.fromJson(json.decode(str));

String reorderRequestToJson(ReorderRequest data) => json.encode(data.toJson());

@freezed
class ReorderRequest with _$ReorderRequest {
    const factory ReorderRequest({
     @JsonKey(name: "_id")   String? id,
        int? orderId,
    }) = _ReorderRequest;

    factory ReorderRequest.fromJson(Map<String, dynamic> json) => _$ReorderRequestFromJson(json);
}
