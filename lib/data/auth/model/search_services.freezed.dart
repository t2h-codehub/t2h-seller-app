// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_services.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetSearchServicesResponse _$GetSearchServicesResponseFromJson(
    Map<String, dynamic> json) {
  return _GetSearchServicesResponse.fromJson(json);
}

/// @nodoc
mixin _$GetSearchServicesResponse {
  String? get message => throw _privateConstructorUsedError;
  List<Service>? get services => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  /// Serializes this GetSearchServicesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetSearchServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetSearchServicesResponseCopyWith<GetSearchServicesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSearchServicesResponseCopyWith<$Res> {
  factory $GetSearchServicesResponseCopyWith(GetSearchServicesResponse value,
          $Res Function(GetSearchServicesResponse) then) =
      _$GetSearchServicesResponseCopyWithImpl<$Res, GetSearchServicesResponse>;
  @useResult
  $Res call({String? message, List<Service>? services, bool? success});
}

/// @nodoc
class _$GetSearchServicesResponseCopyWithImpl<$Res,
        $Val extends GetSearchServicesResponse>
    implements $GetSearchServicesResponseCopyWith<$Res> {
  _$GetSearchServicesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetSearchServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? services = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetSearchServicesResponseImplCopyWith<$Res>
    implements $GetSearchServicesResponseCopyWith<$Res> {
  factory _$$GetSearchServicesResponseImplCopyWith(
          _$GetSearchServicesResponseImpl value,
          $Res Function(_$GetSearchServicesResponseImpl) then) =
      __$$GetSearchServicesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, List<Service>? services, bool? success});
}

