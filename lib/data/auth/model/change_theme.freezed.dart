// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChangeThemeRequest _$ChangeThemeRequestFromJson(Map<String, dynamic> json) {
  return _ChangeThemeRequest.fromJson(json);
}

/// @nodoc
mixin _$ChangeThemeRequest {
  int? get index => throw _privateConstructorUsedError;

  /// Serializes this ChangeThemeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangeThemeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangeThemeRequestCopyWith<ChangeThemeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeThemeRequestCopyWith<$Res> {
  factory $ChangeThemeRequestCopyWith(
          ChangeThemeRequest value, $Res Function(ChangeThemeRequest) then) =
      _$ChangeThemeRequestCopyWithImpl<$Res, ChangeThemeRequest>;
  @useResult
  $Res call({int? index});
}

/// @nodoc
class _$ChangeThemeRequestCopyWithImpl<$Res, $Val extends ChangeThemeRequest>
    implements $ChangeThemeRequestCopyWith<$Res> {
  _$ChangeThemeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangeThemeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeThemeRequestImplCopyWith<$Res>
    implements $ChangeThemeRequestCopyWith<$Res> {
  factory _$$ChangeThemeRequestImplCopyWith(_$ChangeThemeRequestImpl value,
          $Res Function(_$ChangeThemeRequestImpl) then) =
      __$$ChangeThemeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? index});
}

/// @nodoc
class __$$ChangeThemeRequestImplCopyWithImpl<$Res>
    extends _$ChangeThemeRequestCopyWithImpl<$Res, _$ChangeThemeRequestImpl>
    implements _$$ChangeThemeRequestImplCopyWith<$Res> {
  __$$ChangeThemeRequestImplCopyWithImpl(_$ChangeThemeRequestImpl _value,
      $Res Function(_$ChangeThemeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangeThemeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$ChangeThemeRequestImpl(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangeThemeRequestImpl implements _ChangeThemeRequest {
  const _$ChangeThemeRequestImpl({this.index});

  factory _$ChangeThemeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangeThemeRequestImplFromJson(json);

  @override
  final int? index;

  @override
  String toString() {
    return 'ChangeThemeRequest(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeThemeRequestImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of ChangeThemeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeThemeRequestImplCopyWith<_$ChangeThemeRequestImpl> get copyWith =>
      __$$ChangeThemeRequestImplCopyWithImpl<_$ChangeThemeRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangeThemeRequestImplToJson(
      this,
    );
  }
}

abstract class _ChangeThemeRequest implements ChangeThemeRequest {
  const factory _ChangeThemeRequest({final int? index}) =
      _$ChangeThemeRequestImpl;

  factory _ChangeThemeRequest.fromJson(Map<String, dynamic> json) =
      _$ChangeThemeRequestImpl.fromJson;

  @override
  int? get index;

  /// Create a copy of ChangeThemeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeThemeRequestImplCopyWith<_$ChangeThemeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChangeThemeResponse _$ChangeThemeResponseFromJson(Map<String, dynamic> json) {
  return _ChangeThemeResponse.fromJson(json);
}

/// @nodoc
mixin _$ChangeThemeResponse {
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  /// Serializes this ChangeThemeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangeThemeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangeThemeResponseCopyWith<ChangeThemeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeThemeResponseCopyWith<$Res> {
  factory $ChangeThemeResponseCopyWith(
          ChangeThemeResponse value, $Res Function(ChangeThemeResponse) then) =
      _$ChangeThemeResponseCopyWithImpl<$Res, ChangeThemeResponse>;
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class _$ChangeThemeResponseCopyWithImpl<$Res, $Val extends ChangeThemeResponse>
    implements $ChangeThemeResponseCopyWith<$Res> {
  _$ChangeThemeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangeThemeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeThemeResponseImplCopyWith<$Res>
    implements $ChangeThemeResponseCopyWith<$Res> {
  factory _$$ChangeThemeResponseImplCopyWith(_$ChangeThemeResponseImpl value,
          $Res Function(_$ChangeThemeResponseImpl) then) =
      __$$ChangeThemeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class __$$ChangeThemeResponseImplCopyWithImpl<$Res>
    extends _$ChangeThemeResponseCopyWithImpl<$Res, _$ChangeThemeResponseImpl>
    implements _$$ChangeThemeResponseImplCopyWith<$Res> {
  __$$ChangeThemeResponseImplCopyWithImpl(_$ChangeThemeResponseImpl _value,
      $Res Function(_$ChangeThemeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangeThemeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_$ChangeThemeResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangeThemeResponseImpl implements _ChangeThemeResponse {
  const _$ChangeThemeResponseImpl({this.message, this.success});

  factory _$ChangeThemeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangeThemeResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? success;

  @override
  String toString() {
    return 'ChangeThemeResponse(message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeThemeResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, success);

  /// Create a copy of ChangeThemeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeThemeResponseImplCopyWith<_$ChangeThemeResponseImpl> get copyWith =>
      __$$ChangeThemeResponseImplCopyWithImpl<_$ChangeThemeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangeThemeResponseImplToJson(
      this,
    );
  }
}

abstract class _ChangeThemeResponse implements ChangeThemeResponse {
  const factory _ChangeThemeResponse(
      {final String? message, final bool? success}) = _$ChangeThemeResponseImpl;

  factory _ChangeThemeResponse.fromJson(Map<String, dynamic> json) =
      _$ChangeThemeResponseImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get success;

  /// Create a copy of ChangeThemeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeThemeResponseImplCopyWith<_$ChangeThemeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
