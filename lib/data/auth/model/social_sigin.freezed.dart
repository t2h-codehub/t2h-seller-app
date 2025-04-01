// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_sigin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SocialSigninRequest _$SocialSigninRequestFromJson(Map<String, dynamic> json) {
  return _SocialSigninRequest.fromJson(json);
}

/// @nodoc
mixin _$SocialSigninRequest {
  String? get uid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get fcm => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  /// Serializes this SocialSigninRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialSigninRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialSigninRequestCopyWith<SocialSigninRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialSigninRequestCopyWith<$Res> {
  factory $SocialSigninRequestCopyWith(
          SocialSigninRequest value, $Res Function(SocialSigninRequest) then) =
      _$SocialSigninRequestCopyWithImpl<$Res, SocialSigninRequest>;
  @useResult
  $Res call(
      {String? uid,
      String? email,
      String? type,
      String? name,
      String? fcm,
      String? phone});
}

/// @nodoc
class _$SocialSigninRequestCopyWithImpl<$Res, $Val extends SocialSigninRequest>
    implements $SocialSigninRequestCopyWith<$Res> {
  _$SocialSigninRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialSigninRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? fcm = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fcm: freezed == fcm
          ? _value.fcm
          : fcm // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialSigninRequestImplCopyWith<$Res>
    implements $SocialSigninRequestCopyWith<$Res> {
  factory _$$SocialSigninRequestImplCopyWith(_$SocialSigninRequestImpl value,
          $Res Function(_$SocialSigninRequestImpl) then) =
      __$$SocialSigninRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? email,
      String? type,
      String? name,
      String? fcm,
      String? phone});
}

