// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReqistrationRequestImpl _$$ReqistrationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ReqistrationRequestImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fcm: json['fcm'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$ReqistrationRequestImplToJson(
        _$ReqistrationRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'fcm': instance.fcm,
      'password': instance.password,
    };

_$ReqistrationResponseImpl _$$ReqistrationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReqistrationResponseImpl(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$ReqistrationResponseImplToJson(
        _$ReqistrationResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'User': instance.user,
      'success': instance.success,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'id': instance.id,
    };
