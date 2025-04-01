// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connected_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConnectedUserResponseImpl _$$ConnectedUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ConnectedUserResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ConnectedUserResponseImplToJson(
        _$ConnectedUserResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'contacts': instance.contacts,
    };

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      designation: json['designation'] as String?,
      profileImg: json['profileImg'] as String?,
      companyName: json['companyName'] as String?,
      color: json['color'] == null
          ? null
          : Color.fromJson(json['color'] as Map<String, dynamic>),
      bio: json['bio'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      customServices: (json['customServices'] as List<dynamic>?)
          ?.map((e) => CustomService.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: (json['contacts'] as num?)?.toInt(),
      favorite: json['favorite'] as bool?,
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'designation': instance.designation,
      'profileImg': instance.profileImg,
      'companyName': instance.companyName,
      'color': instance.color,
      'bio': instance.bio,
      'services': instance.services,
      'customServices': instance.customServices,
      'contacts': instance.contacts,
      'favorite': instance.favorite,
    };

_$ColorImpl _$$ColorImplFromJson(Map<String, dynamic> json) => _$ColorImpl(
      id: json['_id'] as String?,
      color1: json['color1'] as String?,
      color2: json['color2'] as String?,
      index: (json['index'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ColorImplToJson(_$ColorImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'color1': instance.color1,
      'color2': instance.color2,
      'index': instance.index,
    };

_$CustomServiceImpl _$$CustomServiceImplFromJson(Map<String, dynamic> json) =>
    _$CustomServiceImpl(
      title: json['title'] as String?,
      logo: json['logo'] as String?,
      link: json['link'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$CustomServiceImplToJson(_$CustomServiceImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'logo': instance.logo,
      'link': instance.link,
      '_id': instance.id,
    };

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      service: json['service'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
      orderId: (json['orderId'] as num?)?.toInt(),
      active: json['active'] as bool?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'service': instance.service,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'logo': instance.logo,
      'orderId': instance.orderId,
      'active': instance.active,
      '_id': instance.id,
    };
