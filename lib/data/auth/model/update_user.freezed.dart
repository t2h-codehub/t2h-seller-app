// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) {
  return _UpdateUserRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserRequest {
  String? get name => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get profileImg => throw _privateConstructorUsedError;
  String? get coverVideo => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;

  /// Serializes this UpdateUserRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserRequestCopyWith<UpdateUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserRequestCopyWith<$Res> {
  factory $UpdateUserRequestCopyWith(
          UpdateUserRequest value, $Res Function(UpdateUserRequest) then) =
      _$UpdateUserRequestCopyWithImpl<$Res, UpdateUserRequest>;
  @useResult
  $Res call(
      {String? name,
      String? bio,
      String? designation,
      String? profileImg,
      String? coverVideo,
      String? phone,
      String? companyName,
      String? lang});
}

/// @nodoc
class _$UpdateUserRequestCopyWithImpl<$Res, $Val extends UpdateUserRequest>
    implements $UpdateUserRequestCopyWith<$Res> {
  _$UpdateUserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? bio = freezed,
    Object? designation = freezed,
    Object? profileImg = freezed,
    Object? coverVideo = freezed,
    Object? phone = freezed,
    Object? companyName = freezed,
    Object? lang = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      coverVideo: freezed == coverVideo
          ? _value.coverVideo
          : coverVideo // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUserRequestImplCopyWith<$Res>
    implements $UpdateUserRequestCopyWith<$Res> {
  factory _$$UpdateUserRequestImplCopyWith(_$UpdateUserRequestImpl value,
          $Res Function(_$UpdateUserRequestImpl) then) =
      __$$UpdateUserRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? bio,
      String? designation,
      String? profileImg,
      String? coverVideo,
      String? phone,
      String? companyName,
      String? lang});
}