/// @nodoc
class __$$GetSearchServicesResponseImplCopyWithImpl<$Res>
    extends _$GetSearchServicesResponseCopyWithImpl<$Res,
        _$GetSearchServicesResponseImpl>
    implements _$$GetSearchServicesResponseImplCopyWith<$Res> {
  __$$GetSearchServicesResponseImplCopyWithImpl(
      _$GetSearchServicesResponseImpl _value,
      $Res Function(_$GetSearchServicesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetSearchServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? services = freezed,
    Object? success = freezed,
  }) {
    return _then(_$GetSearchServicesResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetSearchServicesResponseImpl implements _GetSearchServicesResponse {
  const _$GetSearchServicesResponseImpl(
      {this.message, final List<Service>? services, this.success})
      : _services = services;

  factory _$GetSearchServicesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetSearchServicesResponseImplFromJson(json);

  @override
  final String? message;
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
  final bool? success;

  @override
  String toString() {
    return 'GetSearchServicesResponse(message: $message, services: $services, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchServicesResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_services), success);

  /// Create a copy of GetSearchServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSearchServicesResponseImplCopyWith<_$GetSearchServicesResponseImpl>
      get copyWith => __$$GetSearchServicesResponseImplCopyWithImpl<
          _$GetSearchServicesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSearchServicesResponseImplToJson(
      this,
    );
  }
}

abstract class _GetSearchServicesResponse implements GetSearchServicesResponse {
  const factory _GetSearchServicesResponse(
      {final String? message,
      final List<Service>? services,
      final bool? success}) = _$GetSearchServicesResponseImpl;

  factory _GetSearchServicesResponse.fromJson(Map<String, dynamic> json) =
      _$GetSearchServicesResponseImpl.fromJson;

  @override
  String? get message;
  @override
  List<Service>? get services;
  @override
  bool? get success;

  /// Create a copy of GetSearchServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSearchServicesResponseImplCopyWith<_$GetSearchServicesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  bool? get isPro => throw _privateConstructorUsedError;
  bool? get isProPlus => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "_id") String? id,
      String? title,
      String? content,
      String? type,
      String? logo,
      bool? active,
      bool? isPro,
      bool? isProPlus});
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
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? type = freezed,
    Object? logo = freezed,
    Object? active = freezed,
    Object? isPro = freezed,
    Object? isProPlus = freezed,
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
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPro: freezed == isPro
          ? _value.isPro
          : isPro // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProPlus: freezed == isProPlus
          ? _value.isProPlus
          : isProPlus // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      {@JsonKey(name: "_id") String? id,
      String? title,
      String? content,
      String? type,
      String? logo,
      bool? active,
      bool? isPro,
      bool? isProPlus});
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
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? type = freezed,
    Object? logo = freezed,
    Object? active = freezed,
    Object? isPro = freezed,
    Object? isProPlus = freezed,
  }) {
    return _then(_$ServiceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPro: freezed == isPro
          ? _value.isPro
          : isPro // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProPlus: freezed == isProPlus
          ? _value.isProPlus
          : isProPlus // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceImpl implements _Service {
  const _$ServiceImpl(
      {@JsonKey(name: "_id") this.id,
      this.title,
      this.content,
      this.type,
      this.logo,
      this.active,
      this.isPro,
      this.isProPlus});

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? type;
  @override
  final String? logo;
  @override
  final bool? active;
  @override
  final bool? isPro;
  @override
  final bool? isProPlus;

  @override
  String toString() {
    return 'Service(id: $id, title: $title, content: $content, type: $type, logo: $logo, active: $active, isPro: $isPro, isProPlus: $isProPlus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isPro, isPro) || other.isPro == isPro) &&
            (identical(other.isProPlus, isProPlus) ||
                other.isProPlus == isProPlus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, type, logo, active, isPro, isProPlus);

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
      {@JsonKey(name: "_id") final String? id,
      final String? title,
      final String? content,
      final String? type,
      final String? logo,
      final bool? active,
      final bool? isPro,
      final bool? isProPlus}) = _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get title;
  @override
  String? get content;
  @override
  String? get type;
  @override
  String? get logo;
  @override
  bool? get active;
  @override
  bool? get isPro;
  @override
  bool? get isProPlus;

  /// Create a copy of Service
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetSearchServicesRequest _$GetSearchServicesRequestFromJson(
    Map<String, dynamic> json) {
  return _GetSearchServicesRequest.fromJson(json);
}

/// @nodoc
mixin _$GetSearchServicesRequest {
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this GetSearchServicesRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetSearchServicesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetSearchServicesRequestCopyWith<GetSearchServicesRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSearchServicesRequestCopyWith<$Res> {
  factory $GetSearchServicesRequestCopyWith(GetSearchServicesRequest value,
          $Res Function(GetSearchServicesRequest) then) =
      _$GetSearchServicesRequestCopyWithImpl<$Res, GetSearchServicesRequest>;
  @useResult
  $Res call({String? title});
}

/// @nodoc
class _$GetSearchServicesRequestCopyWithImpl<$Res,
        $Val extends GetSearchServicesRequest>
    implements $GetSearchServicesRequestCopyWith<$Res> {
  _$GetSearchServicesRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetSearchServicesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetSearchServicesRequestImplCopyWith<$Res>
    implements $GetSearchServicesRequestCopyWith<$Res> {
  factory _$$GetSearchServicesRequestImplCopyWith(
          _$GetSearchServicesRequestImpl value,
          $Res Function(_$GetSearchServicesRequestImpl) then) =
      __$$GetSearchServicesRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title});
}

/// @nodoc
class __$$GetSearchServicesRequestImplCopyWithImpl<$Res>
    extends _$GetSearchServicesRequestCopyWithImpl<$Res,
        _$GetSearchServicesRequestImpl>
    implements _$$GetSearchServicesRequestImplCopyWith<$Res> {
  __$$GetSearchServicesRequestImplCopyWithImpl(
      _$GetSearchServicesRequestImpl _value,
      $Res Function(_$GetSearchServicesRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetSearchServicesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(_$GetSearchServicesRequestImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetSearchServicesRequestImpl implements _GetSearchServicesRequest {
  const _$GetSearchServicesRequestImpl({this.title});

  factory _$GetSearchServicesRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetSearchServicesRequestImplFromJson(json);

  @override
  final String? title;

  @override
  String toString() {
    return 'GetSearchServicesRequest(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchServicesRequestImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of GetSearchServicesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSearchServicesRequestImplCopyWith<_$GetSearchServicesRequestImpl>
      get copyWith => __$$GetSearchServicesRequestImplCopyWithImpl<
          _$GetSearchServicesRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSearchServicesRequestImplToJson(
      this,
    );
  }
}

abstract class _GetSearchServicesRequest implements GetSearchServicesRequest {
  const factory _GetSearchServicesRequest({final String? title}) =
      _$GetSearchServicesRequestImpl;

  factory _GetSearchServicesRequest.fromJson(Map<String, dynamic> json) =
      _$GetSearchServicesRequestImpl.fromJson;

  @override
  String? get title;

  /// Create a copy of GetSearchServicesRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSearchServicesRequestImplCopyWith<_$GetSearchServicesRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
