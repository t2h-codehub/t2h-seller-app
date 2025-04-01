// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDetailResponse _$UserDetailResponseFromJson(Map<String, dynamic> json) {
  return _UserDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$UserDetailResponse {
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: "User")
  User? get user => throw _privateConstructorUsedError;

  /// Serializes this UserDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailResponseCopyWith<UserDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailResponseCopyWith<$Res> {
  factory $UserDetailResponseCopyWith(
          UserDetailResponse value, $Res Function(UserDetailResponse) then) =
      _$UserDetailResponseCopyWithImpl<$Res, UserDetailResponse>;
  @useResult
  $Res call(
      {String? message, bool? success, @JsonKey(name: "User") User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserDetailResponseCopyWithImpl<$Res, $Val extends UserDetailResponse>
    implements $UserDetailResponseCopyWith<$Res> {
  _$UserDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? user = freezed,
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
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of UserDetailResponse
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
abstract class _$$UserDetailResponseImplCopyWith<$Res>
    implements $UserDetailResponseCopyWith<$Res> {
  factory _$$UserDetailResponseImplCopyWith(_$UserDetailResponseImpl value,
          $Res Function(_$UserDetailResponseImpl) then) =
      __$$UserDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message, bool? success, @JsonKey(name: "User") User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserDetailResponseImplCopyWithImpl<$Res>
    extends _$UserDetailResponseCopyWithImpl<$Res, _$UserDetailResponseImpl>
    implements _$$UserDetailResponseImplCopyWith<$Res> {
  __$$UserDetailResponseImplCopyWithImpl(_$UserDetailResponseImpl _value,
      $Res Function(_$UserDetailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? user = freezed,
  }) {
    return _then(_$UserDetailResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
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
class _$UserDetailResponseImpl implements _UserDetailResponse {
  const _$UserDetailResponseImpl(
      {this.message, this.success, @JsonKey(name: "User") this.user});

  factory _$UserDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? success;
  @override
  @JsonKey(name: "User")
  final User? user;

  @override
  String toString() {
    return 'UserDetailResponse(message: $message, success: $success, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, success, user);

  /// Create a copy of UserDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailResponseImplCopyWith<_$UserDetailResponseImpl> get copyWith =>
      __$$UserDetailResponseImplCopyWithImpl<_$UserDetailResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _UserDetailResponse implements UserDetailResponse {
  const factory _UserDetailResponse(
      {final String? message,
      final bool? success,
      @JsonKey(name: "User") final User? user}) = _$UserDetailResponseImpl;

  factory _UserDetailResponse.fromJson(Map<String, dynamic> json) =
      _$UserDetailResponseImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get success;
  @override
  @JsonKey(name: "User")
  User? get user;

  /// Create a copy of UserDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailResponseImplCopyWith<_$UserDetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get profileImg => throw _privateConstructorUsedError;
  String? get coverVideo => throw _privateConstructorUsedError;
  String? get qrCode => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: "services")
  List<Service>? get services => throw _privateConstructorUsedError;
  @JsonKey(name: "color")
  Color? get color => throw _privateConstructorUsedError;
  bool? get theme => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  List<Contact>? get contacts => throw _privateConstructorUsedError;
  bool? get gainLeads => throw _privateConstructorUsedError;
  bool? get quickIntro => throw _privateConstructorUsedError;
  bool? get helloDirect => throw _privateConstructorUsedError;
  @JsonKey(name: "customServices")
  List<CustomService>? get customServices => throw _privateConstructorUsedError;
  @JsonKey(name: "helloService")
  HelloService? get helloService => throw _privateConstructorUsedError;
  bool? get isPro => throw _privateConstructorUsedError;
  bool? get isProPlus => throw _privateConstructorUsedError;
  bool? get isMobileVerified => throw _privateConstructorUsedError;
  bool? get isCustomBranding => throw _privateConstructorUsedError;
  @JsonKey(name: "customBranding")
  CustomBranding? get customBranding => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  List<String>? get cards => throw _privateConstructorUsedError;
  @JsonKey(name: "plan")
  Plan? get plan => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

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
      String? name,
      String? email,
      String? phone,
      String? designation,
      String? bio,
      String? profileImg,
      String? coverVideo,
      String? qrCode,
      String? companyName,
      bool? active,
      @JsonKey(name: "services") List<Service>? services,
      @JsonKey(name: "color") Color? color,
      bool? theme,
      String? lang,
      List<Contact>? contacts,
      bool? gainLeads,
      bool? quickIntro,
      bool? helloDirect,
      @JsonKey(name: "customServices") List<CustomService>? customServices,
      @JsonKey(name: "helloService") HelloService? helloService,
      bool? isPro,
      bool? isProPlus,
      bool? isMobileVerified,
      bool? isCustomBranding,
      @JsonKey(name: "customBranding") CustomBranding? customBranding,
      String? username,
      List<String>? cards,
      @JsonKey(name: "plan") Plan? plan,
      String? type});

  $ColorCopyWith<$Res>? get color;
  $HelloServiceCopyWith<$Res>? get helloService;
  $CustomBrandingCopyWith<$Res>? get customBranding;
  $PlanCopyWith<$Res>? get plan;
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
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? designation = freezed,
    Object? bio = freezed,
    Object? profileImg = freezed,
    Object? coverVideo = freezed,
    Object? qrCode = freezed,
    Object? companyName = freezed,
    Object? active = freezed,
    Object? services = freezed,
    Object? color = freezed,
    Object? theme = freezed,
    Object? lang = freezed,
    Object? contacts = freezed,
    Object? gainLeads = freezed,
    Object? quickIntro = freezed,
    Object? helloDirect = freezed,
    Object? customServices = freezed,
    Object? helloService = freezed,
    Object? isPro = freezed,
    Object? isProPlus = freezed,
    Object? isMobileVerified = freezed,
    Object? isCustomBranding = freezed,
    Object? customBranding = freezed,
    Object? username = freezed,
    Object? cards = freezed,
    Object? plan = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      coverVideo: freezed == coverVideo
          ? _value.coverVideo
          : coverVideo // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as bool?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
      gainLeads: freezed == gainLeads
          ? _value.gainLeads
          : gainLeads // ignore: cast_nullable_to_non_nullable
              as bool?,
      quickIntro: freezed == quickIntro
          ? _value.quickIntro
          : quickIntro // ignore: cast_nullable_to_non_nullable
              as bool?,
      helloDirect: freezed == helloDirect
          ? _value.helloDirect
          : helloDirect // ignore: cast_nullable_to_non_nullable
              as bool?,
      customServices: freezed == customServices
          ? _value.customServices
          : customServices // ignore: cast_nullable_to_non_nullable
              as List<CustomService>?,
      helloService: freezed == helloService
          ? _value.helloService
          : helloService // ignore: cast_nullable_to_non_nullable
              as HelloService?,
      isPro: freezed == isPro
          ? _value.isPro
          : isPro // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProPlus: freezed == isProPlus
          ? _value.isProPlus
          : isProPlus // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMobileVerified: freezed == isMobileVerified
          ? _value.isMobileVerified
          : isMobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCustomBranding: freezed == isCustomBranding
          ? _value.isCustomBranding
          : isCustomBranding // ignore: cast_nullable_to_non_nullable
              as bool?,
      customBranding: freezed == customBranding
          ? _value.customBranding
          : customBranding // ignore: cast_nullable_to_non_nullable
              as CustomBranding?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      cards: freezed == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as Plan?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HelloServiceCopyWith<$Res>? get helloService {
    if (_value.helloService == null) {
      return null;
    }

    return $HelloServiceCopyWith<$Res>(_value.helloService!, (value) {
      return _then(_value.copyWith(helloService: value) as $Val);
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
  $PlanCopyWith<$Res>? get plan {
    if (_value.plan == null) {
      return null;
    }

    return $PlanCopyWith<$Res>(_value.plan!, (value) {
      return _then(_value.copyWith(plan: value) as $Val);
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
      {String? id,
      String? name,
      String? email,
      String? phone,
      String? designation,
      String? bio,
      String? profileImg,
      String? coverVideo,
      String? qrCode,
      String? companyName,
      bool? active,
      @JsonKey(name: "services") List<Service>? services,
      @JsonKey(name: "color") Color? color,
      bool? theme,
      String? lang,
      List<Contact>? contacts,
      bool? gainLeads,
      bool? quickIntro,
      bool? helloDirect,
      @JsonKey(name: "customServices") List<CustomService>? customServices,
      @JsonKey(name: "helloService") HelloService? helloService,
      bool? isPro,
      bool? isProPlus,
      bool? isMobileVerified,
      bool? isCustomBranding,
      @JsonKey(name: "customBranding") CustomBranding? customBranding,
      String? username,
      List<String>? cards,
      @JsonKey(name: "plan") Plan? plan,
      String? type});

  @override
  $ColorCopyWith<$Res>? get color;
  @override
  $HelloServiceCopyWith<$Res>? get helloService;
  @override
  $CustomBrandingCopyWith<$Res>? get customBranding;
  @override
  $PlanCopyWith<$Res>? get plan;
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
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? designation = freezed,
    Object? bio = freezed,
    Object? profileImg = freezed,
    Object? coverVideo = freezed,
    Object? qrCode = freezed,
    Object? companyName = freezed,
    Object? active = freezed,
    Object? services = freezed,
    Object? color = freezed,
    Object? theme = freezed,
    Object? lang = freezed,
    Object? contacts = freezed,
    Object? gainLeads = freezed,
    Object? quickIntro = freezed,
    Object? helloDirect = freezed,
    Object? customServices = freezed,
    Object? helloService = freezed,
    Object? isPro = freezed,
    Object? isProPlus = freezed,
    Object? isMobileVerified = freezed,
    Object? isCustomBranding = freezed,
    Object? customBranding = freezed,
    Object? username = freezed,
    Object? cards = freezed,
    Object? plan = freezed,
    Object? type = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      coverVideo: freezed == coverVideo
          ? _value.coverVideo
          : coverVideo // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as bool?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      contacts: freezed == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
      gainLeads: freezed == gainLeads
          ? _value.gainLeads
          : gainLeads // ignore: cast_nullable_to_non_nullable
              as bool?,
      quickIntro: freezed == quickIntro
          ? _value.quickIntro
          : quickIntro // ignore: cast_nullable_to_non_nullable
              as bool?,
      helloDirect: freezed == helloDirect
          ? _value.helloDirect
          : helloDirect // ignore: cast_nullable_to_non_nullable
              as bool?,
      customServices: freezed == customServices
          ? _value._customServices
          : customServices // ignore: cast_nullable_to_non_nullable
              as List<CustomService>?,
      helloService: freezed == helloService
          ? _value.helloService
          : helloService // ignore: cast_nullable_to_non_nullable
              as HelloService?,
      isPro: freezed == isPro
          ? _value.isPro
          : isPro // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProPlus: freezed == isProPlus
          ? _value.isProPlus
          : isProPlus // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMobileVerified: freezed == isMobileVerified
          ? _value.isMobileVerified
          : isMobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCustomBranding: freezed == isCustomBranding
          ? _value.isCustomBranding
          : isCustomBranding // ignore: cast_nullable_to_non_nullable
              as bool?,
      customBranding: freezed == customBranding
          ? _value.customBranding
          : customBranding // ignore: cast_nullable_to_non_nullable
              as CustomBranding?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      cards: freezed == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as Plan?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.designation,
      this.bio,
      this.profileImg,
      this.coverVideo,
      this.qrCode,
      this.companyName,
      this.active,
      @JsonKey(name: "services") final List<Service>? services,
      @JsonKey(name: "color") this.color,
      this.theme,
      this.lang,
      final List<Contact>? contacts,
      this.gainLeads,
      this.quickIntro,
      this.helloDirect,
      @JsonKey(name: "customServices")
      final List<CustomService>? customServices,
      @JsonKey(name: "helloService") this.helloService,
      this.isPro,
      this.isProPlus,
      this.isMobileVerified,
      this.isCustomBranding,
      @JsonKey(name: "customBranding") this.customBranding,
      this.username,
      final List<String>? cards,
      @JsonKey(name: "plan") this.plan,
      this.type})
      : _services = services,
        _contacts = contacts,
        _customServices = customServices,
        _cards = cards;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? designation;
  @override
  final String? bio;
  @override
  final String? profileImg;
  @override
  final String? coverVideo;
  @override
  final String? qrCode;
  @override
  final String? companyName;
  @override
  final bool? active;
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

  @override
  @JsonKey(name: "color")
  final Color? color;
  @override
  final bool? theme;
  @override
  final String? lang;
  final List<Contact>? _contacts;
  @override
  List<Contact>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? gainLeads;
  @override
  final bool? quickIntro;
  @override
  final bool? helloDirect;
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

  @override
  @JsonKey(name: "helloService")
  final HelloService? helloService;
  @override
  final bool? isPro;
  @override
  final bool? isProPlus;
  @override
  final bool? isMobileVerified;
  @override
  final bool? isCustomBranding;
  @override
  @JsonKey(name: "customBranding")
  final CustomBranding? customBranding;
  @override
  final String? username;
  final List<String>? _cards;
  @override
  List<String>? get cards {
    final value = _cards;
    if (value == null) return null;
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "plan")
  final Plan? plan;
  @override
  final String? type;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, designation: $designation, bio: $bio, profileImg: $profileImg, coverVideo: $coverVideo, qrCode: $qrCode, companyName: $companyName, active: $active, services: $services, color: $color, theme: $theme, lang: $lang, contacts: $contacts, gainLeads: $gainLeads, quickIntro: $quickIntro, helloDirect: $helloDirect, customServices: $customServices, helloService: $helloService, isPro: $isPro, isProPlus: $isProPlus, isMobileVerified: $isMobileVerified, isCustomBranding: $isCustomBranding, customBranding: $customBranding, username: $username, cards: $cards, plan: $plan, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.profileImg, profileImg) ||
                other.profileImg == profileImg) &&
            (identical(other.coverVideo, coverVideo) ||
                other.coverVideo == coverVideo) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.gainLeads, gainLeads) ||
                other.gainLeads == gainLeads) &&
            (identical(other.quickIntro, quickIntro) ||
                other.quickIntro == quickIntro) &&
            (identical(other.helloDirect, helloDirect) ||
                other.helloDirect == helloDirect) &&
            const DeepCollectionEquality()
                .equals(other._customServices, _customServices) &&
            (identical(other.helloService, helloService) ||
                other.helloService == helloService) &&
            (identical(other.isPro, isPro) || other.isPro == isPro) &&
            (identical(other.isProPlus, isProPlus) ||
                other.isProPlus == isProPlus) &&
            (identical(other.isMobileVerified, isMobileVerified) ||
                other.isMobileVerified == isMobileVerified) &&
            (identical(other.isCustomBranding, isCustomBranding) ||
                other.isCustomBranding == isCustomBranding) &&
            (identical(other.customBranding, customBranding) ||
                other.customBranding == customBranding) &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        email,
        phone,
        designation,
        bio,
        profileImg,
        coverVideo,
        qrCode,
        companyName,
        active,
        const DeepCollectionEquality().hash(_services),
        color,
        theme,
        lang,
        const DeepCollectionEquality().hash(_contacts),
        gainLeads,
        quickIntro,
        helloDirect,
        const DeepCollectionEquality().hash(_customServices),
        helloService,
        isPro,
        isProPlus,
        isMobileVerified,
        isCustomBranding,
        customBranding,
        username,
        const DeepCollectionEquality().hash(_cards),
        plan,
        type
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
      {final String? id,
      final String? name,
      final String? email,
      final String? phone,
      final String? designation,
      final String? bio,
      final String? profileImg,
      final String? coverVideo,
      final String? qrCode,
      final String? companyName,
      final bool? active,
      @JsonKey(name: "services") final List<Service>? services,
      @JsonKey(name: "color") final Color? color,
      final bool? theme,
      final String? lang,
      final List<Contact>? contacts,
      final bool? gainLeads,
      final bool? quickIntro,
      final bool? helloDirect,
      @JsonKey(name: "customServices")
      final List<CustomService>? customServices,
      @JsonKey(name: "helloService") final HelloService? helloService,
      final bool? isPro,
      final bool? isProPlus,
      final bool? isMobileVerified,
      final bool? isCustomBranding,
      @JsonKey(name: "customBranding") final CustomBranding? customBranding,
      final String? username,
      final List<String>? cards,
      @JsonKey(name: "plan") final Plan? plan,
      final String? type}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get designation;
  @override
  String? get bio;
  @override
  String? get profileImg;
  @override
  String? get coverVideo;
  @override
  String? get qrCode;
  @override
  String? get companyName;
  @override
  bool? get active;
  @override
  @JsonKey(name: "services")
  List<Service>? get services;
  @override
  @JsonKey(name: "color")
  Color? get color;
  @override
  bool? get theme;
  @override
  String? get lang;
  @override
  List<Contact>? get contacts;
  @override
  bool? get gainLeads;
  @override
  bool? get quickIntro;
  @override
  bool? get helloDirect;
  @override
  @JsonKey(name: "customServices")
  List<CustomService>? get customServices;
  @override
  @JsonKey(name: "helloService")
  HelloService? get helloService;
  @override
  bool? get isPro;
  @override
  bool? get isProPlus;
  @override
  bool? get isMobileVerified;
  @override
  bool? get isCustomBranding;
  @override
  @JsonKey(name: "customBranding")
  CustomBranding? get customBranding;
  @override
  String? get username;
  @override
  List<String>? get cards;
  @override
  @JsonKey(name: "plan")
  Plan? get plan;
  @override
  String? get type;

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
  PlanType? get planType => throw _privateConstructorUsedError;
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
      {@JsonKey(name: "planType") PlanType? planType,
      @JsonKey(name: "expiresAt") DateTime? expiresAt,
      @JsonKey(name: "active") bool? active});

  $PlanTypeCopyWith<$Res>? get planType;
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
              as PlanType?,
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

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlanTypeCopyWith<$Res>? get planType {
    if (_value.planType == null) {
      return null;
    }

    return $PlanTypeCopyWith<$Res>(_value.planType!, (value) {
      return _then(_value.copyWith(planType: value) as $Val);
    });
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
      {@JsonKey(name: "planType") PlanType? planType,
      @JsonKey(name: "expiresAt") DateTime? expiresAt,
      @JsonKey(name: "active") bool? active});

  @override
  $PlanTypeCopyWith<$Res>? get planType;
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
              as PlanType?,
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
  final PlanType? planType;
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
      {@JsonKey(name: "planType") final PlanType? planType,
      @JsonKey(name: "expiresAt") final DateTime? expiresAt,
      @JsonKey(name: "active") final bool? active}) = _$PlanImpl;

  factory _Plan.fromJson(Map<String, dynamic> json) = _$PlanImpl.fromJson;

  @override
  @JsonKey(name: "planType")
  PlanType? get planType;
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

PlanType _$PlanTypeFromJson(Map<String, dynamic> json) {
  return _PlanType.fromJson(json);
}

/// @nodoc
mixin _$PlanType {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "active")
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: "features")
  List<String>? get features => throw _privateConstructorUsedError;

  /// Serializes this PlanType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanTypeCopyWith<PlanType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanTypeCopyWith<$Res> {
  factory $PlanTypeCopyWith(PlanType value, $Res Function(PlanType) then) =
      _$PlanTypeCopyWithImpl<$Res, PlanType>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "features") List<String>? features});
}

