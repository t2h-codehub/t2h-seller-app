// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_contact_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactCardResponseImpl _$$ContactCardResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactCardResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      contactCards: (json['contactCards'] as List<dynamic>?)
          ?.map((e) => ContactCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContactCardResponseImplToJson(
        _$ContactCardResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'contactCards': instance.contactCards,
    };

_$ContactCardImpl _$$ContactCardImplFromJson(Map<String, dynamic> json) =>
    _$ContactCardImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      cmpName: json['cmpName'] as String?,
      designation: json['designation'] as String?,
      mobile: json['mobile'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$ContactCardImplToJson(_$ContactCardImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'cmpName': instance.cmpName,
      'designation': instance.designation,
      'mobile': instance.mobile,
      '_id': instance.id,
    };
