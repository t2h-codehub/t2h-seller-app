// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpVerifyRequestImpl _$$OtpVerifyRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$OtpVerifyRequestImpl(
      otp: (json['otp'] as num?)?.toInt(),
      userNumber: json['user_number'] as String?,
      authKey: json['auth_key'] as String? ?? '',
    );

Map<String, dynamic> _$$OtpVerifyRequestImplToJson(
        _$OtpVerifyRequestImpl instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'user_number': instance.userNumber,
      'auth_key': instance.authKey,
    };

_$OtpVerifyResponseImpl _$$OtpVerifyResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OtpVerifyResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      user: json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$OtpVerifyResponseImplToJson(
        _$OtpVerifyResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'User': instance.user,
      'token': instance.token,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
