// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditProfileLinkRequest _$EditProfileLinkRequestFromJson(
    Map<String, dynamic> json) {
  return _EditProfileLinkRequest.fromJson(json);
}

/// @nodoc
mixin _$EditProfileLinkRequest {
  String? get username => throw _privateConstructorUsedError;

  /// Serializes this EditProfileLinkRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditProfileLinkRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditProfileLinkRequestCopyWith<EditProfileLinkRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileLinkRequestCopyWith<$Res> {
  factory $EditProfileLinkRequestCopyWith(EditProfileLinkRequest value,
          $Res Function(EditProfileLinkRequest) then) =
      _$EditProfileLinkRequestCopyWithImpl<$Res, EditProfileLinkRequest>;
  @useResult
  $Res call({String? username});
}

/// @nodoc
class _$EditProfileLinkRequestCopyWithImpl<$Res,
        $Val extends EditProfileLinkRequest>
    implements $EditProfileLinkRequestCopyWith<$Res> {
  _$EditProfileLinkRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditProfileLinkRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditProfileLinkRequestImplCopyWith<$Res>
    implements $EditProfileLinkRequestCopyWith<$Res> {
  factory _$$EditProfileLinkRequestImplCopyWith(
          _$EditProfileLinkRequestImpl value,
          $Res Function(_$EditProfileLinkRequestImpl) then) =
      __$$EditProfileLinkRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? username});
}

/// @nodoc
class __$$EditProfileLinkRequestImplCopyWithImpl<$Res>
    extends _$EditProfileLinkRequestCopyWithImpl<$Res,
        _$EditProfileLinkRequestImpl>
    implements _$$EditProfileLinkRequestImplCopyWith<$Res> {
  __$$EditProfileLinkRequestImplCopyWithImpl(
      _$EditProfileLinkRequestImpl _value,
      $Res Function(_$EditProfileLinkRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditProfileLinkRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
  }) {
    return _then(_$EditProfileLinkRequestImpl(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditProfileLinkRequestImpl implements _EditProfileLinkRequest {
  const _$EditProfileLinkRequestImpl({this.username});

  factory _$EditProfileLinkRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditProfileLinkRequestImplFromJson(json);

  @override
  final String? username;

  @override
  String toString() {
    return 'EditProfileLinkRequest(username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileLinkRequestImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username);

  /// Create a copy of EditProfileLinkRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileLinkRequestImplCopyWith<_$EditProfileLinkRequestImpl>
      get copyWith => __$$EditProfileLinkRequestImplCopyWithImpl<
          _$EditProfileLinkRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditProfileLinkRequestImplToJson(
      this,
    );
  }
}

abstract class _EditProfileLinkRequest implements EditProfileLinkRequest {
  const factory _EditProfileLinkRequest({final String? username}) =
      _$EditProfileLinkRequestImpl;

  factory _EditProfileLinkRequest.fromJson(Map<String, dynamic> json) =
      _$EditProfileLinkRequestImpl.fromJson;

  @override
  String? get username;

  /// Create a copy of EditProfileLinkRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditProfileLinkRequestImplCopyWith<_$EditProfileLinkRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
