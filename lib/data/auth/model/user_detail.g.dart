// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailResponseImpl _$$UserDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDetailResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      user: json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserDetailResponseImplToJson(
        _$UserDetailResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'User': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      designation: json['designation'] as String?,
      bio: json['bio'] as String?,
      profileImg: json['profileImg'] as String?,
      coverVideo: json['coverVideo'] as String?,
      qrCode: json['qrCode'] as String?,
      companyName: json['companyName'] as String?,
      active: json['active'] as bool?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: json['color'] == null
          ? null
          : Color.fromJson(json['color'] as Map<String, dynamic>),
      theme: json['theme'] as bool?,
      lang: json['lang'] as String?,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      gainLeads: json['gainLeads'] as bool?,
      quickIntro: json['quickIntro'] as bool?,
      helloDirect: json['helloDirect'] as bool?,
      customServices: (json['customServices'] as List<dynamic>?)
          ?.map((e) => CustomService.fromJson(e as Map<String, dynamic>))
          .toList(),
      helloService: json['helloService'] == null
          ? null
          : HelloService.fromJson(json['helloService'] as Map<String, dynamic>),
      isPro: json['isPro'] as bool?,
      isProPlus: json['isProPlus'] as bool?,
      isMobileVerified: json['isMobileVerified'] as bool?,
      isCustomBranding: json['isCustomBranding'] as bool?,
      customBranding: json['customBranding'] == null
          ? null
          : CustomBranding.fromJson(
              json['customBranding'] as Map<String, dynamic>),
      username: json['username'] as String?,
      cards:
          (json['cards'] as List<dynamic>?)?.map((e) => e as String).toList(),
      plan: json['plan'] == null
          ? null
          : Plan.fromJson(json['plan'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'designation': instance.designation,
      'bio': instance.bio,
      'profileImg': instance.profileImg,
      'coverVideo': instance.coverVideo,
      'qrCode': instance.qrCode,
      'companyName': instance.companyName,
      'active': instance.active,
      'services': instance.services,
      'color': instance.color,
      'theme': instance.theme,
      'lang': instance.lang,
      'contacts': instance.contacts,
      'gainLeads': instance.gainLeads,
      'quickIntro': instance.quickIntro,
      'helloDirect': instance.helloDirect,
      'customServices': instance.customServices,
      'helloService': instance.helloService,
      'isPro': instance.isPro,
      'isProPlus': instance.isProPlus,
      'isMobileVerified': instance.isMobileVerified,
      'isCustomBranding': instance.isCustomBranding,
      'customBranding': instance.customBranding,
      'username': instance.username,
      'cards': instance.cards,
      'plan': instance.plan,
      'type': instance.type,
    };

_$PlanImpl _$$PlanImplFromJson(Map<String, dynamic> json) => _$PlanImpl(
      planType: json['planType'] == null
          ? null
          : PlanType.fromJson(json['planType'] as Map<String, dynamic>),
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

_$PlanTypeImpl _$$PlanTypeImplFromJson(Map<String, dynamic> json) =>
    _$PlanTypeImpl(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      active: json['active'] as bool?,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PlanTypeImplToJson(_$PlanTypeImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'active': instance.active,
      'features': instance.features,
    };

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      name: json['name'] as String?,
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => Value.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

_$ValueImpl _$$ValueImplFromJson(Map<String, dynamic> json) => _$ValueImpl(
      service: json['service'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
      orderId: (json['orderId'] as num?)?.toInt(),
      active: json['active'] as bool?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$ValueImplToJson(_$ValueImpl instance) =>
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

_$CustomBrandingImpl _$$CustomBrandingImplFromJson(Map<String, dynamic> json) =>
    _$CustomBrandingImpl(
      color: json['color'] as String?,
      image: json['image'] as String?,
      customTheme: json['customTheme'] == null
          ? null
          : CustomTheme.fromJson(json['customTheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomBrandingImplToJson(
        _$CustomBrandingImpl instance) =>
    <String, dynamic>{
      'color': instance.color,
      'image': instance.image,
      'customTheme': instance.customTheme,
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

_$HelloServiceImpl _$$HelloServiceImplFromJson(Map<String, dynamic> json) =>
    _$HelloServiceImpl(
      service: json['service'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      logo: json['logo'] as String?,
      orderId: (json['orderId'] as num?)?.toInt(),
      active: json['active'] as bool?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$HelloServiceImplToJson(_$HelloServiceImpl instance) =>
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
