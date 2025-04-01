// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserServicesResponseImpl _$$UserServicesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserServicesResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserServicesResponseImplToJson(
        _$UserServicesResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'services': instance.services,
    };

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      service: json['service'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
      orderId: (json['orderId'] as num?)?.toInt(),
      active: json['active'] as bool?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'service': instance.service,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'logo': instance.logo,
      'orderId': instance.orderId,
      'active': instance.active,
      '_id': instance.id,
    };
