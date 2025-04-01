// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_services.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserServicesResponse _$UserServicesResponseFromJson(Map<String, dynamic> json) {
  return _UserServicesResponse.fromJson(json);
}

/// @nodoc
mixin _$UserServicesResponse {
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  List<Service>? get services => throw _privateConstructorUsedError;

  /// Serializes this UserServicesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserServicesResponseCopyWith<UserServicesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserServicesResponseCopyWith<$Res> {
  factory $UserServicesResponseCopyWith(UserServicesResponse value,
          $Res Function(UserServicesResponse) then) =
      _$UserServicesResponseCopyWithImpl<$Res, UserServicesResponse>;
  @useResult
  $Res call({String? message, bool? success, List<Service>? services});
}

/// @nodoc
class _$UserServicesResponseCopyWithImpl<$Res,
        $Val extends UserServicesResponse>
    implements $UserServicesResponseCopyWith<$Res> {
  _$UserServicesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? services = freezed,
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
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserServicesResponseImplCopyWith<$Res>
    implements $UserServicesResponseCopyWith<$Res> {
  factory _$$UserServicesResponseImplCopyWith(_$UserServicesResponseImpl value,
          $Res Function(_$UserServicesResponseImpl) then) =
      __$$UserServicesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool? success, List<Service>? services});
}

/// @nodoc
class __$$UserServicesResponseImplCopyWithImpl<$Res>
    extends _$UserServicesResponseCopyWithImpl<$Res, _$UserServicesResponseImpl>
    implements _$$UserServicesResponseImplCopyWith<$Res> {
  __$$UserServicesResponseImplCopyWithImpl(_$UserServicesResponseImpl _value,
      $Res Function(_$UserServicesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? services = freezed,
  }) {
    return _then(_$UserServicesResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserServicesResponseImpl implements _UserServicesResponse {
  const _$UserServicesResponseImpl(
      {this.message, this.success, final List<Service>? services})
      : _services = services;

  factory _$UserServicesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserServicesResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? success;
  final List<Service>? _services;
  @override
  List<Service>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserServicesResponse(message: $message, success: $success, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserServicesResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, success,
      const DeepCollectionEquality().hash(_services));

  /// Create a copy of UserServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserServicesResponseImplCopyWith<_$UserServicesResponseImpl>
      get copyWith =>
          __$$UserServicesResponseImplCopyWithImpl<_$UserServicesResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserServicesResponseImplToJson(
      this,
    );
  }
}

abstract class _UserServicesResponse implements UserServicesResponse {
  const factory _UserServicesResponse(
      {final String? message,
      final bool? success,
      final List<Service>? services}) = _$UserServicesResponseImpl;

  factory _UserServicesResponse.fromJson(Map<String, dynamic> json) =
      _$UserServicesResponseImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get success;
  @override
  List<Service>? get services;

  /// Create a copy of UserServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserServicesResponseImplCopyWith<_$UserServicesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  String? get service => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  int? get orderId => throw _privateConstructorUsedError;
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
      {this.service,
      this.title,
      this.content,
      this.type,
      this.logo,
      this.orderId,
      this.active,
      @JsonKey(name: "_id") this.id});

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

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
      {final String? service,
      final String? title,
      final String? content,
      final String? type,
      final String? logo,
      final int? orderId,
      final bool? active,
      @JsonKey(name: "_id") final String? id}) = _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

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

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
