// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddServiceRequest _$AddServiceRequestFromJson(Map<String, dynamic> json) {
  return _AddServiceRequest.fromJson(json);
}

/// @nodoc
mixin _$AddServiceRequest {
  String? get serviceId => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  /// Serializes this AddServiceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddServiceRequestCopyWith<AddServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddServiceRequestCopyWith<$Res> {
  factory $AddServiceRequestCopyWith(
          AddServiceRequest value, $Res Function(AddServiceRequest) then) =
      _$AddServiceRequestCopyWithImpl<$Res, AddServiceRequest>;
  @useResult
  $Res call({String? serviceId, String? content});
}

/// @nodoc
class _$AddServiceRequestCopyWithImpl<$Res, $Val extends AddServiceRequest>
    implements $AddServiceRequestCopyWith<$Res> {
  _$AddServiceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddServiceRequestImplCopyWith<$Res>
    implements $AddServiceRequestCopyWith<$Res> {
  factory _$$AddServiceRequestImplCopyWith(_$AddServiceRequestImpl value,
          $Res Function(_$AddServiceRequestImpl) then) =
      __$$AddServiceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? serviceId, String? content});
}

/// @nodoc
class __$$AddServiceRequestImplCopyWithImpl<$Res>
    extends _$AddServiceRequestCopyWithImpl<$Res, _$AddServiceRequestImpl>
    implements _$$AddServiceRequestImplCopyWith<$Res> {
  __$$AddServiceRequestImplCopyWithImpl(_$AddServiceRequestImpl _value,
      $Res Function(_$AddServiceRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = freezed,
    Object? content = freezed,
  }) {
    return _then(_$AddServiceRequestImpl(
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddServiceRequestImpl implements _AddServiceRequest {
  const _$AddServiceRequestImpl({this.serviceId, this.content});

  factory _$AddServiceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddServiceRequestImplFromJson(json);

  @override
  final String? serviceId;
  @override
  final String? content;

  @override
  String toString() {
    return 'AddServiceRequest(serviceId: $serviceId, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddServiceRequestImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceId, content);

  /// Create a copy of AddServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddServiceRequestImplCopyWith<_$AddServiceRequestImpl> get copyWith =>
      __$$AddServiceRequestImplCopyWithImpl<_$AddServiceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddServiceRequestImplToJson(
      this,
    );
  }
}

abstract class _AddServiceRequest implements AddServiceRequest {
  const factory _AddServiceRequest(
      {final String? serviceId,
      final String? content}) = _$AddServiceRequestImpl;

  factory _AddServiceRequest.fromJson(Map<String, dynamic> json) =
      _$AddServiceRequestImpl.fromJson;

  @override
  String? get serviceId;
  @override
  String? get content;

  /// Create a copy of AddServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddServiceRequestImplCopyWith<_$AddServiceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddServiceResponse _$AddServiceResponseFromJson(Map<String, dynamic> json) {
  return _AddServiceResponse.fromJson(json);
}

/// @nodoc
mixin _$AddServiceResponse {
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  /// Serializes this AddServiceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddServiceResponseCopyWith<AddServiceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddServiceResponseCopyWith<$Res> {
  factory $AddServiceResponseCopyWith(
          AddServiceResponse value, $Res Function(AddServiceResponse) then) =
      _$AddServiceResponseCopyWithImpl<$Res, AddServiceResponse>;
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class _$AddServiceResponseCopyWithImpl<$Res, $Val extends AddServiceResponse>
    implements $AddServiceResponseCopyWith<$Res> {
  _$AddServiceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddServiceResponse
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
abstract class _$$AddServiceResponseImplCopyWith<$Res>
    implements $AddServiceResponseCopyWith<$Res> {
  factory _$$AddServiceResponseImplCopyWith(_$AddServiceResponseImpl value,
          $Res Function(_$AddServiceResponseImpl) then) =
      __$$AddServiceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class __$$AddServiceResponseImplCopyWithImpl<$Res>
    extends _$AddServiceResponseCopyWithImpl<$Res, _$AddServiceResponseImpl>
    implements _$$AddServiceResponseImplCopyWith<$Res> {
  __$$AddServiceResponseImplCopyWithImpl(_$AddServiceResponseImpl _value,
      $Res Function(_$AddServiceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_$AddServiceResponseImpl(
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
class _$AddServiceResponseImpl implements _AddServiceResponse {
  const _$AddServiceResponseImpl({this.message, this.success});

  factory _$AddServiceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddServiceResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? success;

  @override
  String toString() {
    return 'AddServiceResponse(message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddServiceResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, success);

  /// Create a copy of AddServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddServiceResponseImplCopyWith<_$AddServiceResponseImpl> get copyWith =>
      __$$AddServiceResponseImplCopyWithImpl<_$AddServiceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddServiceResponseImplToJson(
      this,
    );
  }
}

abstract class _AddServiceResponse implements AddServiceResponse {
  const factory _AddServiceResponse(
      {final String? message, final bool? success}) = _$AddServiceResponseImpl;

  factory _AddServiceResponse.fromJson(Map<String, dynamic> json) =
      _$AddServiceResponseImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get success;

  /// Create a copy of AddServiceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddServiceResponseImplCopyWith<_$AddServiceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
