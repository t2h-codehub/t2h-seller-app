// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_custom_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddCustomServiceRequest _$AddCustomServiceRequestFromJson(
    Map<String, dynamic> json) {
  return _AddCustomServiceRequest.fromJson(json);
}

/// @nodoc
mixin _$AddCustomServiceRequest {
  String? get title => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;

  /// Serializes this AddCustomServiceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddCustomServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddCustomServiceRequestCopyWith<AddCustomServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCustomServiceRequestCopyWith<$Res> {
  factory $AddCustomServiceRequestCopyWith(AddCustomServiceRequest value,
          $Res Function(AddCustomServiceRequest) then) =
      _$AddCustomServiceRequestCopyWithImpl<$Res, AddCustomServiceRequest>;
  @useResult
  $Res call({String? title, String? logo, String? link});
}

/// @nodoc
class _$AddCustomServiceRequestCopyWithImpl<$Res,
        $Val extends AddCustomServiceRequest>
    implements $AddCustomServiceRequestCopyWith<$Res> {
  _$AddCustomServiceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddCustomServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? logo = freezed,
    Object? link = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCustomServiceRequestImplCopyWith<$Res>
    implements $AddCustomServiceRequestCopyWith<$Res> {
  factory _$$AddCustomServiceRequestImplCopyWith(
          _$AddCustomServiceRequestImpl value,
          $Res Function(_$AddCustomServiceRequestImpl) then) =
      __$$AddCustomServiceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? logo, String? link});
}

/// @nodoc
class __$$AddCustomServiceRequestImplCopyWithImpl<$Res>
    extends _$AddCustomServiceRequestCopyWithImpl<$Res,
        _$AddCustomServiceRequestImpl>
    implements _$$AddCustomServiceRequestImplCopyWith<$Res> {
  __$$AddCustomServiceRequestImplCopyWithImpl(
      _$AddCustomServiceRequestImpl _value,
      $Res Function(_$AddCustomServiceRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddCustomServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? logo = freezed,
    Object? link = freezed,
  }) {
    return _then(_$AddCustomServiceRequestImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddCustomServiceRequestImpl implements _AddCustomServiceRequest {
  const _$AddCustomServiceRequestImpl({this.title, this.logo, this.link});

  factory _$AddCustomServiceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddCustomServiceRequestImplFromJson(json);

  @override
  final String? title;
  @override
  final String? logo;
  @override
  final String? link;

  @override
  String toString() {
    return 'AddCustomServiceRequest(title: $title, logo: $logo, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCustomServiceRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, logo, link);

  /// Create a copy of AddCustomServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCustomServiceRequestImplCopyWith<_$AddCustomServiceRequestImpl>
      get copyWith => __$$AddCustomServiceRequestImplCopyWithImpl<
          _$AddCustomServiceRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddCustomServiceRequestImplToJson(
      this,
    );
  }
}

abstract class _AddCustomServiceRequest implements AddCustomServiceRequest {
  const factory _AddCustomServiceRequest(
      {final String? title,
      final String? logo,
      final String? link}) = _$AddCustomServiceRequestImpl;

  factory _AddCustomServiceRequest.fromJson(Map<String, dynamic> json) =
      _$AddCustomServiceRequestImpl.fromJson;

  @override
  String? get title;
  @override
  String? get logo;
  @override
  String? get link;

  /// Create a copy of AddCustomServiceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCustomServiceRequestImplCopyWith<_$AddCustomServiceRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
