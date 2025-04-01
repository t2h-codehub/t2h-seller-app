// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'switch_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SwitchAccountResponse _$SwitchAccountResponseFromJson(
    Map<String, dynamic> json) {
  return _SwitchAccountResponse.fromJson(json);
}

/// @nodoc
mixin _$SwitchAccountResponse {
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "token")
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: "success")
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: "User")
  User? get user => throw _privateConstructorUsedError;

  /// Serializes this SwitchAccountResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SwitchAccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwitchAccountResponseCopyWith<SwitchAccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwitchAccountResponseCopyWith<$Res> {
  factory $SwitchAccountResponseCopyWith(SwitchAccountResponse value,
          $Res Function(SwitchAccountResponse) then) =
      _$SwitchAccountResponseCopyWithImpl<$Res, SwitchAccountResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "message") String? message,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "success") bool? success,
      @JsonKey(name: "User") User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SwitchAccountResponseCopyWithImpl<$Res,
        $Val extends SwitchAccountResponse>
    implements $SwitchAccountResponseCopyWith<$Res> {
  _$SwitchAccountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwitchAccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? token = freezed,
    Object? success = freezed,
    Object? user = freezed,
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
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of SwitchAccountResponse
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
abstract class _$$SwitchAccountResponseImplCopyWith<$Res>
    implements $SwitchAccountResponseCopyWith<$Res> {
  factory _$$SwitchAccountResponseImplCopyWith(
          _$SwitchAccountResponseImpl value,
          $Res Function(_$SwitchAccountResponseImpl) then) =
      __$$SwitchAccountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "message") String? message,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "success") bool? success,
      @JsonKey(name: "User") User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$SwitchAccountResponseImplCopyWithImpl<$Res>
    extends _$SwitchAccountResponseCopyWithImpl<$Res,
        _$SwitchAccountResponseImpl>
    implements _$$SwitchAccountResponseImplCopyWith<$Res> {
  __$$SwitchAccountResponseImplCopyWithImpl(_$SwitchAccountResponseImpl _value,
      $Res Function(_$SwitchAccountResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwitchAccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? token = freezed,
    Object? success = freezed,
    Object? user = freezed,
  }) {
    return _then(_$SwitchAccountResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwitchAccountResponseImpl implements _SwitchAccountResponse {
  const _$SwitchAccountResponseImpl(
      {@JsonKey(name: "message") this.message,
      @JsonKey(name: "token") this.token,
      @JsonKey(name: "success") this.success,
      @JsonKey(name: "User") this.user});

  factory _$SwitchAccountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwitchAccountResponseImplFromJson(json);

  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "token")
  final String? token;
  @override
  @JsonKey(name: "success")
  final bool? success;
  @override
  @JsonKey(name: "User")
  final User? user;

  @override
  String toString() {
    return 'SwitchAccountResponse(message: $message, token: $token, success: $success, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchAccountResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, token, success, user);

  /// Create a copy of SwitchAccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchAccountResponseImplCopyWith<_$SwitchAccountResponseImpl>
      get copyWith => __$$SwitchAccountResponseImplCopyWithImpl<
          _$SwitchAccountResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwitchAccountResponseImplToJson(
      this,
    );
  }
}

abstract class _SwitchAccountResponse implements SwitchAccountResponse {
  const factory _SwitchAccountResponse(
      {@JsonKey(name: "message") final String? message,
      @JsonKey(name: "token") final String? token,
      @JsonKey(name: "success") final bool? success,
      @JsonKey(name: "User") final User? user}) = _$SwitchAccountResponseImpl;

  factory _SwitchAccountResponse.fromJson(Map<String, dynamic> json) =
      _$SwitchAccountResponseImpl.fromJson;

  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "token")
  String? get token;
  @override
  @JsonKey(name: "success")
  bool? get success;
  @override
  @JsonKey(name: "User")
  User? get user;

  /// Create a copy of SwitchAccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwitchAccountResponseImplCopyWith<_$SwitchAccountResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "plan")
  Plan? get plan => throw _privateConstructorUsedError;
  @JsonKey(name: "customBranding")
  CustomBranding? get customBranding => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "parentId")
  String? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "isMobileVerified")
  bool? get isMobileVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "cards")
  List<dynamic>? get cards => throw _privateConstructorUsedError;
  @JsonKey(name: "active")
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: "theme")
  bool? get theme => throw _privateConstructorUsedError;
  @JsonKey(name: "gainLeads")
  bool? get gainLeads => throw _privateConstructorUsedError;
  @JsonKey(name: "quickIntro")
  bool? get quickIntro => throw _privateConstructorUsedError;
  @JsonKey(name: "isCustomBranding")
  bool? get isCustomBranding => throw _privateConstructorUsedError;
  @JsonKey(name: "helloDirect")
  bool? get helloDirect => throw _privateConstructorUsedError;
  @JsonKey(name: "color")
  Color? get color => throw _privateConstructorUsedError;
  @JsonKey(name: "isPro")
  bool? get isPro => throw _privateConstructorUsedError;
  @JsonKey(name: "isProPlus")
  bool? get isProPlus => throw _privateConstructorUsedError;
  @JsonKey(name: "services")
  List<Service>? get services => throw _privateConstructorUsedError;
  @JsonKey(name: "customServices")
  List<CustomService>? get customServices => throw _privateConstructorUsedError;
  @JsonKey(name: "contacts")
  List<Contact>? get contacts => throw _privateConstructorUsedError;
  @JsonKey(name: "qrCode")
  String? get qrCode => throw _privateConstructorUsedError;
  @JsonKey(name: "bio")
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: "companyName")
  String? get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: "coverVideo")
  String? get coverVideo => throw _privateConstructorUsedError;
  @JsonKey(name: "designation")
  String? get designation => throw _privateConstructorUsedError;
  @JsonKey(name: "profileImg")
  String? get profileImg => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "plan") Plan? plan,
      @JsonKey(name: "customBranding") CustomBranding? customBranding,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "parentId") String? parentId,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "isMobileVerified") bool? isMobileVerified,
      @JsonKey(name: "cards") List<dynamic>? cards,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "theme") bool? theme,
      @JsonKey(name: "gainLeads") bool? gainLeads,
      @JsonKey(name: "quickIntro") bool? quickIntro,
      @JsonKey(name: "isCustomBranding") bool? isCustomBranding,
      @JsonKey(name: "helloDirect") bool? helloDirect,
      @JsonKey(name: "color") Color? color,
      @JsonKey(name: "isPro") bool? isPro,
      @JsonKey(name: "isProPlus") bool? isProPlus,
      @JsonKey(name: "services") List<Service>? services,
      @JsonKey(name: "customServices") List<CustomService>? customServices,
      @JsonKey(name: "contacts") List<Contact>? contacts,
      @JsonKey(name: "qrCode") String? qrCode,
      @JsonKey(name: "bio") String? bio,
      @JsonKey(name: "companyName") String? companyName,
      @JsonKey(name: "coverVideo") String? coverVideo,
      @JsonKey(name: "designation") String? designation,
      @JsonKey(name: "profileImg") String? profileImg,
      @JsonKey(name: "username") String? username});

  $PlanCopyWith<$Res>? get plan;
  $CustomBrandingCopyWith<$Res>? get customBranding;
  $ColorCopyWith<$Res>? get color;
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
    Object? plan = freezed,
    Object? customBranding = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? parentId = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? isMobileVerified = freezed,
    Object? cards = freezed,
    Object? active = freezed,
    Object? theme = freezed,
    Object? gainLeads = freezed,
    Object? quickIntro = freezed,
    Object? isCustomBranding = freezed,
    Object? helloDirect = freezed,
    Object? color = freezed,
    Object? isPro = freezed,
    Object? isProPlus = freezed,
    Object? services = freezed,
    Object? customServices = freezed,
    Object? contacts = freezed,
    Object? qrCode = freezed,
    Object? bio = freezed,
    Object? companyName = freezed,
    Object? coverVideo = freezed,
    Object? designation = freezed,
    Object? profileImg = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as Plan?,
      customBranding: freezed == customBranding
          ? _value.customBranding
          : customBranding // ignore: cast_nullable_to_non_nullable
              as CustomBranding?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isMobileVerified: freezed == isMobileVerified
          ? _value.isMobileVerified
          : isMobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      cards: freezed == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as bool?,
      gainLeads: freezed == gainLeads
          ? _value.gainLeads
          : gainLeads // ignore: cast_nullable_to_non_nullable
              as bool?,
      quickIntro: freezed == quickIntro
          ? _value.quickIntro
          : quickIntro // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCustomBranding: freezed == isCustomBranding
          ? _value.isCustomBranding
          : isCustomBranding // ignore: cast_nullable_to_non_nullable
              as bool?,
      helloDirect: freezed == helloDirect
          ? _value.helloDirect
          : helloDirect // ignore: cast_nullable_to_non_nullable
              as bool?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      isPro: freezed == isPro
          ? _value.isPro
          : isPro // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProPlus: freezed == isProPlus
          ? _value.isProPlus
          : isProPlus // ignore: cast_nullable_to_non_nullable
              as bool?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      customServices: freezed == customServices
          ? _value.customServices
          : customServices // ignore: cast_nullable_to_non_nullable
              as List<CustomService>?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      coverVideo: freezed == coverVideo
          ? _value.coverVideo
          : coverVideo // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlanCopyWith<$Res>? get plan {
    if (_value.plan == null) {
      return null;
    }

    return $PlanCopyWith<$Res>(_value.plan!, (value) {
      return _then(_value.copyWith(plan: value) as $Val);
    });
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomBrandingCopyWith<$Res>? get customBranding {
    if (_value.customBranding == null) {
      return null;
    }

    return $CustomBrandingCopyWith<$Res>(_value.customBranding!, (value) {
      return _then(_value.copyWith(customBranding: value) as $Val);
    });
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ColorCopyWith<$Res>? get color {
    if (_value.color == null) {
      return null;
    }

    return $ColorCopyWith<$Res>(_value.color!, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
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
      {@JsonKey(name: "plan") Plan? plan,
      @JsonKey(name: "customBranding") CustomBranding? customBranding,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "parentId") String? parentId,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "isMobileVerified") bool? isMobileVerified,
      @JsonKey(name: "cards") List<dynamic>? cards,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "theme") bool? theme,
      @JsonKey(name: "gainLeads") bool? gainLeads,
      @JsonKey(name: "quickIntro") bool? quickIntro,
      @JsonKey(name: "isCustomBranding") bool? isCustomBranding,
      @JsonKey(name: "helloDirect") bool? helloDirect,
      @JsonKey(name: "color") Color? color,
      @JsonKey(name: "isPro") bool? isPro,
      @JsonKey(name: "isProPlus") bool? isProPlus,
      @JsonKey(name: "services") List<Service>? services,
      @JsonKey(name: "customServices") List<CustomService>? customServices,
      @JsonKey(name: "contacts") List<Contact>? contacts,
      @JsonKey(name: "qrCode") String? qrCode,
      @JsonKey(name: "bio") String? bio,
      @JsonKey(name: "companyName") String? companyName,
      @JsonKey(name: "coverVideo") String? coverVideo,
      @JsonKey(name: "designation") String? designation,
      @JsonKey(name: "profileImg") String? profileImg,
      @JsonKey(name: "username") String? username});

  @override
  $PlanCopyWith<$Res>? get plan;
  @override
  $CustomBrandingCopyWith<$Res>? get customBranding;
  @override
  $ColorCopyWith<$Res>? get color;
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
    Object? plan = freezed,
    Object? customBranding = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? parentId = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? isMobileVerified = freezed,
    Object? cards = freezed,
    Object? active = freezed,
    Object? theme = freezed,
    Object? gainLeads = freezed,
    Object? quickIntro = freezed,
    Object? isCustomBranding = freezed,
    Object? helloDirect = freezed,
    Object? color = freezed,
    Object? isPro = freezed,
    Object? isProPlus = freezed,
    Object? services = freezed,
    Object? customServices = freezed,
    Object? contacts = freezed,
    Object? qrCode = freezed,
    Object? bio = freezed,
    Object? companyName = freezed,
    Object? coverVideo = freezed,
    Object? designation = freezed,
    Object? profileImg = freezed,
    Object? username = freezed,
  }) {
    return _then(_$UserImpl(
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as Plan?,
      customBranding: freezed == customBranding
          ? _value.customBranding
          : customBranding // ignore: cast_nullable_to_non_nullable
              as CustomBranding?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isMobileVerified: freezed == isMobileVerified
          ? _value.isMobileVerified
          : isMobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      cards: freezed == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as bool?,
      gainLeads: freezed == gainLeads
          ? _value.gainLeads
          : gainLeads // ignore: cast_nullable_to_non_nullable
              as bool?,
      quickIntro: freezed == quickIntro
          ? _value.quickIntro
          : quickIntro // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCustomBranding: freezed == isCustomBranding
          ? _value.isCustomBranding
          : isCustomBranding // ignore: cast_nullable_to_non_nullable
              as bool?,
      helloDirect: freezed == helloDirect
          ? _value.helloDirect
          : helloDirect // ignore: cast_nullable_to_non_nullable
              as bool?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      isPro: freezed == isPro
          ? _value.isPro
          : isPro // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProPlus: freezed == isProPlus
          ? _value.isProPlus
          : isProPlus // ignore: cast_nullable_to_non_nullable
              as bool?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      customServices: freezed == customServices
          ? _value._customServices
          : customServices // ignore: cast_nullable_to_non_nullable
              as List<CustomService>?,
      contacts: freezed == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      coverVideo: freezed == coverVideo
          ? _value.coverVideo
          : coverVideo // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: "plan") this.plan,
      @JsonKey(name: "customBranding") this.customBranding,
      @JsonKey(name: "_id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "parentId") this.parentId,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "isMobileVerified") this.isMobileVerified,
      @JsonKey(name: "cards") final List<dynamic>? cards,
      @JsonKey(name: "active") this.active,
      @JsonKey(name: "theme") this.theme,
      @JsonKey(name: "gainLeads") this.gainLeads,
      @JsonKey(name: "quickIntro") this.quickIntro,
      @JsonKey(name: "isCustomBranding") this.isCustomBranding,
      @JsonKey(name: "helloDirect") this.helloDirect,
      @JsonKey(name: "color") this.color,
      @JsonKey(name: "isPro") this.isPro,
      @JsonKey(name: "isProPlus") this.isProPlus,
      @JsonKey(name: "services") final List<Service>? services,
      @JsonKey(name: "customServices")
      final List<CustomService>? customServices,
      @JsonKey(name: "contacts") final List<Contact>? contacts,
      @JsonKey(name: "qrCode") this.qrCode,
      @JsonKey(name: "bio") this.bio,
      @JsonKey(name: "companyName") this.companyName,
      @JsonKey(name: "coverVideo") this.coverVideo,
      @JsonKey(name: "designation") this.designation,
      @JsonKey(name: "profileImg") this.profileImg,
      @JsonKey(name: "username") this.username})
      : _cards = cards,
        _services = services,
        _customServices = customServices,
        _contacts = contacts;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: "plan")
  final Plan? plan;
  @override
  @JsonKey(name: "customBranding")
  final CustomBranding? customBranding;
  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "parentId")
  final String? parentId;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "isMobileVerified")
  final bool? isMobileVerified;
  final List<dynamic>? _cards;
  @override
  @JsonKey(name: "cards")
  List<dynamic>? get cards {
    final value = _cards;
    if (value == null) return null;
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "active")
  final bool? active;
  @override
  @JsonKey(name: "theme")
  final bool? theme;
  @override
  @JsonKey(name: "gainLeads")
  final bool? gainLeads;
  @override
  @JsonKey(name: "quickIntro")
  final bool? quickIntro;
  @override
  @JsonKey(name: "isCustomBranding")
  final bool? isCustomBranding;
  @override
  @JsonKey(name: "helloDirect")
  final bool? helloDirect;
  @override
  @JsonKey(name: "color")
  final Color? color;
  @override
  @JsonKey(name: "isPro")
  final bool? isPro;
  @override
  @JsonKey(name: "isProPlus")
  final bool? isProPlus;
  final List<Service>? _services;
  @override
  @JsonKey(name: "services")
  List<Service>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CustomService>? _customServices;
  @override
  @JsonKey(name: "customServices")
  List<CustomService>? get customServices {
    final value = _customServices;
    if (value == null) return null;
    if (_customServices is EqualUnmodifiableListView) return _customServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Contact>? _contacts;
  @override
  @JsonKey(name: "contacts")
  List<Contact>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "qrCode")
  final String? qrCode;
  @override
  @JsonKey(name: "bio")
  final String? bio;
  @override
  @JsonKey(name: "companyName")
  final String? companyName;
  @override
  @JsonKey(name: "coverVideo")
  final String? coverVideo;
  @override
  @JsonKey(name: "designation")
  final String? designation;
  @override
  @JsonKey(name: "profileImg")
  final String? profileImg;
  @override
  @JsonKey(name: "username")
  final String? username;

  @override
  String toString() {
    return 'User(plan: $plan, customBranding: $customBranding, id: $id, name: $name, parentId: $parentId, email: $email, phone: $phone, isMobileVerified: $isMobileVerified, cards: $cards, active: $active, theme: $theme, gainLeads: $gainLeads, quickIntro: $quickIntro, isCustomBranding: $isCustomBranding, helloDirect: $helloDirect, color: $color, isPro: $isPro, isProPlus: $isProPlus, services: $services, customServices: $customServices, contacts: $contacts, qrCode: $qrCode, bio: $bio, companyName: $companyName, coverVideo: $coverVideo, designation: $designation, profileImg: $profileImg, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.customBranding, customBranding) ||
                other.customBranding == customBranding) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isMobileVerified, isMobileVerified) ||
                other.isMobileVerified == isMobileVerified) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.gainLeads, gainLeads) ||
                other.gainLeads == gainLeads) &&
            (identical(other.quickIntro, quickIntro) ||
                other.quickIntro == quickIntro) &&
            (identical(other.isCustomBranding, isCustomBranding) ||
                other.isCustomBranding == isCustomBranding) &&
            (identical(other.helloDirect, helloDirect) ||
                other.helloDirect == helloDirect) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isPro, isPro) || other.isPro == isPro) &&
            (identical(other.isProPlus, isProPlus) ||
                other.isProPlus == isProPlus) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._customServices, _customServices) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.coverVideo, coverVideo) ||
                other.coverVideo == coverVideo) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.profileImg, profileImg) ||
                other.profileImg == profileImg) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        plan,
        customBranding,
        id,
        name,
        parentId,
        email,
        phone,
        isMobileVerified,
        const DeepCollectionEquality().hash(_cards),
        active,
        theme,
        gainLeads,
        quickIntro,
        isCustomBranding,
        helloDirect,
        color,
        isPro,
        isProPlus,
        const DeepCollectionEquality().hash(_services),
        const DeepCollectionEquality().hash(_customServices),
        const DeepCollectionEquality().hash(_contacts),
        qrCode,
        bio,
        companyName,
        coverVideo,
        designation,
        profileImg,
        username
      ]);

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
      {@JsonKey(name: "plan") final Plan? plan,
      @JsonKey(name: "customBranding") final CustomBranding? customBranding,
      @JsonKey(name: "_id") final String? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "parentId") final String? parentId,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "phone") final String? phone,
      @JsonKey(name: "isMobileVerified") final bool? isMobileVerified,
      @JsonKey(name: "cards") final List<dynamic>? cards,
      @JsonKey(name: "active") final bool? active,
      @JsonKey(name: "theme") final bool? theme,
      @JsonKey(name: "gainLeads") final bool? gainLeads,
      @JsonKey(name: "quickIntro") final bool? quickIntro,
      @JsonKey(name: "isCustomBranding") final bool? isCustomBranding,
      @JsonKey(name: "helloDirect") final bool? helloDirect,
      @JsonKey(name: "color") final Color? color,
      @JsonKey(name: "isPro") final bool? isPro,
      @JsonKey(name: "isProPlus") final bool? isProPlus,
      @JsonKey(name: "services") final List<Service>? services,
      @JsonKey(name: "customServices")
      final List<CustomService>? customServices,
      @JsonKey(name: "contacts") final List<Contact>? contacts,
      @JsonKey(name: "qrCode") final String? qrCode,
      @JsonKey(name: "bio") final String? bio,
      @JsonKey(name: "companyName") final String? companyName,
      @JsonKey(name: "coverVideo") final String? coverVideo,
      @JsonKey(name: "designation") final String? designation,
      @JsonKey(name: "profileImg") final String? profileImg,
      @JsonKey(name: "username") final String? username}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: "plan")
  Plan? get plan;
  @override
  @JsonKey(name: "customBranding")
  CustomBranding? get customBranding;
  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "parentId")
  String? get parentId;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "isMobileVerified")
  bool? get isMobileVerified;
  @override
  @JsonKey(name: "cards")
  List<dynamic>? get cards;
  @override
  @JsonKey(name: "active")
  bool? get active;
  @override
  @JsonKey(name: "theme")
  bool? get theme;
  @override
  @JsonKey(name: "gainLeads")
  bool? get gainLeads;
  @override
  @JsonKey(name: "quickIntro")
  bool? get quickIntro;
  @override
  @JsonKey(name: "isCustomBranding")
  bool? get isCustomBranding;
  @override
  @JsonKey(name: "helloDirect")
  bool? get helloDirect;
  @override
  @JsonKey(name: "color")
  Color? get color;
  @override
  @JsonKey(name: "isPro")
  bool? get isPro;
  @override
  @JsonKey(name: "isProPlus")
  bool? get isProPlus;
  @override
  @JsonKey(name: "services")
  List<Service>? get services;
  @override
  @JsonKey(name: "customServices")
  List<CustomService>? get customServices;
  @override
  @JsonKey(name: "contacts")
  List<Contact>? get contacts;
  @override
  @JsonKey(name: "qrCode")
  String? get qrCode;
  @override
  @JsonKey(name: "bio")
  String? get bio;
  @override
  @JsonKey(name: "companyName")
  String? get companyName;
  @override
  @JsonKey(name: "coverVideo")
  String? get coverVideo;
  @override
  @JsonKey(name: "designation")
  String? get designation;
  @override
  @JsonKey(name: "profileImg")
  String? get profileImg;
  @override
  @JsonKey(name: "username")
  String? get username;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return _Plan.fromJson(json);
}

