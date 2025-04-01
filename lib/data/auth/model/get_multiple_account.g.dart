// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_multiple_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetMultipleAccountsResponseImpl _$$GetMultipleAccountsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetMultipleAccountsResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      count: (json['count'] as num?)?.toInt(),
      accounts: (json['accounts'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetMultipleAccountsResponseImplToJson(
        _$GetMultipleAccountsResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'count': instance.count,
      'accounts': instance.accounts,
    };

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
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
      type: json['type'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      isMobileVerified: json['isMobileVerified'] as bool?,
      designation: json['designation'] as String?,
      bio: json['bio'] as String?,
      profileImg: json['profileImg'] as String?,
      coverVideo: json['coverVideo'] as String?,
      qrCode: json['qrCode'] as String?,
      companyName: json['companyName'] as String?,
      cards:
          (json['cards'] as List<dynamic>?)?.map((e) => e as String).toList(),
      active: json['active'] as bool?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      customServices: (json['customServices'] as List<dynamic>?)
          ?.map((e) => CustomService.fromJson(e as Map<String, dynamic>))
          .toList(),
      theme: json['theme'] as bool?,
      gainLeads: json['gainLeads'] as bool?,
      quickIntro: json['quickIntro'] as bool?,
      isCustomBranding: json['isCustomBranding'] as bool?,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      helloDirect: json['helloDirect'] as bool?,
      color: json['color'] == null
          ? null
          : Color.fromJson(json['color'] as Map<String, dynamic>),
      isPro: json['isPro'] as bool?,
      isProPlus: json['isProPlus'] as bool?,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'plan': instance.plan,
      'customBranding': instance.customBranding,
      '_id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'type': instance.type,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'isMobileVerified': instance.isMobileVerified,
      'designation': instance.designation,
      'bio': instance.bio,
      'profileImg': instance.profileImg,
      'coverVideo': instance.coverVideo,
      'qrCode': instance.qrCode,
      'companyName': instance.companyName,
      'cards': instance.cards,
      'active': instance.active,
      'services': instance.services,
      'customServices': instance.customServices,
      'theme': instance.theme,
      'gainLeads': instance.gainLeads,
      'quickIntro': instance.quickIntro,
      'isCustomBranding': instance.isCustomBranding,
      'contacts': instance.contacts,
      'helloDirect': instance.helloDirect,
      'color': instance.color,
      'isPro': instance.isPro,
      'isProPlus': instance.isProPlus,
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

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      user: json['user'] as String?,
      favorite: json['favorite'] as bool?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'favorite': instance.favorite,
      '_id': instance.id,
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

_$CreatgeMultipleAccountRequestImpl
    _$$CreatgeMultipleAccountRequestImplFromJson(Map<String, dynamic> json) =>
        _$CreatgeMultipleAccountRequestImpl(
          name: json['name'] as String?,
        );

Map<String, dynamic> _$$CreatgeMultipleAccountRequestImplToJson(
        _$CreatgeMultipleAccountRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
