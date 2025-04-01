// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_hello_direct.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddhelloDirectRequest _$AddhelloDirectRequestFromJson(
    Map<String, dynamic> json) {
  return _AddhelloDirectRequest.fromJson(json);
}

/// @nodoc
mixin _$AddhelloDirectRequest {
  String? get serviceId => throw _privateConstructorUsedError;

  /// Serializes this AddhelloDirectRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddhelloDirectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddhelloDirectRequestCopyWith<AddhelloDirectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddhelloDirectRequestCopyWith<$Res> {
  factory $AddhelloDirectRequestCopyWith(AddhelloDirectRequest value,
          $Res Function(AddhelloDirectRequest) then) =
      _$AddhelloDirectRequestCopyWithImpl<$Res, AddhelloDirectRequest>;
  @useResult
  $Res call({String? serviceId});
}

/// @nodoc
class _$AddhelloDirectRequestCopyWithImpl<$Res,
        $Val extends AddhelloDirectRequest>
    implements $AddhelloDirectRequestCopyWith<$Res> {
  _$AddhelloDirectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddhelloDirectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = freezed,
  }) {
    return _then(_value.copyWith(
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddhelloDirectRequestImplCopyWith<$Res>
    implements $AddhelloDirectRequestCopyWith<$Res> {
  factory _$$AddhelloDirectRequestImplCopyWith(
          _$AddhelloDirectRequestImpl value,
          $Res Function(_$AddhelloDirectRequestImpl) then) =
      __$$AddhelloDirectRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? serviceId});
}

/// @nodoc
class __$$AddhelloDirectRequestImplCopyWithImpl<$Res>
    extends _$AddhelloDirectRequestCopyWithImpl<$Res,
        _$AddhelloDirectRequestImpl>
    implements _$$AddhelloDirectRequestImplCopyWith<$Res> {
  __$$AddhelloDirectRequestImplCopyWithImpl(_$AddhelloDirectRequestImpl _value,
      $Res Function(_$AddhelloDirectRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddhelloDirectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = freezed,
  }) {
    return _then(_$AddhelloDirectRequestImpl(
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddhelloDirectRequestImpl implements _AddhelloDirectRequest {
  const _$AddhelloDirectRequestImpl({this.serviceId});

  factory _$AddhelloDirectRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddhelloDirectRequestImplFromJson(json);

  @override
  final String? serviceId;

  @override
  String toString() {
    return 'AddhelloDirectRequest(serviceId: $serviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddhelloDirectRequestImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceId);

  /// Create a copy of AddhelloDirectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddhelloDirectRequestImplCopyWith<_$AddhelloDirectRequestImpl>
      get copyWith => __$$AddhelloDirectRequestImplCopyWithImpl<
          _$AddhelloDirectRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddhelloDirectRequestImplToJson(
      this,
    );
  }
}

abstract class _AddhelloDirectRequest implements AddhelloDirectRequest {
  const factory _AddhelloDirectRequest({final String? serviceId}) =
      _$AddhelloDirectRequestImpl;

  factory _AddhelloDirectRequest.fromJson(Map<String, dynamic> json) =
      _$AddhelloDirectRequestImpl.fromJson;

  @override
  String? get serviceId;

  /// Create a copy of AddhelloDirectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddhelloDirectRequestImplCopyWith<_$AddhelloDirectRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
