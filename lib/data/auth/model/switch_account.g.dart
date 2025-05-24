// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'switch_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SwitchAccountResponseImpl _$$SwitchAccountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SwitchAccountResponseImpl(
      message: json['message'] as String?,
      token: json['token'] as String?,
      success: json['success'] as bool?,
      user: json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SwitchAccountResponseImplToJson(
        _$SwitchAccountResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'success': instance.success,
      'User': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      plan: json['plan'] == null
          ? null
          : Plan.fromJson(json['plan'] as Map<String, dynamic>),
      customBranding: json['customBranding'] == null
          ? null
          : CustomBranding.fromJson(
              json['customBranding'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      parentId: json['parentId'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      isMobileVerified: json['isMobileVerified'] as bool?,
      cards: json['cards'] as List<dynamic>?,
      active: json['active'] as bool?,
      theme: json['theme'] as bool?,
      gainLeads: json['gainLeads'] as bool?,
      quickIntro: json['quickIntro'] as bool?,
      isCustomBranding: json['isCustomBranding'] as bool?,
      helloDirect: json['helloDirect'] as bool?,
      color: json['color'] == null
          ? null
          : Color.fromJson(json['color'] as Map<String, dynamic>),
      isPro: json['isPro'] as bool?,
      isProPlus: json['isProPlus'] as bool?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      customServices: (json['customServices'] as List<dynamic>?)
          ?.map((e) => CustomService.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      qrCode: json['qrCode'] as String?,
      bio: json['bio'] as String?,
      companyName: json['companyName'] as String?,
      coverVideo: json['coverVideo'] as String?,
      designation: json['designation'] as String?,
      profileImg: json['profileImg'] as String?,
      username: json['username'] as String?,
      domain: json['domain'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'plan': instance.plan,
      'customBranding': instance.customBranding,
      '_id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'email': instance.email,
      'phone': instance.phone,
      'isMobileVerified': instance.isMobileVerified,
      'cards': instance.cards,
      'active': instance.active,
      'theme': instance.theme,
      'gainLeads': instance.gainLeads,
      'quickIntro': instance.quickIntro,
      'isCustomBranding': instance.isCustomBranding,
      'helloDirect': instance.helloDirect,
      'color': instance.color,
      'isPro': instance.isPro,
      'isProPlus': instance.isProPlus,
      'services': instance.services,
      'customServices': instance.customServices,
      'contacts': instance.contacts,
      'qrCode': instance.qrCode,
      'bio': instance.bio,
      'companyName': instance.companyName,
      'coverVideo': instance.coverVideo,
      'designation': instance.designation,
      'profileImg': instance.profileImg,
      'username': instance.username,
      'domain': instance.domain,
    };

_$PlanImpl _$$PlanImplFromJson(Map<String, dynamic> json) => _$PlanImpl(
      planType: json['planType'] as String?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$$PlanImplToJson(_$PlanImpl instance) =>
    <String, dynamic>{
      'planType': instance.planType,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'active': instance.active,
    };

_$CustomBrandingImpl _$$CustomBrandingImplFromJson(Map<String, dynamic> json) =>
    _$CustomBrandingImpl(
      customTheme: json['customTheme'] == null
          ? null
          : CustomTheme.fromJson(json['customTheme'] as Map<String, dynamic>),
      color: json['color'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$CustomBrandingImplToJson(
        _$CustomBrandingImpl instance) =>
    <String, dynamic>{
      'customTheme': instance.customTheme,
      'color': instance.color,
      'image': instance.image,
    };

_$CustomThemeImpl _$$CustomThemeImplFromJson(Map<String, dynamic> json) =>
    _$CustomThemeImpl(
      color1: json['color1'] as String?,
      color2: json['color2'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$$CustomThemeImplToJson(_$CustomThemeImpl instance) =>
    <String, dynamic>{
      'color1': instance.color1,
      'color2': instance.color2,
      'logo': instance.logo,
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

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      user: json['user'] as String?,
      favorite: json['favorite'] as bool?,
      fcm: json['fcm'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'favorite': instance.favorite,
      'fcm': instance.fcm,
      '_id': instance.id,
    };
