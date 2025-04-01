// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_contact_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContactCardRequest _$ContactCardRequestFromJson(Map<String, dynamic> json) {
  return _ContactCardRequest.fromJson(json);
}

/// @nodoc
mixin _$ContactCardRequest {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "cmpName")
  String? get cmpName => throw _privateConstructorUsedError;
  @JsonKey(name: "designation")
  String? get designation => throw _privateConstructorUsedError;
  @JsonKey(name: "mobile")
  String? get mobile => throw _privateConstructorUsedError;

  /// Serializes this ContactCardRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactCardRequestCopyWith<ContactCardRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCardRequestCopyWith<$Res> {
  factory $ContactCardRequestCopyWith(
          ContactCardRequest value, $Res Function(ContactCardRequest) then) =
      _$ContactCardRequestCopyWithImpl<$Res, ContactCardRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "cmpName") String? cmpName,
      @JsonKey(name: "designation") String? designation,
      @JsonKey(name: "mobile") String? mobile});
}

/// @nodoc
class _$ContactCardRequestCopyWithImpl<$Res, $Val extends ContactCardRequest>
    implements $ContactCardRequestCopyWith<$Res> {
  _$ContactCardRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? cmpName = freezed,
    Object? designation = freezed,
    Object? mobile = freezed,
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
      cmpName: freezed == cmpName
          ? _value.cmpName
          : cmpName // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactCardRequestImplCopyWith<$Res>
    implements $ContactCardRequestCopyWith<$Res> {
  factory _$$ContactCardRequestImplCopyWith(_$ContactCardRequestImpl value,
          $Res Function(_$ContactCardRequestImpl) then) =
      __$$ContactCardRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "cmpName") String? cmpName,
      @JsonKey(name: "designation") String? designation,
      @JsonKey(name: "mobile") String? mobile});
}

/// @nodoc
class __$$ContactCardRequestImplCopyWithImpl<$Res>
    extends _$ContactCardRequestCopyWithImpl<$Res, _$ContactCardRequestImpl>
    implements _$$ContactCardRequestImplCopyWith<$Res> {
  __$$ContactCardRequestImplCopyWithImpl(_$ContactCardRequestImpl _value,
      $Res Function(_$ContactCardRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? cmpName = freezed,
    Object? designation = freezed,
    Object? mobile = freezed,
  }) {
    return _then(_$ContactCardRequestImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      cmpName: freezed == cmpName
          ? _value.cmpName
          : cmpName // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactCardRequestImpl implements _ContactCardRequest {
  const _$ContactCardRequestImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "cmpName") this.cmpName,
      @JsonKey(name: "designation") this.designation,
      @JsonKey(name: "mobile") this.mobile});

  factory _$ContactCardRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactCardRequestImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "cmpName")
  final String? cmpName;
  @override
  @JsonKey(name: "designation")
  final String? designation;
  @override
  @JsonKey(name: "mobile")
  final String? mobile;

  @override
  String toString() {
    return 'ContactCardRequest(name: $name, email: $email, cmpName: $cmpName, designation: $designation, mobile: $mobile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactCardRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.cmpName, cmpName) || other.cmpName == cmpName) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.mobile, mobile) || other.mobile == mobile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, cmpName, designation, mobile);

  /// Create a copy of ContactCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactCardRequestImplCopyWith<_$ContactCardRequestImpl> get copyWith =>
      __$$ContactCardRequestImplCopyWithImpl<_$ContactCardRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactCardRequestImplToJson(
      this,
    );
  }
}

abstract class _ContactCardRequest implements ContactCardRequest {
  const factory _ContactCardRequest(
          {@JsonKey(name: "name") final String? name,
          @JsonKey(name: "email") final String? email,
          @JsonKey(name: "cmpName") final String? cmpName,
          @JsonKey(name: "designation") final String? designation,
          @JsonKey(name: "mobile") final String? mobile}) =
      _$ContactCardRequestImpl;

  factory _ContactCardRequest.fromJson(Map<String, dynamic> json) =
      _$ContactCardRequestImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "cmpName")
  String? get cmpName;
  @override
  @JsonKey(name: "designation")
  String? get designation;
  @override
  @JsonKey(name: "mobile")
  String? get mobile;

  /// Create a copy of ContactCardRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactCardRequestImplCopyWith<_$ContactCardRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
