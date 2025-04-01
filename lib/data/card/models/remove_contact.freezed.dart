// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remove_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoveConnectRequest _$RemoveConnectRequestFromJson(Map<String, dynamic> json) {
  return _RemoveConnectRequest.fromJson(json);
}

/// @nodoc
mixin _$RemoveConnectRequest {
  String? get userId => throw _privateConstructorUsedError;
  String? get connectUserId => throw _privateConstructorUsedError;

  /// Serializes this RemoveConnectRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemoveConnectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoveConnectRequestCopyWith<RemoveConnectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveConnectRequestCopyWith<$Res> {
  factory $RemoveConnectRequestCopyWith(RemoveConnectRequest value,
          $Res Function(RemoveConnectRequest) then) =
      _$RemoveConnectRequestCopyWithImpl<$Res, RemoveConnectRequest>;
  @useResult
  $Res call({String? userId, String? connectUserId});
}

/// @nodoc
class _$RemoveConnectRequestCopyWithImpl<$Res,
        $Val extends RemoveConnectRequest>
    implements $RemoveConnectRequestCopyWith<$Res> {
  _$RemoveConnectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoveConnectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? connectUserId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      connectUserId: freezed == connectUserId
          ? _value.connectUserId
          : connectUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoveConnectRequestImplCopyWith<$Res>
    implements $RemoveConnectRequestCopyWith<$Res> {
  factory _$$RemoveConnectRequestImplCopyWith(_$RemoveConnectRequestImpl value,
          $Res Function(_$RemoveConnectRequestImpl) then) =
      __$$RemoveConnectRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, String? connectUserId});
}

/// @nodoc
class __$$RemoveConnectRequestImplCopyWithImpl<$Res>
    extends _$RemoveConnectRequestCopyWithImpl<$Res, _$RemoveConnectRequestImpl>
    implements _$$RemoveConnectRequestImplCopyWith<$Res> {
  __$$RemoveConnectRequestImplCopyWithImpl(_$RemoveConnectRequestImpl _value,
      $Res Function(_$RemoveConnectRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoveConnectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? connectUserId = freezed,
  }) {
    return _then(_$RemoveConnectRequestImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      connectUserId: freezed == connectUserId
          ? _value.connectUserId
          : connectUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoveConnectRequestImpl implements _RemoveConnectRequest {
  const _$RemoveConnectRequestImpl({this.userId, this.connectUserId});

  factory _$RemoveConnectRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoveConnectRequestImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? connectUserId;

  @override
  String toString() {
    return 'RemoveConnectRequest(userId: $userId, connectUserId: $connectUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveConnectRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.connectUserId, connectUserId) ||
                other.connectUserId == connectUserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, connectUserId);

  /// Create a copy of RemoveConnectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveConnectRequestImplCopyWith<_$RemoveConnectRequestImpl>
      get copyWith =>
          __$$RemoveConnectRequestImplCopyWithImpl<_$RemoveConnectRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoveConnectRequestImplToJson(
      this,
    );
  }
}

abstract class _RemoveConnectRequest implements RemoveConnectRequest {
  const factory _RemoveConnectRequest(
      {final String? userId,
      final String? connectUserId}) = _$RemoveConnectRequestImpl;

  factory _RemoveConnectRequest.fromJson(Map<String, dynamic> json) =
      _$RemoveConnectRequestImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get connectUserId;

  /// Create a copy of RemoveConnectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveConnectRequestImplCopyWith<_$RemoveConnectRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
