// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_theme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddThemeRequest _$AddThemeRequestFromJson(Map<String, dynamic> json) {
  return _AddThemeRequest.fromJson(json);
}

/// @nodoc
mixin _$AddThemeRequest {
  @JsonKey(name: "color1")
  String? get color1 => throw _privateConstructorUsedError;
  @JsonKey(name: "color2")
  String? get color2 => throw _privateConstructorUsedError;
  @JsonKey(name: "logo")
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this AddThemeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddThemeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddThemeRequestCopyWith<AddThemeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddThemeRequestCopyWith<$Res> {
  factory $AddThemeRequestCopyWith(
          AddThemeRequest value, $Res Function(AddThemeRequest) then) =
      _$AddThemeRequestCopyWithImpl<$Res, AddThemeRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "color1") String? color1,
      @JsonKey(name: "color2") String? color2,
      @JsonKey(name: "logo") String? image});
}

/// @nodoc
class _$AddThemeRequestCopyWithImpl<$Res, $Val extends AddThemeRequest>
    implements $AddThemeRequestCopyWith<$Res> {
  _$AddThemeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddThemeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color1 = freezed,
    Object? color2 = freezed,
    Object? image = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddThemeRequestImplCopyWith<$Res>
    implements $AddThemeRequestCopyWith<$Res> {
  factory _$$AddThemeRequestImplCopyWith(_$AddThemeRequestImpl value,
          $Res Function(_$AddThemeRequestImpl) then) =
      __$$AddThemeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "color1") String? color1,
      @JsonKey(name: "color2") String? color2,
      @JsonKey(name: "logo") String? image});
}

/// @nodoc
class __$$AddThemeRequestImplCopyWithImpl<$Res>
    extends _$AddThemeRequestCopyWithImpl<$Res, _$AddThemeRequestImpl>
    implements _$$AddThemeRequestImplCopyWith<$Res> {
  __$$AddThemeRequestImplCopyWithImpl(
      _$AddThemeRequestImpl _value, $Res Function(_$AddThemeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddThemeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color1 = freezed,
    Object? color2 = freezed,
    Object? image = freezed,
  }) {
    return _then(_$AddThemeRequestImpl(
      color1: freezed == color1
          ? _value.color1
          : color1 // ignore: cast_nullable_to_non_nullable
              as String?,
      color2: freezed == color2
          ? _value.color2
          : color2 // ignore: cast_nullable_to_non_nullable
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
class _$AddThemeRequestImpl implements _AddThemeRequest {
  const _$AddThemeRequestImpl(
      {@JsonKey(name: "color1") this.color1,
      @JsonKey(name: "color2") this.color2,
      @JsonKey(name: "logo") this.image});

  factory _$AddThemeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddThemeRequestImplFromJson(json);

  @override
  @JsonKey(name: "color1")
  final String? color1;
  @override
  @JsonKey(name: "color2")
  final String? color2;
  @override
  @JsonKey(name: "logo")
  final String? image;

  @override
  String toString() {
    return 'AddThemeRequest(color1: $color1, color2: $color2, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddThemeRequestImpl &&
            (identical(other.color1, color1) || other.color1 == color1) &&
            (identical(other.color2, color2) || other.color2 == color2) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, color1, color2, image);

  /// Create a copy of AddThemeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddThemeRequestImplCopyWith<_$AddThemeRequestImpl> get copyWith =>
      __$$AddThemeRequestImplCopyWithImpl<_$AddThemeRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddThemeRequestImplToJson(
      this,
    );
  }
}

abstract class _AddThemeRequest implements AddThemeRequest {
  const factory _AddThemeRequest(
      {@JsonKey(name: "color1") final String? color1,
      @JsonKey(name: "color2") final String? color2,
      @JsonKey(name: "logo") final String? image}) = _$AddThemeRequestImpl;

  factory _AddThemeRequest.fromJson(Map<String, dynamic> json) =
      _$AddThemeRequestImpl.fromJson;

  @override
  @JsonKey(name: "color1")
  String? get color1;
  @override
  @JsonKey(name: "color2")
  String? get color2;
  @override
  @JsonKey(name: "logo")
  String? get image;

  /// Create a copy of AddThemeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddThemeRequestImplCopyWith<_$AddThemeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
