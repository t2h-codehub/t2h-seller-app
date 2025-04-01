// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReqistrationRequest _$ReqistrationRequestFromJson(Map<String, dynamic> json) {
  return _ReqistrationRequest.fromJson(json);
}

/// @nodoc
mixin _$ReqistrationRequest {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get fcm => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  /// Serializes this ReqistrationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReqistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReqistrationRequestCopyWith<ReqistrationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReqistrationRequestCopyWith<$Res> {
  factory $ReqistrationRequestCopyWith(
          ReqistrationRequest value, $Res Function(ReqistrationRequest) then) =
      _$ReqistrationRequestCopyWithImpl<$Res, ReqistrationRequest>;
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? phone,
      String? fcm,
      String? password});
}

/// @nodoc
class _$ReqistrationRequestCopyWithImpl<$Res, $Val extends ReqistrationRequest>
    implements $ReqistrationRequestCopyWith<$Res> {
  _$ReqistrationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReqistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? fcm = freezed,
    Object? password = freezed,
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
      fcm: freezed == fcm
          ? _value.fcm
          : fcm // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReqistrationRequestImplCopyWith<$Res>
    implements $ReqistrationRequestCopyWith<$Res> {
  factory _$$ReqistrationRequestImplCopyWith(_$ReqistrationRequestImpl value,
          $Res Function(_$ReqistrationRequestImpl) then) =
      __$$ReqistrationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? phone,
      String? fcm,
      String? password});
}

/// @nodoc
class __$$ReqistrationRequestImplCopyWithImpl<$Res>
    extends _$ReqistrationRequestCopyWithImpl<$Res, _$ReqistrationRequestImpl>
    implements _$$ReqistrationRequestImplCopyWith<$Res> {
  __$$ReqistrationRequestImplCopyWithImpl(_$ReqistrationRequestImpl _value,
      $Res Function(_$ReqistrationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReqistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? fcm = freezed,
    Object? password = freezed,
  }) {
    return _then(_$ReqistrationRequestImpl(
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
      fcm: freezed == fcm
          ? _value.fcm
          : fcm // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReqistrationRequestImpl implements _ReqistrationRequest {
  const _$ReqistrationRequestImpl(
      {this.name, this.email, this.phone, this.fcm, this.password});

  factory _$ReqistrationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReqistrationRequestImplFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? fcm;
  @override
  final String? password;

  @override
  String toString() {
    return 'ReqistrationRequest(name: $name, email: $email, phone: $phone, fcm: $fcm, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReqistrationRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.fcm, fcm) || other.fcm == fcm) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, phone, fcm, password);

  /// Create a copy of ReqistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReqistrationRequestImplCopyWith<_$ReqistrationRequestImpl> get copyWith =>
      __$$ReqistrationRequestImplCopyWithImpl<_$ReqistrationRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReqistrationRequestImplToJson(
      this,
    );
  }
}

abstract class _ReqistrationRequest implements ReqistrationRequest {
  const factory _ReqistrationRequest(
      {final String? name,
      final String? email,
      final String? phone,
      final String? fcm,
      final String? password}) = _$ReqistrationRequestImpl;

  factory _ReqistrationRequest.fromJson(Map<String, dynamic> json) =
      _$ReqistrationRequestImpl.fromJson;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get fcm;
  @override
  String? get password;

  /// Create a copy of ReqistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReqistrationRequestImplCopyWith<_$ReqistrationRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReqistrationResponse _$ReqistrationResponseFromJson(Map<String, dynamic> json) {
  return _ReqistrationResponse.fromJson(json);
}

/// @nodoc
mixin _$ReqistrationResponse {
  String? get message => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: "User")
  User? get user => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  /// Serializes this ReqistrationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReqistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReqistrationResponseCopyWith<ReqistrationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReqistrationResponseCopyWith<$Res> {
  factory $ReqistrationResponseCopyWith(ReqistrationResponse value,
          $Res Function(ReqistrationResponse) then) =
      _$ReqistrationResponseCopyWithImpl<$Res, ReqistrationResponse>;
  @useResult
  $Res call(
      {String? message,
      String? token,
      @JsonKey(name: "User") User? user,
      bool? success});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ReqistrationResponseCopyWithImpl<$Res,
        $Val extends ReqistrationResponse>
    implements $ReqistrationResponseCopyWith<$Res> {
  _$ReqistrationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReqistrationResponse
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

  /// Create a copy of ReqistrationResponse
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
abstract class _$$ReqistrationResponseImplCopyWith<$Res>
    implements $ReqistrationResponseCopyWith<$Res> {
  factory _$$ReqistrationResponseImplCopyWith(_$ReqistrationResponseImpl value,
          $Res Function(_$ReqistrationResponseImpl) then) =
      __$$ReqistrationResponseImplCopyWithImpl<$Res>;
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
class __$$ReqistrationResponseImplCopyWithImpl<$Res>
    extends _$ReqistrationResponseCopyWithImpl<$Res, _$ReqistrationResponseImpl>
    implements _$$ReqistrationResponseImplCopyWith<$Res> {
  __$$ReqistrationResponseImplCopyWithImpl(_$ReqistrationResponseImpl _value,
      $Res Function(_$ReqistrationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReqistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? token = freezed,
    Object? user = freezed,
    Object? success = freezed,
  }) {
    return _then(_$ReqistrationResponseImpl(
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
class _$ReqistrationResponseImpl implements _ReqistrationResponse {
  const _$ReqistrationResponseImpl(
      {this.message,
      this.token,
      @JsonKey(name: "User") this.user,
      this.success});

  factory _$ReqistrationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReqistrationResponseImplFromJson(json);

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
    return 'ReqistrationResponse(message: $message, token: $token, user: $user, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReqistrationResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, token, user, success);

  /// Create a copy of ReqistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReqistrationResponseImplCopyWith<_$ReqistrationResponseImpl>
      get copyWith =>
          __$$ReqistrationResponseImplCopyWithImpl<_$ReqistrationResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReqistrationResponseImplToJson(
      this,
    );
  }
}

abstract class _ReqistrationResponse implements ReqistrationResponse {
  const factory _ReqistrationResponse(
      {final String? message,
      final String? token,
      @JsonKey(name: "User") final User? user,
      final bool? success}) = _$ReqistrationResponseImpl;

  factory _ReqistrationResponse.fromJson(Map<String, dynamic> json) =
      _$ReqistrationResponseImpl.fromJson;

  @override
  String? get message;
  @override
  String? get token;
  @override
  @JsonKey(name: "User")
  User? get user;
  @override
  bool? get success;

  /// Create a copy of ReqistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReqistrationResponseImplCopyWith<_$ReqistrationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

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
  $Res call({String? name, String? email, String? phone, String? id});
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
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
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
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String? name, String? email, String? phone, String? id});
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
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? id = freezed,
  }) {
    return _then(_$UserImpl(
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl({this.name, this.email, this.phone, this.id});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? id;

  @override
  String toString() {
    return 'User(name: $name, email: $email, phone: $phone, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, phone, id);

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
      {final String? name,
      final String? email,
      final String? phone,
      final String? id}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get id;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
