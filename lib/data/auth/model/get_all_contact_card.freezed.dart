// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_contact_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContactCardResponse _$ContactCardResponseFromJson(Map<String, dynamic> json) {
  return _ContactCardResponse.fromJson(json);
}

/// @nodoc
mixin _$ContactCardResponse {
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "success")
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: "contactCards")
  List<ContactCard>? get contactCards => throw _privateConstructorUsedError;

  /// Serializes this ContactCardResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactCardResponseCopyWith<ContactCardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCardResponseCopyWith<$Res> {
  factory $ContactCardResponseCopyWith(
          ContactCardResponse value, $Res Function(ContactCardResponse) then) =
      _$ContactCardResponseCopyWithImpl<$Res, ContactCardResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "message") String? message,
      @JsonKey(name: "success") bool? success,
      @JsonKey(name: "contactCards") List<ContactCard>? contactCards});
}

/// @nodoc
class _$ContactCardResponseCopyWithImpl<$Res, $Val extends ContactCardResponse>
    implements $ContactCardResponseCopyWith<$Res> {
  _$ContactCardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? contactCards = freezed,
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
      contactCards: freezed == contactCards
          ? _value.contactCards
          : contactCards // ignore: cast_nullable_to_non_nullable
              as List<ContactCard>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactCardResponseImplCopyWith<$Res>
    implements $ContactCardResponseCopyWith<$Res> {
  factory _$$ContactCardResponseImplCopyWith(_$ContactCardResponseImpl value,
          $Res Function(_$ContactCardResponseImpl) then) =
      __$$ContactCardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "message") String? message,
      @JsonKey(name: "success") bool? success,
      @JsonKey(name: "contactCards") List<ContactCard>? contactCards});
}

/// @nodoc
class __$$ContactCardResponseImplCopyWithImpl<$Res>
    extends _$ContactCardResponseCopyWithImpl<$Res, _$ContactCardResponseImpl>
    implements _$$ContactCardResponseImplCopyWith<$Res> {
  __$$ContactCardResponseImplCopyWithImpl(_$ContactCardResponseImpl _value,
      $Res Function(_$ContactCardResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? contactCards = freezed,
  }) {
    return _then(_$ContactCardResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      contactCards: freezed == contactCards
          ? _value._contactCards
          : contactCards // ignore: cast_nullable_to_non_nullable
              as List<ContactCard>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactCardResponseImpl implements _ContactCardResponse {
  const _$ContactCardResponseImpl(
      {@JsonKey(name: "message") this.message,
      @JsonKey(name: "success") this.success,
      @JsonKey(name: "contactCards") final List<ContactCard>? contactCards})
      : _contactCards = contactCards;

  factory _$ContactCardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactCardResponseImplFromJson(json);

  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "success")
  final bool? success;
  final List<ContactCard>? _contactCards;
  @override
  @JsonKey(name: "contactCards")
  List<ContactCard>? get contactCards {
    final value = _contactCards;
    if (value == null) return null;
    if (_contactCards is EqualUnmodifiableListView) return _contactCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ContactCardResponse(message: $message, success: $success, contactCards: $contactCards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactCardResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other._contactCards, _contactCards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, success,
      const DeepCollectionEquality().hash(_contactCards));

  /// Create a copy of ContactCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactCardResponseImplCopyWith<_$ContactCardResponseImpl> get copyWith =>
      __$$ContactCardResponseImplCopyWithImpl<_$ContactCardResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactCardResponseImplToJson(
      this,
    );
  }
}

abstract class _ContactCardResponse implements ContactCardResponse {
  const factory _ContactCardResponse(
      {@JsonKey(name: "message") final String? message,
      @JsonKey(name: "success") final bool? success,
      @JsonKey(name: "contactCards")
      final List<ContactCard>? contactCards}) = _$ContactCardResponseImpl;

  factory _ContactCardResponse.fromJson(Map<String, dynamic> json) =
      _$ContactCardResponseImpl.fromJson;

  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "success")
  bool? get success;
  @override
  @JsonKey(name: "contactCards")
  List<ContactCard>? get contactCards;

  /// Create a copy of ContactCardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactCardResponseImplCopyWith<_$ContactCardResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactCard _$ContactCardFromJson(Map<String, dynamic> json) {
  return _ContactCard.fromJson(json);
}

/// @nodoc
mixin _$ContactCard {
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
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this ContactCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactCardCopyWith<ContactCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCardCopyWith<$Res> {
  factory $ContactCardCopyWith(
          ContactCard value, $Res Function(ContactCard) then) =
      _$ContactCardCopyWithImpl<$Res, ContactCard>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "cmpName") String? cmpName,
      @JsonKey(name: "designation") String? designation,
      @JsonKey(name: "mobile") String? mobile,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class _$ContactCardCopyWithImpl<$Res, $Val extends ContactCard>
    implements $ContactCardCopyWith<$Res> {
  _$ContactCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? cmpName = freezed,
    Object? designation = freezed,
    Object? mobile = freezed,
    Object? id = freezed,
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactCardImplCopyWith<$Res>
    implements $ContactCardCopyWith<$Res> {
  factory _$$ContactCardImplCopyWith(
          _$ContactCardImpl value, $Res Function(_$ContactCardImpl) then) =
      __$$ContactCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "cmpName") String? cmpName,
      @JsonKey(name: "designation") String? designation,
      @JsonKey(name: "mobile") String? mobile,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class __$$ContactCardImplCopyWithImpl<$Res>
    extends _$ContactCardCopyWithImpl<$Res, _$ContactCardImpl>
    implements _$$ContactCardImplCopyWith<$Res> {
  __$$ContactCardImplCopyWithImpl(
      _$ContactCardImpl _value, $Res Function(_$ContactCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? cmpName = freezed,
    Object? designation = freezed,
    Object? mobile = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ContactCardImpl(
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactCardImpl implements _ContactCard {
  const _$ContactCardImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "cmpName") this.cmpName,
      @JsonKey(name: "designation") this.designation,
      @JsonKey(name: "mobile") this.mobile,
      @JsonKey(name: "_id") this.id});

  factory _$ContactCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactCardImplFromJson(json);

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
  @JsonKey(name: "_id")
  final String? id;

  @override
  String toString() {
    return 'ContactCard(name: $name, email: $email, cmpName: $cmpName, designation: $designation, mobile: $mobile, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactCardImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.cmpName, cmpName) || other.cmpName == cmpName) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, cmpName, designation, mobile, id);

  /// Create a copy of ContactCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactCardImplCopyWith<_$ContactCardImpl> get copyWith =>
      __$$ContactCardImplCopyWithImpl<_$ContactCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactCardImplToJson(
      this,
    );
  }
}

abstract class _ContactCard implements ContactCard {
  const factory _ContactCard(
      {@JsonKey(name: "name") final String? name,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "cmpName") final String? cmpName,
      @JsonKey(name: "designation") final String? designation,
      @JsonKey(name: "mobile") final String? mobile,
      @JsonKey(name: "_id") final String? id}) = _$ContactCardImpl;

  factory _ContactCard.fromJson(Map<String, dynamic> json) =
      _$ContactCardImpl.fromJson;

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
  @override
  @JsonKey(name: "_id")
  String? get id;

  /// Create a copy of ContactCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactCardImplCopyWith<_$ContactCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