/// @nodoc
class _$PlanTypeCopyWithImpl<$Res, $Val extends PlanType>
    implements $PlanTypeCopyWith<$Res> {
  _$PlanTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? active = freezed,
    Object? features = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanTypeImplCopyWith<$Res>
    implements $PlanTypeCopyWith<$Res> {
  factory _$$PlanTypeImplCopyWith(
          _$PlanTypeImpl value, $Res Function(_$PlanTypeImpl) then) =
      __$$PlanTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "features") List<String>? features});
}

/// @nodoc
class __$$PlanTypeImplCopyWithImpl<$Res>
    extends _$PlanTypeCopyWithImpl<$Res, _$PlanTypeImpl>
    implements _$$PlanTypeImplCopyWith<$Res> {
  __$$PlanTypeImplCopyWithImpl(
      _$PlanTypeImpl _value, $Res Function(_$PlanTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlanType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? active = freezed,
    Object? features = freezed,
  }) {
    return _then(_$PlanTypeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanTypeImpl implements _PlanType {
  const _$PlanTypeImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "active") this.active,
      @JsonKey(name: "features") final List<String>? features})
      : _features = features;

  factory _$PlanTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanTypeImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "active")
  final bool? active;
  final List<String>? _features;
  @override
  @JsonKey(name: "features")
  List<String>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PlanType(id: $id, title: $title, active: $active, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, active,
      const DeepCollectionEquality().hash(_features));

  /// Create a copy of PlanType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanTypeImplCopyWith<_$PlanTypeImpl> get copyWith =>
      __$$PlanTypeImplCopyWithImpl<_$PlanTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanTypeImplToJson(
      this,
    );
  }
}

