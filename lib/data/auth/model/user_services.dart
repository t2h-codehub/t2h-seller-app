// To parse this JSON data, do

//     final userServicesResponse = userServicesResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'dart:convert';

// part 'user_services.freezed.dart';
// part 'user_services.g.dart';

// UserServicesResponse userServicesResponseFromJson(String str) =>
//     UserServicesResponse.fromJson(json.decode(str));

// String userServicesResponseToJson(UserServicesResponse data) =>
//     json.encode(data.toJson());

// @freezed
// class UserServicesResponse with _$UserServicesResponse {
//   const factory UserServicesResponse({
//     String? message,
//     bool? success,
//     List<Service>? services,
//   }) = _UserServicesResponse;

//   factory UserServicesResponse.fromJson(Map<String, dynamic> json) =>
//       _$UserServicesResponseFromJson(json);
// }

// @freezed
// class Service with _$Service {
//   const factory Service({
//     String? service,
//     String? title,
//     String? content,
//     String? type,
//     String? logo,
//     int? orderId,
//     bool? active,
//     @JsonKey(name: "_id") String? id,
//   }) = _Service;

//   factory Service.fromJson(Map<String, dynamic> json) =>
//       _$ServiceFromJson(json);
// }

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user_services.freezed.dart';
// part 'user_services.g.dart';

// @freezed
// class UserServicesResponse with _$UserServicesResponse {
//   const factory UserServicesResponse({
//     String? message,
//     bool? success,
//     List<ServiceCategory>? services, // List of ServiceCategory
//   }) = _UserServicesResponse;

//   factory UserServicesResponse.fromJson(Map<String, dynamic> json) =>
//       _$UserServicesResponseFromJson(json);
// }

// @freezed
// class ServiceCategory with _$ServiceCategory {
//   const factory ServiceCategory({
//     String? name, // name represents the category name (e.g., "Social")
//     List<Service>? value, // List of Service objects
//   }) = _ServiceCategory;

//   factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
//       _$ServiceCategoryFromJson(json);  // This will generate the fromJson method
// }

// @freezed
// class Service with _$Service {
//   const factory Service({
//     String? service,
//     String? title,
//     String? content,
//     String? type,
//     String? logo,
//     int? orderId,
//     bool? active,
//     @JsonKey(name: "_id") String? id,
//   }) = _Service;

//   factory Service.fromJson(Map<String, dynamic> json) =>
//       _$ServiceFromJson(json);
// }


// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'dart:convert';

// part 'user_services.freezed.dart';
// part 'user_services.g.dart';

// UserServicesResponse userServicesResponseFromJson(String str) =>
//     UserServicesResponse.fromJson(json.decode(str));

// String userServicesResponseToJson(UserServicesResponse data) =>
//     json.encode(data.toJson());

// @freezed
// class UserServicesResponse with _$UserServicesResponse {
//   const factory UserServicesResponse({
//     String? message,
//     bool? success,
//     List<ServiceCategory>? services, // This should be List<ServiceCategory>
//   }) = _UserServicesResponse;

//   factory UserServicesResponse.fromJson(Map<String, dynamic> json) =>
//       _$UserServicesResponseFromJson(json);
// }

// @freezed
// class ServiceCategory with _$ServiceCategory {
//   const factory ServiceCategory({
//     String? name, // Corresponds to the service category (e.g., "Social")
//     List<Service>? value, // Contains a list of services
//   }) = _ServiceCategory;

//   factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
//       _$ServiceCategoryFromJson(json);
// }

// @freezed
// class Service with _$Service {
//   const factory Service({
//     String? service,
//     String? title,
//     String? content,
//     String? type,
//     String? logo,
//     int? orderId,
//     bool? active,
//     @JsonKey(name: "_id") String? id,
//   }) = _Service;

//   factory Service.fromJson(Map<String, dynamic> json) =>
//       _$ServiceFromJson(json);
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_services.freezed.dart';
part 'user_services.g.dart';

UserServicesResponse userServicesResponseFromJson(String str) =>
    UserServicesResponse.fromJson(json.decode(str));

String userServicesResponseToJson(UserServicesResponse data) =>
    json.encode(data.toJson());

@freezed
class UserServicesResponse with _$UserServicesResponse {
  const factory UserServicesResponse({
    String? message,
    bool? success,
    List<Service>? services,
  }) = _UserServicesResponse;

  factory UserServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$UserServicesResponseFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    String? service,
    String? title,
    String? content,
    String? type,
    String? logo,
    int? orderId,
    bool? active,
    @JsonKey(name: "_id") String? id,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}


