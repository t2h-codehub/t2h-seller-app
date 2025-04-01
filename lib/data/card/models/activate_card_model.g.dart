// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activate_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivateCardRequestImpl _$$ActivateCardRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivateCardRequestImpl(
      cardId: json['card_id'] as String?,
    );

Map<String, dynamic> _$$ActivateCardRequestImplToJson(
        _$ActivateCardRequestImpl instance) =>
    <String, dynamic>{
      'card_id': instance.cardId,
    };

_$ActivateCardResponseImpl _$$ActivateCardResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivateCardResponseImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      success: json['success'] as String?,
    );

Map<String, dynamic> _$$ActivateCardResponseImplToJson(
        _$ActivateCardResponseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'success': instance.success,
    };
