// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordRequestImpl _$$ResetPasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordRequestImpl(
      otp: (json['otp'] as num?)?.toInt(),
      newPassword: json['newPassword'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$ResetPasswordRequestImplToJson(
        _$ResetPasswordRequestImpl instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'newPassword': instance.newPassword,
      'userId': instance.userId,
    };