/// @nodoc
mixin _$Plan {
  @JsonKey(name: "planType")
  String? get planType => throw _privateConstructorUsedError;
  @JsonKey(name: "expiresAt")
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: "active")
  bool? get active => throw _privateConstructorUsedError;

  /// Serializes this Plan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanCopyWith<Plan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanCopyWith<$Res> {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) then) =
      _$PlanCopyWithImpl<$Res, Plan>;
  @useResult
  $Res call(
      {@JsonKey(name: "planType") String? planType,
      @JsonKey(name: "expiresAt") DateTime? expiresAt,
      @JsonKey(name: "active") bool? active});
}

/// @nodoc
class _$PlanCopyWithImpl<$Res, $Val extends Plan>
    implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planType = freezed,
    Object? expiresAt = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      planType: freezed == planType
          ? _value.planType
          : planType // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanImplCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$$PlanImplCopyWith(
          _$PlanImpl value, $Res Function(_$PlanImpl) then) =
      __$$PlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "planType") String? planType,
      @JsonKey(name: "expiresAt") DateTime? expiresAt,
      @JsonKey(name: "active") bool? active});
}

/// @nodoc
class __$$PlanImplCopyWithImpl<$Res>
    extends _$PlanCopyWithImpl<$Res, _$PlanImpl>
    implements _$$PlanImplCopyWith<$Res> {
  __$$PlanImplCopyWithImpl(_$PlanImpl _value, $Res Function(_$PlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planType = freezed,
    Object? expiresAt = freezed,
    Object? active = freezed,
  }) {
    return _then(_$PlanImpl(
      planType: freezed == planType
          ? _value.planType
          : planType // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanImpl implements _Plan {
  const _$PlanImpl(
      {@JsonKey(name: "planType") this.planType,
      @JsonKey(name: "expiresAt") this.expiresAt,
      @JsonKey(name: "active") this.active});

  factory _$PlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanImplFromJson(json);

  @override
  @JsonKey(name: "planType")
  final String? planType;
  @override
  @JsonKey(name: "expiresAt")
  final DateTime? expiresAt;
  @override
  @JsonKey(name: "active")
  final bool? active;

  @override
  String toString() {
    return 'Plan(planType: $planType, expiresAt: $expiresAt, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanImpl &&
            (identical(other.planType, planType) ||
                other.planType == planType) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, planType, expiresAt, active);

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanImplCopyWith<_$PlanImpl> get copyWith =>
      __$$PlanImplCopyWithImpl<_$PlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanImplToJson(
      this,
    );
  }
}

abstract class _Plan implements Plan {
  const factory _Plan(
      {@JsonKey(name: "planType") final String? planType,
      @JsonKey(name: "expiresAt") final DateTime? expiresAt,
      @JsonKey(name: "active") final bool? active}) = _$PlanImpl;

  factory _Plan.fromJson(Map<String, dynamic> json) = _$PlanImpl.fromJson;

  @override
  @JsonKey(name: "planType")
  String? get planType;
  @override
  @JsonKey(name: "expiresAt")
  DateTime? get expiresAt;
  @override
  @JsonKey(name: "active")
  bool? get active;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanImplCopyWith<_$PlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomBranding _$CustomBrandingFromJson(Map<String, dynamic> json) {
  return _CustomBranding.fromJson(json);
}

/// @nodoc
mixin _$CustomBranding {
  @JsonKey(name: "customTheme")
  CustomTheme? get customTheme => throw _privateConstructorUsedError;
  @JsonKey(name: "color")
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this CustomBranding to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomBranding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomBrandingCopyWith<CustomBranding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomBrandingCopyWith<$Res> {
  factory $CustomBrandingCopyWith(
          CustomBranding value, $Res Function(CustomBranding) then) =
      _$CustomBrandingCopyWithImpl<$Res, CustomBranding>;
  @useResult
  $Res call(
      {@JsonKey(name: "customTheme") CustomTheme? customTheme,
      @JsonKey(name: "color") String? color,
      @JsonKey(name: "image") String? image});

  $CustomThemeCopyWith<$Res>? get customTheme;
}

/// @nodoc
class _$CustomBrandingCopyWithImpl<$Res, $Val extends CustomBranding>
    implements $CustomBrandingCopyWith<$Res> {
  _$CustomBrandingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomBranding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customTheme = freezed,
    Object? color = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      customTheme: freezed == customTheme
          ? _value.customTheme
          : customTheme // ignore: cast_nullable_to_non_nullable
              as CustomTheme?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CustomBranding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomThemeCopyWith<$Res>? get customTheme {
    if (_value.customTheme == null) {
      return null;
    }

    return $CustomThemeCopyWith<$Res>(_value.customTheme!, (value) {
      return _then(_value.copyWith(customTheme: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomBrandingImplCopyWith<$Res>
    implements $CustomBrandingCopyWith<$Res> {
  factory _$$CustomBrandingImplCopyWith(_$CustomBrandingImpl value,
          $Res Function(_$CustomBrandingImpl) then) =
      __$$CustomBrandingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "customTheme") CustomTheme? customTheme,
      @JsonKey(name: "color") String? color,
      @JsonKey(name: "image") String? image});

  @override
  $CustomThemeCopyWith<$Res>? get customTheme;
}

/// @nodoc
class __$$CustomBrandingImplCopyWithImpl<$Res>
    extends _$CustomBrandingCopyWithImpl<$Res, _$CustomBrandingImpl>
    implements _$$CustomBrandingImplCopyWith<$Res> {
  __$$CustomBrandingImplCopyWithImpl(
      _$CustomBrandingImpl _value, $Res Function(_$CustomBrandingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomBranding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customTheme = freezed,
    Object? color = freezed,
    Object? image = freezed,
  }) {
    return _then(_$CustomBrandingImpl(
      customTheme: freezed == customTheme
          ? _value.customTheme
          : customTheme // ignore: cast_nullable_to_non_nullable
              as CustomTheme?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomBrandingImpl implements _CustomBranding {
  const _$CustomBrandingImpl(
      {@JsonKey(name: "customTheme") this.customTheme,
      @JsonKey(name: "color") this.color,
      @JsonKey(name: "image") this.image});

  factory _$CustomBrandingImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomBrandingImplFromJson(json);

  @override
  @JsonKey(name: "customTheme")
  final CustomTheme? customTheme;
  @override
  @JsonKey(name: "color")
  final String? color;
  @override
  @JsonKey(name: "image")
  final String? image;

  @override
  String toString() {
    return 'CustomBranding(customTheme: $customTheme, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomBrandingImpl &&
            (identical(other.customTheme, customTheme) ||
                other.customTheme == customTheme) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customTheme, color, image);

  /// Create a copy of CustomBranding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomBrandingImplCopyWith<_$CustomBrandingImpl> get copyWith =>
      __$$CustomBrandingImplCopyWithImpl<_$CustomBrandingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomBrandingImplToJson(
      this,
    );
  }
}

abstract class _CustomBranding implements CustomBranding {
  const factory _CustomBranding(
      {@JsonKey(name: "customTheme") final CustomTheme? customTheme,
      @JsonKey(name: "color") final String? color,
      @JsonKey(name: "image") final String? image}) = _$CustomBrandingImpl;

  factory _CustomBranding.fromJson(Map<String, dynamic> json) =
      _$CustomBrandingImpl.fromJson;

  @override
  @JsonKey(name: "customTheme")
  CustomTheme? get customTheme;
  @override
  @JsonKey(name: "color")
  String? get color;
  @override
  @JsonKey(name: "image")
  String? get image;

  /// Create a copy of CustomBranding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomBrandingImplCopyWith<_$CustomBrandingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomTheme _$CustomThemeFromJson(Map<String, dynamic> json) {
  return _CustomTheme.fromJson(json);
}

/// @nodoc
mixin _$CustomTheme {
  @JsonKey(name: "color1")
  String? get color1 => throw _privateConstructorUsedError;
  @JsonKey(name: "color2")
  String? get color2 => throw _privateConstructorUsedError;
  @JsonKey(name: "logo")
  String? get logo => throw _privateConstructorUsedError;

  /// Serializes this CustomTheme to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomThemeCopyWith<CustomTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomThemeCopyWith<$Res> {
  factory $CustomThemeCopyWith(
          CustomTheme value, $Res Function(CustomTheme) then) =
      _$CustomThemeCopyWithImpl<$Res, CustomTheme>;
  @useResult
  $Res call(
      {@JsonKey(name: "color1") String? color1,
      @JsonKey(name: "color2") String? color2,
      @JsonKey(name: "logo") String? logo});
}

/// @nodoc
class _$CustomThemeCopyWithImpl<$Res, $Val extends CustomTheme>
    implements $CustomThemeCopyWith<$Res> {
  _$CustomThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color1 = freezed,
    Object? color2 = freezed,
    Object? logo = freezed,
  }) {
    return _then(_value.copyWith(
      color1: freezed == color1
          ? _value.color1
          : color1 // ignore: cast_nullable_to_non_nullable
              as String?,
      color2: freezed == color2
          ? _value.color2
          : color2 // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomThemeImplCopyWith<$Res>
    implements $CustomThemeCopyWith<$Res> {
  factory _$$CustomThemeImplCopyWith(
          _$CustomThemeImpl value, $Res Function(_$CustomThemeImpl) then) =
      __$$CustomThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "color1") String? color1,
      @JsonKey(name: "color2") String? color2,
      @JsonKey(name: "logo") String? logo});
}

/// @nodoc
class __$$CustomThemeImplCopyWithImpl<$Res>
    extends _$CustomThemeCopyWithImpl<$Res, _$CustomThemeImpl>
    implements _$$CustomThemeImplCopyWith<$Res> {
  __$$CustomThemeImplCopyWithImpl(
      _$CustomThemeImpl _value, $Res Function(_$CustomThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color1 = freezed,
    Object? color2 = freezed,
    Object? logo = freezed,
  }) {
    return _then(_$CustomThemeImpl(
      color1: freezed == color1
          ? _value.color1
          : color1 // ignore: cast_nullable_to_non_nullable
              as String?,
      color2: freezed == color2
          ? _value.color2
          : color2 // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomThemeImpl implements _CustomTheme {
  const _$CustomThemeImpl(
      {@JsonKey(name: "color1") this.color1,
      @JsonKey(name: "color2") this.color2,
      @JsonKey(name: "logo") this.logo});

  factory _$CustomThemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomThemeImplFromJson(json);

  @override
  @JsonKey(name: "color1")
  final String? color1;
  @override
  @JsonKey(name: "color2")
  final String? color2;
  @override
  @JsonKey(name: "logo")
  final String? logo;

  @override
  String toString() {
    return 'CustomTheme(color1: $color1, color2: $color2, logo: $logo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomThemeImpl &&
            (identical(other.color1, color1) || other.color1 == color1) &&
            (identical(other.color2, color2) || other.color2 == color2) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, color1, color2, logo);

  /// Create a copy of CustomTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomThemeImplCopyWith<_$CustomThemeImpl> get copyWith =>
      __$$CustomThemeImplCopyWithImpl<_$CustomThemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomThemeImplToJson(
      this,
    );
  }
}

abstract class _CustomTheme implements CustomTheme {
  const factory _CustomTheme(
      {@JsonKey(name: "color1") final String? color1,
      @JsonKey(name: "color2") final String? color2,
      @JsonKey(name: "logo") final String? logo}) = _$CustomThemeImpl;

  factory _CustomTheme.fromJson(Map<String, dynamic> json) =
      _$CustomThemeImpl.fromJson;

  @override
  @JsonKey(name: "color1")
  String? get color1;
  @override
  @JsonKey(name: "color2")
  String? get color2;
  @override
  @JsonKey(name: "logo")
  String? get logo;

  /// Create a copy of CustomTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomThemeImplCopyWith<_$CustomThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Color _$ColorFromJson(Map<String, dynamic> json) {
  return _Color.fromJson(json);
}

/// @nodoc
mixin _$Color {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "color1")
  String? get color1 => throw _privateConstructorUsedError;
  @JsonKey(name: "color2")
  String? get color2 => throw _privateConstructorUsedError;
  @JsonKey(name: "index")
  int? get index => throw _privateConstructorUsedError;

  /// Serializes this Color to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Color
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorCopyWith<Color> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorCopyWith<$Res> {
  factory $ColorCopyWith(Color value, $Res Function(Color) then) =
      _$ColorCopyWithImpl<$Res, Color>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "color1") String? color1,
      @JsonKey(name: "color2") String? color2,
      @JsonKey(name: "index") int? index});
}

/// @nodoc
class _$ColorCopyWithImpl<$Res, $Val extends Color>
    implements $ColorCopyWith<$Res> {
  _$ColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Color
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? color1 = freezed,
    Object? color2 = freezed,
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      color1: freezed == color1
          ? _value.color1
          : color1 // ignore: cast_nullable_to_non_nullable
              as String?,
      color2: freezed == color2
          ? _value.color2
          : color2 // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorImplCopyWith<$Res> implements $ColorCopyWith<$Res> {
  factory _$$ColorImplCopyWith(
          _$ColorImpl value, $Res Function(_$ColorImpl) then) =
      __$$ColorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "color1") String? color1,
      @JsonKey(name: "color2") String? color2,
      @JsonKey(name: "index") int? index});
}

/// @nodoc
class __$$ColorImplCopyWithImpl<$Res>
    extends _$ColorCopyWithImpl<$Res, _$ColorImpl>
    implements _$$ColorImplCopyWith<$Res> {
  __$$ColorImplCopyWithImpl(
      _$ColorImpl _value, $Res Function(_$ColorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Color
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? color1 = freezed,
    Object? color2 = freezed,
    Object? index = freezed,
  }) {
    return _then(_$ColorImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      color1: freezed == color1
          ? _value.color1
          : color1 // ignore: cast_nullable_to_non_nullable
              as String?,
      color2: freezed == color2
          ? _value.color2
          : color2 // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorImpl implements _Color {
  const _$ColorImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "color1") this.color1,
      @JsonKey(name: "color2") this.color2,
      @JsonKey(name: "index") this.index});

  factory _$ColorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "color1")
  final String? color1;
  @override
  @JsonKey(name: "color2")
  final String? color2;
  @override
  @JsonKey(name: "index")
  final int? index;

  @override
  String toString() {
    return 'Color(id: $id, color1: $color1, color2: $color2, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.color1, color1) || other.color1 == color1) &&
            (identical(other.color2, color2) || other.color2 == color2) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, color1, color2, index);

  /// Create a copy of Color
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorImplCopyWith<_$ColorImpl> get copyWith =>
      __$$ColorImplCopyWithImpl<_$ColorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorImplToJson(
      this,
    );
  }
}

abstract class _Color implements Color {
  const factory _Color(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "color1") final String? color1,
      @JsonKey(name: "color2") final String? color2,
      @JsonKey(name: "index") final int? index}) = _$ColorImpl;

  factory _Color.fromJson(Map<String, dynamic> json) = _$ColorImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "color1")
  String? get color1;
  @override
  @JsonKey(name: "color2")
  String? get color2;
  @override
  @JsonKey(name: "index")
  int? get index;

  /// Create a copy of Color
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorImplCopyWith<_$ColorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  @JsonKey(name: "service")
  String? get service => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "content")
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "logo")
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: "orderId")
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: "active")
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this Service to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call(
      {@JsonKey(name: "service") String? service,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "content") String? content,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "logo") String? logo,
      @JsonKey(name: "orderId") int? orderId,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? type = freezed,
    Object? logo = freezed,
    Object? orderId = freezed,
    Object? active = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceImplCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$ServiceImplCopyWith(
          _$ServiceImpl value, $Res Function(_$ServiceImpl) then) =
      __$$ServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "service") String? service,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "content") String? content,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "logo") String? logo,
      @JsonKey(name: "orderId") int? orderId,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class __$$ServiceImplCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$ServiceImpl>
    implements _$$ServiceImplCopyWith<$Res> {
  __$$ServiceImplCopyWithImpl(
      _$ServiceImpl _value, $Res Function(_$ServiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? type = freezed,
    Object? logo = freezed,
    Object? orderId = freezed,
    Object? active = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ServiceImpl(
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceImpl implements _Service {
  const _$ServiceImpl(
      {@JsonKey(name: "service") this.service,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "content") this.content,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "logo") this.logo,
      @JsonKey(name: "orderId") this.orderId,
      @JsonKey(name: "active") this.active,
      @JsonKey(name: "_id") this.id});

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  @JsonKey(name: "service")
  final String? service;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "content")
  final String? content;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "logo")
  final String? logo;
  @override
  @JsonKey(name: "orderId")
  final int? orderId;
  @override
  @JsonKey(name: "active")
  final bool? active;
  @override
  @JsonKey(name: "_id")
  final String? id;

  @override
  String toString() {
    return 'Service(service: $service, title: $title, content: $content, type: $type, logo: $logo, orderId: $orderId, active: $active, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceImpl &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, service, title, content, type, logo, orderId, active, id);

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      __$$ServiceImplCopyWithImpl<_$ServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceImplToJson(
      this,
    );
  }
}

