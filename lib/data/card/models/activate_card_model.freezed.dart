// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activate_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivateCardRequest _$ActivateCardRequestFromJson(Map<String, dynamic> json) {
  return _ActivateCardRequest.fromJson(json);
}

/// @nodoc
mixin _$ActivateCardRequest {
  @JsonKey(name: "card_id")
  String? get cardId => throw _privateConstructorUsedError;

  /// Serializes this ActivateCardRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivateCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivateCardRequestCopyWith<ActivateCardRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivateCardRequestCopyWith<$Res> {
  factory $ActivateCardRequestCopyWith(
          ActivateCardRequest value, $Res Function(ActivateCardRequest) then) =
      _$ActivateCardRequestCopyWithImpl<$Res, ActivateCardRequest>;
  @useResult
  $Res call({@JsonKey(name: "card_id") String? cardId});
}

/// @nodoc
class _$ActivateCardRequestCopyWithImpl<$Res, $Val extends ActivateCardRequest>
    implements $ActivateCardRequestCopyWith<$Res> {
  _$ActivateCardRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivateCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
  }) {
    return _then(_value.copyWith(
      cardId: freezed == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivateCardRequestImplCopyWith<$Res>
    implements $ActivateCardRequestCopyWith<$Res> {
  factory _$$ActivateCardRequestImplCopyWith(_$ActivateCardRequestImpl value,
          $Res Function(_$ActivateCardRequestImpl) then) =
      __$$ActivateCardRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "card_id") String? cardId});
}

/// @nodoc
class __$$ActivateCardRequestImplCopyWithImpl<$Res>
    extends _$ActivateCardRequestCopyWithImpl<$Res, _$ActivateCardRequestImpl>
    implements _$$ActivateCardRequestImplCopyWith<$Res> {
  __$$ActivateCardRequestImplCopyWithImpl(_$ActivateCardRequestImpl _value,
      $Res Function(_$ActivateCardRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivateCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
  }) {
    return _then(_$ActivateCardRequestImpl(
      cardId: freezed == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivateCardRequestImpl implements _ActivateCardRequest {
  const _$ActivateCardRequestImpl({@JsonKey(name: "card_id") this.cardId});

  factory _$ActivateCardRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivateCardRequestImplFromJson(json);

  @override
  @JsonKey(name: "card_id")
  final String? cardId;

  @override
  String toString() {
    return 'ActivateCardRequest(cardId: $cardId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivateCardRequestImpl &&
            (identical(other.cardId, cardId) || other.cardId == cardId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cardId);

  /// Create a copy of ActivateCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivateCardRequestImplCopyWith<_$ActivateCardRequestImpl> get copyWith =>
      __$$ActivateCardRequestImplCopyWithImpl<_$ActivateCardRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivateCardRequestImplToJson(
      this,
    );
  }
}

abstract class _ActivateCardRequest implements ActivateCardRequest {
  const factory _ActivateCardRequest(
          {@JsonKey(name: "card_id") final String? cardId}) =
      _$ActivateCardRequestImpl;

  factory _ActivateCardRequest.fromJson(Map<String, dynamic> json) =
      _$ActivateCardRequestImpl.fromJson;

  @override
  @JsonKey(name: "card_id")
  String? get cardId;

  /// Create a copy of ActivateCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivateCardRequestImplCopyWith<_$ActivateCardRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActivateCardResponse _$ActivateCardResponseFromJson(Map<String, dynamic> json) {
  return _ActivateCardResponse.fromJson(json);
}

/// @nodoc
mixin _$ActivateCardResponse {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get success => throw _privateConstructorUsedError;

  /// Serializes this ActivateCardResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivateCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivateCardResponseCopyWith<ActivateCardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivateCardResponseCopyWith<$Res> {
  factory $ActivateCardResponseCopyWith(ActivateCardResponse value,
          $Res Function(ActivateCardResponse) then) =
      _$ActivateCardResponseCopyWithImpl<$Res, ActivateCardResponse>;
  @useResult
  $Res call({String? name, String? email, String? phone, String? success});
}

/// @nodoc
class _$ActivateCardResponseCopyWithImpl<$Res,
        $Val extends ActivateCardResponse>
    implements $ActivateCardResponseCopyWith<$Res> {
  _$ActivateCardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivateCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivateCardResponseImplCopyWith<$Res>
    implements $ActivateCardResponseCopyWith<$Res> {
  factory _$$ActivateCardResponseImplCopyWith(_$ActivateCardResponseImpl value,
          $Res Function(_$ActivateCardResponseImpl) then) =
      __$$ActivateCardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? email, String? phone, String? success});
}

/// @nodoc
class __$$ActivateCardResponseImplCopyWithImpl<$Res>
    extends _$ActivateCardResponseCopyWithImpl<$Res, _$ActivateCardResponseImpl>
    implements _$$ActivateCardResponseImplCopyWith<$Res> {
  __$$ActivateCardResponseImplCopyWithImpl(_$ActivateCardResponseImpl _value,
      $Res Function(_$ActivateCardResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivateCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? success = freezed,
  }) {
    return _then(_$ActivateCardResponseImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivateCardResponseImpl implements _ActivateCardResponse {
  const _$ActivateCardResponseImpl(
      {this.name, this.email, this.phone, this.success});

  factory _$ActivateCardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivateCardResponseImplFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? success;

  @override
  String toString() {
    return 'ActivateCardResponse(name: $name, email: $email, phone: $phone, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivateCardResponseImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, phone, success);

  /// Create a copy of ActivateCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivateCardResponseImplCopyWith<_$ActivateCardResponseImpl>
      get copyWith =>
          __$$ActivateCardResponseImplCopyWithImpl<_$ActivateCardResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivateCardResponseImplToJson(
      this,
    );
  }
}

abstract class _ActivateCardResponse implements ActivateCardResponse {
  const factory _ActivateCardResponse(
      {final String? name,
      final String? email,
      final String? phone,
      final String? success}) = _$ActivateCardResponseImpl;

  factory _ActivateCardResponse.fromJson(Map<String, dynamic> json) =
      _$ActivateCardResponseImpl.fromJson;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get success;

  /// Create a copy of ActivateCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivateCardResponseImplCopyWith<_$ActivateCardResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
