// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetServiceResponseImpl _$$GetServiceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetServiceResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetServiceResponseImplToJson(
        _$GetServiceResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'services': instance.services,
    };

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      name: json['name'] as String?,
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => Value.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

_$ValueImpl _$$ValueImplFromJson(Map<String, dynamic> json) => _$ValueImpl(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
      active: json['active'] as bool?,
      placeholder: json['placeholder'] as String?,
      isPro: json['isPro'] as bool?,
      isProPlus: json['isProPlus'] as bool?,
    );

Map<String, dynamic> _$$ValueImplToJson(_$ValueImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'logo': instance.logo,
      'active': instance.active,
      'placeholder': instance.placeholder,
      'isPro': instance.isPro,
      'isProPlus': instance.isProPlus,
    };