abstract class _Service implements Service {
  const factory _Service(
      {@JsonKey(name: "service") final String? service,
      @JsonKey(name: "title") final String? title,
      @JsonKey(name: "content") final String? content,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "logo") final String? logo,
      @JsonKey(name: "orderId") final int? orderId,
      @JsonKey(name: "active") final bool? active,
      @JsonKey(name: "_id") final String? id}) = _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  @JsonKey(name: "service")
  String? get service;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "content")
  String? get content;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "logo")
  String? get logo;
  @override
  @JsonKey(name: "orderId")
  int? get orderId;
  @override
  @JsonKey(name: "active")
  bool? get active;
  @override
  @JsonKey(name: "_id")
  String? get id;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomService _$CustomServiceFromJson(Map<String, dynamic> json) {
  return _CustomService.fromJson(json);
}

/// @nodoc
mixin _$CustomService {
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "logo")
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this CustomService to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomService
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomServiceCopyWith<CustomService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomServiceCopyWith<$Res> {
  factory $CustomServiceCopyWith(
          CustomService value, $Res Function(CustomService) then) =
      _$CustomServiceCopyWithImpl<$Res, CustomService>;
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "logo") String? logo,
      @JsonKey(name: "link") String? link,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class _$CustomServiceCopyWithImpl<$Res, $Val extends CustomService>
    implements $CustomServiceCopyWith<$Res> {
  _$CustomServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomService
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? logo = freezed,
    Object? link = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomServiceImplCopyWith<$Res>
    implements $CustomServiceCopyWith<$Res> {
  factory _$$CustomServiceImplCopyWith(
          _$CustomServiceImpl value, $Res Function(_$CustomServiceImpl) then) =
      __$$CustomServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "logo") String? logo,
      @JsonKey(name: "link") String? link,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class __$$CustomServiceImplCopyWithImpl<$Res>
    extends _$CustomServiceCopyWithImpl<$Res, _$CustomServiceImpl>
    implements _$$CustomServiceImplCopyWith<$Res> {
  __$$CustomServiceImplCopyWithImpl(
      _$CustomServiceImpl _value, $Res Function(_$CustomServiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomService
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? logo = freezed,
    Object? link = freezed,
    Object? id = freezed,
  }) {
    return _then(_$CustomServiceImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
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
class _$CustomServiceImpl implements _CustomService {
  const _$CustomServiceImpl(
      {@JsonKey(name: "title") this.title,
      @JsonKey(name: "logo") this.logo,
      @JsonKey(name: "link") this.link,
      @JsonKey(name: "_id") this.id});

  factory _$CustomServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomServiceImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "logo")
  final String? logo;
  @override
  @JsonKey(name: "link")
  final String? link;
  @override
  @JsonKey(name: "_id")
  final String? id;

  @override
  String toString() {
    return 'CustomService(title: $title, logo: $logo, link: $link, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomServiceImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, logo, link, id);

  /// Create a copy of CustomService
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomServiceImplCopyWith<_$CustomServiceImpl> get copyWith =>
      __$$CustomServiceImplCopyWithImpl<_$CustomServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomServiceImplToJson(
      this,
    );
  }
}

abstract class _CustomService implements CustomService {
  const factory _CustomService(
      {@JsonKey(name: "title") final String? title,
      @JsonKey(name: "logo") final String? logo,
      @JsonKey(name: "link") final String? link,
      @JsonKey(name: "_id") final String? id}) = _$CustomServiceImpl;

  factory _CustomService.fromJson(Map<String, dynamic> json) =
      _$CustomServiceImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "logo")
  String? get logo;
  @override
  @JsonKey(name: "link")
  String? get link;
  @override
  @JsonKey(name: "_id")
  String? get id;

  /// Create a copy of CustomService
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomServiceImplCopyWith<_$CustomServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  @JsonKey(name: "user")
  String? get user => throw _privateConstructorUsedError;
  @JsonKey(name: "favorite")
  bool? get favorite => throw _privateConstructorUsedError;
  @JsonKey(name: "fcm")
  String? get fcm => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {@JsonKey(name: "user") String? user,
      @JsonKey(name: "favorite") bool? favorite,
      @JsonKey(name: "fcm") String? fcm,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? favorite = freezed,
    Object? fcm = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      fcm: freezed == fcm
          ? _value.fcm
          : fcm // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactImplCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$ContactImplCopyWith(
          _$ContactImpl value, $Res Function(_$ContactImpl) then) =
      __$$ContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user") String? user,
      @JsonKey(name: "favorite") bool? favorite,
      @JsonKey(name: "fcm") String? fcm,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class __$$ContactImplCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$ContactImpl>
    implements _$$ContactImplCopyWith<$Res> {
  __$$ContactImplCopyWithImpl(
      _$ContactImpl _value, $Res Function(_$ContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? favorite = freezed,
    Object? fcm = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ContactImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      fcm: freezed == fcm
          ? _value.fcm
          : fcm // ignore: cast_nullable_to_non_nullable
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
class _$ContactImpl implements _Contact {
  const _$ContactImpl(
      {@JsonKey(name: "user") this.user,
      @JsonKey(name: "favorite") this.favorite,
      @JsonKey(name: "fcm") this.fcm,
      @JsonKey(name: "_id") this.id});

  factory _$ContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);

  @override
  @JsonKey(name: "user")
  final String? user;
  @override
  @JsonKey(name: "favorite")
  final bool? favorite;
  @override
  @JsonKey(name: "fcm")
  final String? fcm;
  @override
  @JsonKey(name: "_id")
  final String? id;

  @override
  String toString() {
    return 'Contact(user: $user, favorite: $favorite, fcm: $fcm, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.fcm, fcm) || other.fcm == fcm) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, favorite, fcm, id);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      __$$ContactImplCopyWithImpl<_$ContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactImplToJson(
      this,
    );
  }
}

abstract class _Contact implements Contact {
  const factory _Contact(
      {@JsonKey(name: "user") final String? user,
      @JsonKey(name: "favorite") final bool? favorite,
      @JsonKey(name: "fcm") final String? fcm,
      @JsonKey(name: "_id") final String? id}) = _$ContactImpl;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$ContactImpl.fromJson;

  @override
  @JsonKey(name: "user")
  String? get user;
  @override
  @JsonKey(name: "favorite")
  bool? get favorite;
  @override
  @JsonKey(name: "fcm")
  String? get fcm;
  @override
  @JsonKey(name: "_id")
  String? get id;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
