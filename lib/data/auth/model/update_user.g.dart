// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateUserRequestImpl _$$UpdateUserRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateUserRequestImpl(
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      designation: json['designation'] as String?,
      profileImg: json['profileImg'] as String?,
      coverVideo: json['coverVideo'] as String?,
      phone: json['phone'] as String?,
      companyName: json['companyName'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$$UpdateUserRequestImplToJson(
        _$UpdateUserRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bio': instance.bio,
      'designation': instance.designation,
      'profileImg': instance.profileImg,
      'coverVideo': instance.coverVideo,
      'phone': instance.phone,
      'companyName': instance.companyName,
      'lang': instance.lang,
    };

_$UpdateUserResponseImpl _$$UpdateUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateUserResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$UpdateUserResponseImplToJson(
        _$UpdateUserResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };

_$UpdateUserQrRequestImpl _$$UpdateUserQrRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateUserQrRequestImpl(
      qrCode: json['qrCode'] as String?,
    );

Map<String, dynamic> _$$UpdateUserQrRequestImplToJson(
        _$UpdateUserQrRequestImpl instance) =>
    <String, dynamic>{
      'qrCode': instance.qrCode,
    };

_$UpdateUserQrResponseImpl _$$UpdateUserQrResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateUserQrResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$UpdateUserQrResponseImplToJson(
        _$UpdateUserQrResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
