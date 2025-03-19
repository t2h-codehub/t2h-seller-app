// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_contact_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactCardRequestImpl _$$ContactCardRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactCardRequestImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      cmpName: json['cmpName'] as String?,
      designation: json['designation'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$$ContactCardRequestImplToJson(
        _$ContactCardRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'cmpName': instance.cmpName,
      'designation': instance.designation,
      'mobile': instance.mobile,
    };