abstract class _PlanType implements PlanType {
  const factory _PlanType(
          {@JsonKey(name: "_id") final String? id,
          @JsonKey(name: "title") final String? title,
          @JsonKey(name: "active") final bool? active,
          @JsonKey(name: "features") final List<String>? features}) =
      _$PlanTypeImpl;

  factory _PlanType.fromJson(Map<String, dynamic> json) =
      _$PlanTypeImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "active")
  bool? get active;
  @override
  @JsonKey(name: "features")
  List<String>? get features;

  /// Create a copy of PlanType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanTypeImplCopyWith<_$PlanTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  String? get name => throw _privateConstructorUsedError;
  List<Value>? get value => throw _privateConstructorUsedError;

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
  $Res call({String? name, List<Value>? value});
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
    Object? name = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Value>?,
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
  $Res call({String? name, List<Value>? value});
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
    Object? name = freezed,
    Object? value = freezed,
  }) {
    return _then(_$ServiceImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Value>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceImpl implements _Service {
  const _$ServiceImpl({this.name, final List<Value>? value}) : _value = value;

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  final String? name;
  final List<Value>? _value;
  @override
  List<Value>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Service(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_value));

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
  const factory _Service({final String? name, final List<Value>? value}) =
      _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  String? get name;
  @override
  List<Value>? get value;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Value _$ValueFromJson(Map<String, dynamic> json) {
  return _Value.fromJson(json);
}

/// @nodoc
mixin _$Value {
  String? get service => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  int? get orderId => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this Value to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Value
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValueCopyWith<Value> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueCopyWith<$Res> {
  factory $ValueCopyWith(Value value, $Res Function(Value) then) =
      _$ValueCopyWithImpl<$Res, Value>;
  @useResult
  $Res call(
      {String? service,
      String? title,
      String? content,
      String? type,
      String? logo,
      int? orderId,
      bool? active,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class _$ValueCopyWithImpl<$Res, $Val extends Value>
    implements $ValueCopyWith<$Res> {
  _$ValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Value
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
abstract class _$$ValueImplCopyWith<$Res> implements $ValueCopyWith<$Res> {
  factory _$$ValueImplCopyWith(
          _$ValueImpl value, $Res Function(_$ValueImpl) then) =
      __$$ValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? service,
      String? title,
      String? content,
      String? type,
      String? logo,
      int? orderId,
      bool? active,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class __$$ValueImplCopyWithImpl<$Res>
    extends _$ValueCopyWithImpl<$Res, _$ValueImpl>
    implements _$$ValueImplCopyWith<$Res> {
  __$$ValueImplCopyWithImpl(
      _$ValueImpl _value, $Res Function(_$ValueImpl) _then)
      : super(_value, _then);

  /// Create a copy of Value
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
    return _then(_$ValueImpl(
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
class _$ValueImpl implements _Value {
  const _$ValueImpl(
      {this.service,
      this.title,
      this.content,
      this.type,
      this.logo,
      this.orderId,
      this.active,
      @JsonKey(name: "_id") this.id});

  factory _$ValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValueImplFromJson(json);

  @override
  final String? service;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? type;
  @override
  final String? logo;
  @override
  final int? orderId;
  @override
  final bool? active;
  @override
  @JsonKey(name: "_id")
  final String? id;

  @override
  String toString() {
    return 'Value(service: $service, title: $title, content: $content, type: $type, logo: $logo, orderId: $orderId, active: $active, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValueImpl &&
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

  /// Create a copy of Value
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValueImplCopyWith<_$ValueImpl> get copyWith =>
      __$$ValueImplCopyWithImpl<_$ValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValueImplToJson(
      this,
    );
  }
}

abstract class _Value implements Value {
  const factory _Value(
      {final String? service,
      final String? title,
      final String? content,
      final String? type,
      final String? logo,
      final int? orderId,
      final bool? active,
      @JsonKey(name: "_id") final String? id}) = _$ValueImpl;

  factory _Value.fromJson(Map<String, dynamic> json) = _$ValueImpl.fromJson;

  @override
  String? get service;
  @override
  String? get title;
  @override
  String? get content;
  @override
  String? get type;
  @override
  String? get logo;
  @override
  int? get orderId;
  @override
  bool? get active;
  @override
  @JsonKey(name: "_id")
  String? get id;

  /// Create a copy of Value
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValueImplCopyWith<_$ValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Color _$ColorFromJson(Map<String, dynamic> json) {
  return _Color.fromJson(json);
}

/// @nodoc
mixin _$Color {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get color1 => throw _privateConstructorUsedError;
  String? get color2 => throw _privateConstructorUsedError;
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
      String? color1,
      String? color2,
      int? index});
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
      String? color1,
      String? color2,
      int? index});
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
      {@JsonKey(name: "_id") this.id, this.color1, this.color2, this.index});

  factory _$ColorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? color1;
  @override
  final String? color2;
  @override
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
      final String? color1,
      final String? color2,
      final int? index}) = _$ColorImpl;

  factory _Color.fromJson(Map<String, dynamic> json) = _$ColorImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get color1;
  @override
  String? get color2;
  @override
  int? get index;

  /// Create a copy of Color
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorImplCopyWith<_$ColorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomService _$CustomServiceFromJson(Map<String, dynamic> json) {
  return _CustomService.fromJson(json);
}

/// @nodoc
mixin _$CustomService {
  String? get title => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
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
      {String? title,
      String? logo,
      String? link,
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
      {String? title,
      String? logo,
      String? link,
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
      {this.title, this.logo, this.link, @JsonKey(name: "_id") this.id});

  factory _$CustomServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomServiceImplFromJson(json);

  @override
  final String? title;
  @override
  final String? logo;
  @override
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
      {final String? title,
      final String? logo,
      final String? link,
      @JsonKey(name: "_id") final String? id}) = _$CustomServiceImpl;

  factory _CustomService.fromJson(Map<String, dynamic> json) =
      _$CustomServiceImpl.fromJson;

  @override
  String? get title;
  @override
  String? get logo;
  @override
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

CustomBranding _$CustomBrandingFromJson(Map<String, dynamic> json) {
  return _CustomBranding.fromJson(json);
}

/// @nodoc
mixin _$CustomBranding {
  String? get color => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  CustomTheme? get customTheme => throw _privateConstructorUsedError;

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
  $Res call({String? color, String? image, CustomTheme? customTheme});

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
    Object? color = freezed,
    Object? image = freezed,
    Object? customTheme = freezed,
  }) {
    return _then(_value.copyWith(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      customTheme: freezed == customTheme
          ? _value.customTheme
          : customTheme // ignore: cast_nullable_to_non_nullable
              as CustomTheme?,
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
  $Res call({String? color, String? image, CustomTheme? customTheme});

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
    Object? color = freezed,
    Object? image = freezed,
    Object? customTheme = freezed,
  }) {
    return _then(_$CustomBrandingImpl(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      customTheme: freezed == customTheme
          ? _value.customTheme
          : customTheme // ignore: cast_nullable_to_non_nullable
              as CustomTheme?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomBrandingImpl implements _CustomBranding {
  const _$CustomBrandingImpl({this.color, this.image, this.customTheme});

  factory _$CustomBrandingImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomBrandingImplFromJson(json);

  @override
  final String? color;
  @override
  final String? image;
  @override
  final CustomTheme? customTheme;

  @override
  String toString() {
    return 'CustomBranding(color: $color, image: $image, customTheme: $customTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomBrandingImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.customTheme, customTheme) ||
                other.customTheme == customTheme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, color, image, customTheme);

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
      {final String? color,
      final String? image,
      final CustomTheme? customTheme}) = _$CustomBrandingImpl;

  factory _CustomBranding.fromJson(Map<String, dynamic> json) =
      _$CustomBrandingImpl.fromJson;

  @override
  String? get color;
  @override
  String? get image;
  @override
  CustomTheme? get customTheme;

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
  String? get color1 => throw _privateConstructorUsedError;
  String? get color2 => throw _privateConstructorUsedError;
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
  $Res call({String? color1, String? color2, String? logo});
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
  $Res call({String? color1, String? color2, String? logo});
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
  const _$CustomThemeImpl({this.color1, this.color2, this.logo});

  factory _$CustomThemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomThemeImplFromJson(json);

  @override
  final String? color1;
  @override
  final String? color2;
  @override
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
      {final String? color1,
      final String? color2,
      final String? logo}) = _$CustomThemeImpl;

  factory _CustomTheme.fromJson(Map<String, dynamic> json) =
      _$CustomThemeImpl.fromJson;

  @override
  String? get color1;
  @override
  String? get color2;
  @override
  String? get logo;

  /// Create a copy of CustomTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomThemeImplCopyWith<_$CustomThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  String? get user => throw _privateConstructorUsedError;
  bool? get favorite => throw _privateConstructorUsedError;
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
      {String? user,
      bool? favorite,
      String? fcm,
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
      {String? user,
      bool? favorite,
      String? fcm,
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
      {this.user, this.favorite, this.fcm, @JsonKey(name: "_id") this.id});

  factory _$ContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);

  @override
  final String? user;
  @override
  final bool? favorite;
  @override
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
      {final String? user,
      final bool? favorite,
      final String? fcm,
      @JsonKey(name: "_id") final String? id}) = _$ContactImpl;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$ContactImpl.fromJson;

  @override
  String? get user;
  @override
  bool? get favorite;
  @override
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

HelloService _$HelloServiceFromJson(Map<String, dynamic> json) {
  return _HelloService.fromJson(json);
}

/// @nodoc
mixin _$HelloService {
  String? get service => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  int? get orderId => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this HelloService to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HelloService
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HelloServiceCopyWith<HelloService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelloServiceCopyWith<$Res> {
  factory $HelloServiceCopyWith(
          HelloService value, $Res Function(HelloService) then) =
      _$HelloServiceCopyWithImpl<$Res, HelloService>;
  @useResult
  $Res call(
      {String? service,
      String? title,
      String? content,
      String? type,
      String? logo,
      int? orderId,
      bool? active,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class _$HelloServiceCopyWithImpl<$Res, $Val extends HelloService>
    implements $HelloServiceCopyWith<$Res> {
  _$HelloServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HelloService
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
abstract class _$$HelloServiceImplCopyWith<$Res>
    implements $HelloServiceCopyWith<$Res> {
  factory _$$HelloServiceImplCopyWith(
          _$HelloServiceImpl value, $Res Function(_$HelloServiceImpl) then) =
      __$$HelloServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? service,
      String? title,
      String? content,
      String? type,
      String? logo,
      int? orderId,
      bool? active,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class __$$HelloServiceImplCopyWithImpl<$Res>
    extends _$HelloServiceCopyWithImpl<$Res, _$HelloServiceImpl>
    implements _$$HelloServiceImplCopyWith<$Res> {
  __$$HelloServiceImplCopyWithImpl(
      _$HelloServiceImpl _value, $Res Function(_$HelloServiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of HelloService
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
    return _then(_$HelloServiceImpl(
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
class _$HelloServiceImpl implements _HelloService {
  const _$HelloServiceImpl(
      {this.service,
      this.title,
      this.content,
      this.type,
      this.logo,
      this.orderId,
      this.active,
      @JsonKey(name: "_id") this.id});

  factory _$HelloServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$HelloServiceImplFromJson(json);

  @override
  final String? service;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? type;
  @override
  final String? logo;
  @override
  final int? orderId;
  @override
  final bool? active;
  @override
  @JsonKey(name: "_id")
  final String? id;

  @override
  String toString() {
    return 'HelloService(service: $service, title: $title, content: $content, type: $type, logo: $logo, orderId: $orderId, active: $active, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelloServiceImpl &&
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

  /// Create a copy of HelloService
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HelloServiceImplCopyWith<_$HelloServiceImpl> get copyWith =>
      __$$HelloServiceImplCopyWithImpl<_$HelloServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HelloServiceImplToJson(
      this,
    );
  }
}

abstract class _HelloService implements HelloService {
  const factory _HelloService(
      {final String? service,
      final String? title,
      final String? content,
      final String? type,
      final String? logo,
      final int? orderId,
      final bool? active,
      @JsonKey(name: "_id") final String? id}) = _$HelloServiceImpl;

  factory _HelloService.fromJson(Map<String, dynamic> json) =
      _$HelloServiceImpl.fromJson;

  @override
  String? get service;
  @override
  String? get title;
  @override
  String? get content;
  @override
  String? get type;
  @override
  String? get logo;
  @override
  int? get orderId;
  @override
  bool? get active;
  @override
  @JsonKey(name: "_id")
  String? get id;

  /// Create a copy of HelloService
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HelloServiceImplCopyWith<_$HelloServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
