// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_plans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPlanResponseImpl _$$GetPlanResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetPlanResponseImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      plans: (json['plans'] as List<dynamic>?)
          ?.map((e) => Plan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetPlanResponseImplToJson(
        _$GetPlanResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'plans': instance.plans,
    };

_$PlanImpl _$$PlanImplFromJson(Map<String, dynamic> json) => _$PlanImpl(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      mrp: (json['mrp'] as num?)?.toInt(),
      duration: json['duration'] as String?,
      shortBenefits: (json['shortBenefits'] as List<dynamic>?)
          ?.map((e) => Benefit.fromJson(e as Map<String, dynamic>))
          .toList(),
      benefits: (json['benefits'] as List<dynamic>?)
          ?.map((e) => Benefit.fromJson(e as Map<String, dynamic>))
          .toList(),
      active: json['active'] as bool?,
      v: (json['__v'] as num?)?.toInt(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      monthlyPrice: (json['monthlyPrice'] as num?)?.toInt(),
      yearlyPrice: (json['yearlyPrice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PlanImplToJson(_$PlanImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'mrp': instance.mrp,
      'duration': instance.duration,
      'shortBenefits': instance.shortBenefits,
      'benefits': instance.benefits,
      'active': instance.active,
      '__v': instance.v,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'features': instance.features,
      'monthlyPrice': instance.monthlyPrice,
      'yearlyPrice': instance.yearlyPrice,
    };

_$BenefitImpl _$$BenefitImplFromJson(Map<String, dynamic> json) =>
    _$BenefitImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$BenefitImplToJson(_$BenefitImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      '_id': instance.id,
    };