/// @nodoc
class __$$SocialSigninRequestImplCopyWithImpl<$Res>
    extends _$SocialSigninRequestCopyWithImpl<$Res, _$SocialSigninRequestImpl>
    implements _$$SocialSigninRequestImplCopyWith<$Res> {
  __$$SocialSigninRequestImplCopyWithImpl(_$SocialSigninRequestImpl _value,
      $Res Function(_$SocialSigninRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialSigninRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? fcm = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$SocialSigninRequestImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fcm: freezed == fcm
          ? _value.fcm
          : fcm // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialSigninRequestImpl implements _SocialSigninRequest {
  const _$SocialSigninRequestImpl(
      {this.uid, this.email, this.type, this.name, this.fcm, this.phone});

  factory _$SocialSigninRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialSigninRequestImplFromJson(json);

  @override
  final String? uid;
  @override
  final String? email;
  @override
  final String? type;
  @override
  final String? name;
  @override
  final String? fcm;
  @override
  final String? phone;

  @override
  String toString() {
    return 'SocialSigninRequest(uid: $uid, email: $email, type: $type, name: $name, fcm: $fcm, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialSigninRequestImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fcm, fcm) || other.fcm == fcm) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, email, type, name, fcm, phone);

  /// Create a copy of SocialSigninRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialSigninRequestImplCopyWith<_$SocialSigninRequestImpl> get copyWith =>
      __$$SocialSigninRequestImplCopyWithImpl<_$SocialSigninRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialSigninRequestImplToJson(
      this,
    );
  }
}

abstract class _SocialSigninRequest implements SocialSigninRequest {
  const factory _SocialSigninRequest(
      {final String? uid,
      final String? email,
      final String? type,
      final String? name,
      final String? fcm,
      final String? phone}) = _$SocialSigninRequestImpl;

  factory _SocialSigninRequest.fromJson(Map<String, dynamic> json) =
      _$SocialSigninRequestImpl.fromJson;

  @override
  String? get uid;
  @override
  String? get email;
  @override
  String? get type;
  @override
  String? get name;
  @override
  String? get fcm;
  @override
  String? get phone;

  /// Create a copy of SocialSigninRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialSigninRequestImplCopyWith<_$SocialSigninRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SocialSigninResponse _$SocialSigninResponseFromJson(Map<String, dynamic> json) {
  return _SocialSigninResponse.fromJson(json);
}

/// @nodoc
mixin _$SocialSigninResponse {
  String? get message => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: "User")
  User? get user => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  /// Serializes this SocialSigninResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialSigninResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialSigninResponseCopyWith<SocialSigninResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialSigninResponseCopyWith<$Res> {
  factory $SocialSigninResponseCopyWith(SocialSigninResponse value,
          $Res Function(SocialSigninResponse) then) =
      _$SocialSigninResponseCopyWithImpl<$Res, SocialSigninResponse>;
  @useResult
  $Res call(
      {String? message,
      String? token,
      @JsonKey(name: "User") User? user,
      bool? success});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SocialSigninResponseCopyWithImpl<$Res,
        $Val extends SocialSigninResponse>
    implements $SocialSigninResponseCopyWith<$Res> {
  _$SocialSigninResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialSigninResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? token = freezed,
    Object? user = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of SocialSigninResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SocialSigninResponseImplCopyWith<$Res>
    implements $SocialSigninResponseCopyWith<$Res> {
  factory _$$SocialSigninResponseImplCopyWith(_$SocialSigninResponseImpl value,
          $Res Function(_$SocialSigninResponseImpl) then) =
      __$$SocialSigninResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message,
      String? token,
      @JsonKey(name: "User") User? user,
      bool? success});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$SocialSigninResponseImplCopyWithImpl<$Res>
    extends _$SocialSigninResponseCopyWithImpl<$Res, _$SocialSigninResponseImpl>
    implements _$$SocialSigninResponseImplCopyWith<$Res> {
  __$$SocialSigninResponseImplCopyWithImpl(_$SocialSigninResponseImpl _value,
      $Res Function(_$SocialSigninResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialSigninResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? token = freezed,
    Object? user = freezed,
    Object? success = freezed,
  }) {
    return _then(_$SocialSigninResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialSigninResponseImpl implements _SocialSigninResponse {
  const _$SocialSigninResponseImpl(
      {this.message,
      this.token,
      @JsonKey(name: "User") this.user,
      this.success});

  factory _$SocialSigninResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialSigninResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final String? token;
  @override
  @JsonKey(name: "User")
  final User? user;
  @override
  final bool? success;

  @override
  String toString() {
    return 'SocialSigninResponse(message: $message, token: $token, user: $user, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialSigninResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, token, user, success);

  /// Create a copy of SocialSigninResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialSigninResponseImplCopyWith<_$SocialSigninResponseImpl>
      get copyWith =>
          __$$SocialSigninResponseImplCopyWithImpl<_$SocialSigninResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialSigninResponseImplToJson(
      this,
    );
  }
}

abstract class _SocialSigninResponse implements SocialSigninResponse {
  const factory _SocialSigninResponse(
      {final String? message,
      final String? token,
      @JsonKey(name: "User") final User? user,
      final bool? success}) = _$SocialSigninResponseImpl;

  factory _SocialSigninResponse.fromJson(Map<String, dynamic> json) =
      _$SocialSigninResponseImpl.fromJson;

  @override
  String? get message;
  @override
  String? get token;
  @override
  @JsonKey(name: "User")
  User? get user;
  @override
  bool? get success;

  /// Create a copy of SocialSigninResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialSigninResponseImplCopyWith<_$SocialSigninResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  List<dynamic>? get services => throw _privateConstructorUsedError;
  bool? get isMobileVerified => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  bool? get theme => throw _privateConstructorUsedError;
  List<dynamic>? get contacts => throw _privateConstructorUsedError;
  bool? get gainLeads => throw _privateConstructorUsedError;
  String? get googleUid => throw _privateConstructorUsedError;
  bool? get quickIntro => throw _privateConstructorUsedError;
  bool? get helloDirect => throw _privateConstructorUsedError;
  bool? get newUser => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String? id,
      String? email,
      List<dynamic>? services,
      bool? isMobileVerified,
      String? phone,
      bool? theme,
      List<dynamic>? contacts,
      bool? gainLeads,
      String? googleUid,
      bool? quickIntro,
      bool? helloDirect,
      bool? newUser});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? services = freezed,
    Object? isMobileVerified = freezed,
    Object? phone = freezed,
    Object? theme = freezed,
    Object? contacts = freezed,
    Object? gainLeads = freezed,
    Object? googleUid = freezed,
    Object? quickIntro = freezed,
    Object? helloDirect = freezed,
    Object? newUser = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isMobileVerified: freezed == isMobileVerified
          ? _value.isMobileVerified
          : isMobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as bool?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      gainLeads: freezed == gainLeads
          ? _value.gainLeads
          : gainLeads // ignore: cast_nullable_to_non_nullable
              as bool?,
      googleUid: freezed == googleUid
          ? _value.googleUid
          : googleUid // ignore: cast_nullable_to_non_nullable
              as String?,
      quickIntro: freezed == quickIntro
          ? _value.quickIntro
          : quickIntro // ignore: cast_nullable_to_non_nullable
              as bool?,
      helloDirect: freezed == helloDirect
          ? _value.helloDirect
          : helloDirect // ignore: cast_nullable_to_non_nullable
              as bool?,
      newUser: freezed == newUser
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? email,
      List<dynamic>? services,
      bool? isMobileVerified,
      String? phone,
      bool? theme,
      List<dynamic>? contacts,
      bool? gainLeads,
      String? googleUid,
      bool? quickIntro,
      bool? helloDirect,
      bool? newUser});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? services = freezed,
    Object? isMobileVerified = freezed,
    Object? phone = freezed,
    Object? theme = freezed,
    Object? contacts = freezed,
    Object? gainLeads = freezed,
    Object? googleUid = freezed,
    Object? quickIntro = freezed,
    Object? helloDirect = freezed,
    Object? newUser = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isMobileVerified: freezed == isMobileVerified
          ? _value.isMobileVerified
          : isMobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as bool?,
      contacts: freezed == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      gainLeads: freezed == gainLeads
          ? _value.gainLeads
          : gainLeads // ignore: cast_nullable_to_non_nullable
              as bool?,
      googleUid: freezed == googleUid
          ? _value.googleUid
          : googleUid // ignore: cast_nullable_to_non_nullable
              as String?,
      quickIntro: freezed == quickIntro
          ? _value.quickIntro
          : quickIntro // ignore: cast_nullable_to_non_nullable
              as bool?,
      helloDirect: freezed == helloDirect
          ? _value.helloDirect
          : helloDirect // ignore: cast_nullable_to_non_nullable
              as bool?,
      newUser: freezed == newUser
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {this.id,
      this.email,
      final List<dynamic>? services,
      this.isMobileVerified,
      this.phone,
      this.theme,
      final List<dynamic>? contacts,
      this.gainLeads,
      this.googleUid,
      this.quickIntro,
      this.helloDirect,
      this.newUser})
      : _services = services,
        _contacts = contacts;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String? id;
  @override
  final String? email;
  final List<dynamic>? _services;
  @override
  List<dynamic>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isMobileVerified;
  @override
  final String? phone;
  @override
  final bool? theme;
  final List<dynamic>? _contacts;
  @override
  List<dynamic>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? gainLeads;
  @override
  final String? googleUid;
  @override
  final bool? quickIntro;
  @override
  final bool? helloDirect;
  @override
  final bool? newUser;

  @override
  String toString() {
    return 'User(id: $id, email: $email, services: $services, isMobileVerified: $isMobileVerified, phone: $phone, theme: $theme, contacts: $contacts, gainLeads: $gainLeads, googleUid: $googleUid, quickIntro: $quickIntro, helloDirect: $helloDirect, newUser: $newUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.isMobileVerified, isMobileVerified) ||
                other.isMobileVerified == isMobileVerified) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.gainLeads, gainLeads) ||
                other.gainLeads == gainLeads) &&
            (identical(other.googleUid, googleUid) ||
                other.googleUid == googleUid) &&
            (identical(other.quickIntro, quickIntro) ||
                other.quickIntro == quickIntro) &&
            (identical(other.helloDirect, helloDirect) ||
                other.helloDirect == helloDirect) &&
            (identical(other.newUser, newUser) || other.newUser == newUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      const DeepCollectionEquality().hash(_services),
      isMobileVerified,
      phone,
      theme,
      const DeepCollectionEquality().hash(_contacts),
      gainLeads,
      googleUid,
      quickIntro,
      helloDirect,
      newUser);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final String? id,
      final String? email,
      final List<dynamic>? services,
      final bool? isMobileVerified,
      final String? phone,
      final bool? theme,
      final List<dynamic>? contacts,
      final bool? gainLeads,
      final String? googleUid,
      final bool? quickIntro,
      final bool? helloDirect,
      final bool? newUser}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String? get id;
  @override
  String? get email;
  @override
  List<dynamic>? get services;
  @override
  bool? get isMobileVerified;
  @override
  String? get phone;
  @override
  bool? get theme;
  @override
  List<dynamic>? get contacts;
  @override
  bool? get gainLeads;
  @override
  String? get googleUid;
  @override
  bool? get quickIntro;
  @override
  bool? get helloDirect;
  @override
  bool? get newUser;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