/// @nodoc
class __$$UpdateUserRequestImplCopyWithImpl<$Res>
    extends _$UpdateUserRequestCopyWithImpl<$Res, _$UpdateUserRequestImpl>
    implements _$$UpdateUserRequestImplCopyWith<$Res> {
  __$$UpdateUserRequestImplCopyWithImpl(_$UpdateUserRequestImpl _value,
      $Res Function(_$UpdateUserRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? bio = freezed,
    Object? designation = freezed,
    Object? profileImg = freezed,
    Object? coverVideo = freezed,
    Object? phone = freezed,
    Object? companyName = freezed,
    Object? lang = freezed,
  }) {
    return _then(_$UpdateUserRequestImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      coverVideo: freezed == coverVideo
          ? _value.coverVideo
          : coverVideo // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUserRequestImpl implements _UpdateUserRequest {
  const _$UpdateUserRequestImpl(
      {this.name,
      this.bio,
      this.designation,
      this.profileImg,
      this.coverVideo,
      this.phone,
      this.companyName,
      this.lang});

  factory _$UpdateUserRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserRequestImplFromJson(json);

  @override
  final String? name;
  @override
  final String? bio;
  @override
  final String? designation;
  @override
  final String? profileImg;
  @override
  final String? coverVideo;
  @override
  final String? phone;
  @override
  final String? companyName;
  @override
  final String? lang;

  @override
  String toString() {
    return 'UpdateUserRequest(name: $name, bio: $bio, designation: $designation, profileImg: $profileImg, coverVideo: $coverVideo, phone: $phone, companyName: $companyName, lang: $lang)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.profileImg, profileImg) ||
                other.profileImg == profileImg) &&
            (identical(other.coverVideo, coverVideo) ||
                other.coverVideo == coverVideo) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.lang, lang) || other.lang == lang));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, bio, designation,
      profileImg, coverVideo, phone, companyName, lang);

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserRequestImplCopyWith<_$UpdateUserRequestImpl> get copyWith =>
      __$$UpdateUserRequestImplCopyWithImpl<_$UpdateUserRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateUserRequest implements UpdateUserRequest {
  const factory _UpdateUserRequest(
      {final String? name,
      final String? bio,
      final String? designation,
      final String? profileImg,
      final String? coverVideo,
      final String? phone,
      final String? companyName,
      final String? lang}) = _$UpdateUserRequestImpl;

  factory _UpdateUserRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateUserRequestImpl.fromJson;

  @override
  String? get name;
  @override
  String? get bio;
  @override
  String? get designation;
  @override
  String? get profileImg;
  @override
  String? get coverVideo;
  @override
  String? get phone;
  @override
  String? get companyName;
  @override
  String? get lang;

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserRequestImplCopyWith<_$UpdateUserRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) {
  return _UpdateUserResponse.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserResponse {
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  /// Serializes this UpdateUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserResponseCopyWith<UpdateUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserResponseCopyWith<$Res> {
  factory $UpdateUserResponseCopyWith(
          UpdateUserResponse value, $Res Function(UpdateUserResponse) then) =
      _$UpdateUserResponseCopyWithImpl<$Res, UpdateUserResponse>;
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class _$UpdateUserResponseCopyWithImpl<$Res, $Val extends UpdateUserResponse>
    implements $UpdateUserResponseCopyWith<$Res> {
  _$UpdateUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserResponse
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
abstract class _$$UpdateUserResponseImplCopyWith<$Res>
    implements $UpdateUserResponseCopyWith<$Res> {
  factory _$$UpdateUserResponseImplCopyWith(_$UpdateUserResponseImpl value,
          $Res Function(_$UpdateUserResponseImpl) then) =
      __$$UpdateUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class __$$UpdateUserResponseImplCopyWithImpl<$Res>
    extends _$UpdateUserResponseCopyWithImpl<$Res, _$UpdateUserResponseImpl>
    implements _$$UpdateUserResponseImplCopyWith<$Res> {
  __$$UpdateUserResponseImplCopyWithImpl(_$UpdateUserResponseImpl _value,
      $Res Function(_$UpdateUserResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_$UpdateUserResponseImpl(
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
class _$UpdateUserResponseImpl implements _UpdateUserResponse {
  const _$UpdateUserResponseImpl({this.message, this.success});

  factory _$UpdateUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? success;

  @override
  String toString() {
    return 'UpdateUserResponse(message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, success);

  /// Create a copy of UpdateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserResponseImplCopyWith<_$UpdateUserResponseImpl> get copyWith =>
      __$$UpdateUserResponseImplCopyWithImpl<_$UpdateUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserResponseImplToJson(
      this,
    );
  }
}

abstract class _UpdateUserResponse implements UpdateUserResponse {
  const factory _UpdateUserResponse(
      {final String? message, final bool? success}) = _$UpdateUserResponseImpl;

  factory _UpdateUserResponse.fromJson(Map<String, dynamic> json) =
      _$UpdateUserResponseImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get success;

  /// Create a copy of UpdateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserResponseImplCopyWith<_$UpdateUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateUserQrRequest _$UpdateUserQrRequestFromJson(Map<String, dynamic> json) {
  return _UpdateUserQrRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserQrRequest {
  String? get qrCode => throw _privateConstructorUsedError;

  /// Serializes this UpdateUserQrRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserQrRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserQrRequestCopyWith<UpdateUserQrRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserQrRequestCopyWith<$Res> {
  factory $UpdateUserQrRequestCopyWith(
          UpdateUserQrRequest value, $Res Function(UpdateUserQrRequest) then) =
      _$UpdateUserQrRequestCopyWithImpl<$Res, UpdateUserQrRequest>;
  @useResult
  $Res call({String? qrCode});
}

/// @nodoc
class _$UpdateUserQrRequestCopyWithImpl<$Res, $Val extends UpdateUserQrRequest>
    implements $UpdateUserQrRequestCopyWith<$Res> {
  _$UpdateUserQrRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserQrRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = freezed,
  }) {
    return _then(_value.copyWith(
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUserQrRequestImplCopyWith<$Res>
    implements $UpdateUserQrRequestCopyWith<$Res> {
  factory _$$UpdateUserQrRequestImplCopyWith(_$UpdateUserQrRequestImpl value,
          $Res Function(_$UpdateUserQrRequestImpl) then) =
      __$$UpdateUserQrRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? qrCode});
}

/// @nodoc
class __$$UpdateUserQrRequestImplCopyWithImpl<$Res>
    extends _$UpdateUserQrRequestCopyWithImpl<$Res, _$UpdateUserQrRequestImpl>
    implements _$$UpdateUserQrRequestImplCopyWith<$Res> {
  __$$UpdateUserQrRequestImplCopyWithImpl(_$UpdateUserQrRequestImpl _value,
      $Res Function(_$UpdateUserQrRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserQrRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = freezed,
  }) {
    return _then(_$UpdateUserQrRequestImpl(
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUserQrRequestImpl implements _UpdateUserQrRequest {
  const _$UpdateUserQrRequestImpl({this.qrCode});

  factory _$UpdateUserQrRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserQrRequestImplFromJson(json);

  @override
  final String? qrCode;

  @override
  String toString() {
    return 'UpdateUserQrRequest(qrCode: $qrCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserQrRequestImpl &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, qrCode);

  /// Create a copy of UpdateUserQrRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserQrRequestImplCopyWith<_$UpdateUserQrRequestImpl> get copyWith =>
      __$$UpdateUserQrRequestImplCopyWithImpl<_$UpdateUserQrRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserQrRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateUserQrRequest implements UpdateUserQrRequest {
  const factory _UpdateUserQrRequest({final String? qrCode}) =
      _$UpdateUserQrRequestImpl;

  factory _UpdateUserQrRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateUserQrRequestImpl.fromJson;

  @override
  String? get qrCode;

  /// Create a copy of UpdateUserQrRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserQrRequestImplCopyWith<_$UpdateUserQrRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateUserQrResponse _$UpdateUserQrResponseFromJson(Map<String, dynamic> json) {
  return _UpdateUserQrResponse.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserQrResponse {
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  /// Serializes this UpdateUserQrResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserQrResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserQrResponseCopyWith<UpdateUserQrResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserQrResponseCopyWith<$Res> {
  factory $UpdateUserQrResponseCopyWith(UpdateUserQrResponse value,
          $Res Function(UpdateUserQrResponse) then) =
      _$UpdateUserQrResponseCopyWithImpl<$Res, UpdateUserQrResponse>;
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class _$UpdateUserQrResponseCopyWithImpl<$Res,
        $Val extends UpdateUserQrResponse>
    implements $UpdateUserQrResponseCopyWith<$Res> {
  _$UpdateUserQrResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserQrResponse
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
abstract class _$$UpdateUserQrResponseImplCopyWith<$Res>
    implements $UpdateUserQrResponseCopyWith<$Res> {
  factory _$$UpdateUserQrResponseImplCopyWith(_$UpdateUserQrResponseImpl value,
          $Res Function(_$UpdateUserQrResponseImpl) then) =
      __$$UpdateUserQrResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool? success});
}

/// @nodoc
class __$$UpdateUserQrResponseImplCopyWithImpl<$Res>
    extends _$UpdateUserQrResponseCopyWithImpl<$Res, _$UpdateUserQrResponseImpl>
    implements _$$UpdateUserQrResponseImplCopyWith<$Res> {
  __$$UpdateUserQrResponseImplCopyWithImpl(_$UpdateUserQrResponseImpl _value,
      $Res Function(_$UpdateUserQrResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserQrResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_$UpdateUserQrResponseImpl(
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
class _$UpdateUserQrResponseImpl implements _UpdateUserQrResponse {
  const _$UpdateUserQrResponseImpl({this.message, this.success});

  factory _$UpdateUserQrResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserQrResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? success;

  @override
  String toString() {
    return 'UpdateUserQrResponse(message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserQrResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, success);

  /// Create a copy of UpdateUserQrResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserQrResponseImplCopyWith<_$UpdateUserQrResponseImpl>
      get copyWith =>
          __$$UpdateUserQrResponseImplCopyWithImpl<_$UpdateUserQrResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserQrResponseImplToJson(
      this,
    );
  }
}

abstract class _UpdateUserQrResponse implements UpdateUserQrResponse {
  const factory _UpdateUserQrResponse(
      {final String? message,
      final bool? success}) = _$UpdateUserQrResponseImpl;

  factory _UpdateUserQrResponse.fromJson(Map<String, dynamic> json) =
      _$UpdateUserQrResponseImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get success;

  /// Create a copy of UpdateUserQrResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserQrResponseImplCopyWith<_$UpdateUserQrResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
