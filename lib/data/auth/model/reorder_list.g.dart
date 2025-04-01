// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reorder_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReorderRequestImpl _$$ReorderRequestImplFromJson(Map<String, dynamic> json) =>
    _$ReorderRequestImpl(
      id: json['_id'] as String?,
      orderId: (json['orderId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReorderRequestImplToJson(
        _$ReorderRequestImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'orderId': instance.orderId,
    };
