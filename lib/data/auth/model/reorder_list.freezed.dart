// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reorder_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReorderRequest _$ReorderRequestFromJson(Map<String, dynamic> json) {
  return _ReorderRequest.fromJson(json);
}

/// @nodoc
mixin _$ReorderRequest {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  int? get orderId => throw _privateConstructorUsedError;

  /// Serializes this ReorderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReorderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReorderRequestCopyWith<ReorderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReorderRequestCopyWith<$Res> {
  factory $ReorderRequestCopyWith(
          ReorderRequest value, $Res Function(ReorderRequest) then) =
      _$ReorderRequestCopyWithImpl<$Res, ReorderRequest>;
  @useResult
  $Res call({@JsonKey(name: "_id") String? id, int? orderId});
}

/// @nodoc
class _$ReorderRequestCopyWithImpl<$Res, $Val extends ReorderRequest>
    implements $ReorderRequestCopyWith<$Res> {
  _$ReorderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReorderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReorderRequestImplCopyWith<$Res>
    implements $ReorderRequestCopyWith<$Res> {
  factory _$$ReorderRequestImplCopyWith(_$ReorderRequestImpl value,
          $Res Function(_$ReorderRequestImpl) then) =
      __$$ReorderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String? id, int? orderId});
}

/// @nodoc
class __$$ReorderRequestImplCopyWithImpl<$Res>
    extends _$ReorderRequestCopyWithImpl<$Res, _$ReorderRequestImpl>
    implements _$$ReorderRequestImplCopyWith<$Res> {
  __$$ReorderRequestImplCopyWithImpl(
      _$ReorderRequestImpl _value, $Res Function(_$ReorderRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReorderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
  }) {
    return _then(_$ReorderRequestImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReorderRequestImpl implements _ReorderRequest {
  const _$ReorderRequestImpl({@JsonKey(name: "_id") this.id, this.orderId});

  factory _$ReorderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReorderRequestImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final int? orderId;

  @override
  String toString() {
    return 'ReorderRequest(id: $id, orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReorderRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, orderId);

  /// Create a copy of ReorderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReorderRequestImplCopyWith<_$ReorderRequestImpl> get copyWith =>
      __$$ReorderRequestImplCopyWithImpl<_$ReorderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReorderRequestImplToJson(
      this,
    );
  }
}

abstract class _ReorderRequest implements ReorderRequest {
  const factory _ReorderRequest(
      {@JsonKey(name: "_id") final String? id,
      final int? orderId}) = _$ReorderRequestImpl;

  factory _ReorderRequest.fromJson(Map<String, dynamic> json) =
      _$ReorderRequestImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  int? get orderId;

  /// Create a copy of ReorderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReorderRequestImplCopyWith<_$ReorderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
