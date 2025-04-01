// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_sigin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialSigninRequestImpl _$$SocialSigninRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SocialSigninRequestImpl(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      fcm: json['fcm'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$SocialSigninRequestImplToJson(
        _$SocialSigninRequestImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'type': instance.type,
      'name': instance.name,
      'fcm': instance.fcm,
      'phone': instance.phone,
    };

_$SocialSigninResponseImpl _$$SocialSigninResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SocialSigninResponseImpl(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$SocialSigninResponseImplToJson(
        _$SocialSigninResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'User': instance.user,
      'success': instance.success,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      email: json['email'] as String?,
      services: json['services'] as List<dynamic>?,
      isMobileVerified: json['isMobileVerified'] as bool?,
      phone: json['phone'] as String?,
      theme: json['theme'] as bool?,
      contacts: json['contacts'] as List<dynamic>?,
      gainLeads: json['gainLeads'] as bool?,
      googleUid: json['googleUid'] as String?,
      quickIntro: json['quickIntro'] as bool?,
      helloDirect: json['helloDirect'] as bool?,
      newUser: json['newUser'] as bool?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'services': instance.services,
      'isMobileVerified': instance.isMobileVerified,
      'phone': instance.phone,
      'theme': instance.theme,
      'contacts': instance.contacts,
      'gainLeads': instance.gainLeads,
      'googleUid': instance.googleUid,
      'quickIntro': instance.quickIntro,
      'helloDirect': instance.helloDirect,
      'newUser': instance.newUser,
    };
