// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddServiceRequestImpl _$$AddServiceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AddServiceRequestImpl(
      serviceId: json['serviceId'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$AddServiceRequestImplToJson(
        _$AddServiceRequestImpl instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'content': instance.content,
    };

_$AddServiceResponseImpl _$$AddServiceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AddServiceResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$AddServiceResponseImplToJson(
        _$AddServiceResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
