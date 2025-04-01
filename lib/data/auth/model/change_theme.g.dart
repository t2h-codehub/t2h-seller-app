// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChangeThemeRequestImpl _$$ChangeThemeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangeThemeRequestImpl(
      index: (json['index'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChangeThemeRequestImplToJson(
        _$ChangeThemeRequestImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
    };

_$ChangeThemeResponseImpl _$$ChangeThemeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangeThemeResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$ChangeThemeResponseImplToJson(
        _$ChangeThemeResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
