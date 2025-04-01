// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetSearchServicesResponseImpl _$$GetSearchServicesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetSearchServicesResponseImpl(
      message: json['message'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$GetSearchServicesResponseImplToJson(
        _$GetSearchServicesResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'services': instance.services,
      'success': instance.success,
    };

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
      active: json['active'] as bool?,
      isPro: json['isPro'] as bool?,
      isProPlus: json['isProPlus'] as bool?,
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'logo': instance.logo,
      'active': instance.active,
      'isPro': instance.isPro,
      'isProPlus': instance.isProPlus,
    };

_$GetSearchServicesRequestImpl _$$GetSearchServicesRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GetSearchServicesRequestImpl(
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$GetSearchServicesRequestImplToJson(
        _$GetSearchServicesRequestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
