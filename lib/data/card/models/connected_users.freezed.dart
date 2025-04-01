// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connected_users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConnectedUserResponse _$ConnectedUserResponseFromJson(
    Map<String, dynamic> json) {
  return _ConnectedUserResponse.fromJson(json);
}

/// @nodoc
mixin _$ConnectedUserResponse {
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  List<Contact>? get contacts => throw _privateConstructorUsedError;

  /// Serializes this ConnectedUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConnectedUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectedUserResponseCopyWith<ConnectedUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectedUserResponseCopyWith<$Res> {
  factory $ConnectedUserResponseCopyWith(ConnectedUserResponse value,
          $Res Function(ConnectedUserResponse) then) =
      _$ConnectedUserResponseCopyWithImpl<$Res, ConnectedUserResponse>;
  @useResult
  $Res call({String? message, bool? success, List<Contact>? contacts});
}

/// @nodoc
class _$ConnectedUserResponseCopyWithImpl<$Res,
        $Val extends ConnectedUserResponse>
    implements $ConnectedUserResponseCopyWith<$Res> {
  _$ConnectedUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectedUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? contacts = freezed,
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
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectedUserResponseImplCopyWith<$Res>
    implements $ConnectedUserResponseCopyWith<$Res> {
  factory _$$ConnectedUserResponseImplCopyWith(
          _$ConnectedUserResponseImpl value,
          $Res Function(_$ConnectedUserResponseImpl) then) =
      __$$ConnectedUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool? success, List<Contact>? contacts});
}

/// @nodoc
class __$$ConnectedUserResponseImplCopyWithImpl<$Res>
    extends _$ConnectedUserResponseCopyWithImpl<$Res,
        _$ConnectedUserResponseImpl>
    implements _$$ConnectedUserResponseImplCopyWith<$Res> {
  __$$ConnectedUserResponseImplCopyWithImpl(_$ConnectedUserResponseImpl _value,
      $Res Function(_$ConnectedUserResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectedUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_$ConnectedUserResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      contacts: freezed == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConnectedUserResponseImpl implements _ConnectedUserResponse {
  const _$ConnectedUserResponseImpl(
      {this.message, this.success, final List<Contact>? contacts})
      : _contacts = contacts;

  factory _$ConnectedUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConnectedUserResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? success;
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
  String toString() {
    return 'ConnectedUserResponse(message: $message, success: $success, contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedUserResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, success,
      const DeepCollectionEquality().hash(_contacts));

  /// Create a copy of ConnectedUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectedUserResponseImplCopyWith<_$ConnectedUserResponseImpl>
      get copyWith => __$$ConnectedUserResponseImplCopyWithImpl<
          _$ConnectedUserResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectedUserResponseImplToJson(
      this,
    );
  }
}

abstract class _ConnectedUserResponse implements ConnectedUserResponse {
  const factory _ConnectedUserResponse(
      {final String? message,
      final bool? success,
      final List<Contact>? contacts}) = _$ConnectedUserResponseImpl;

  factory _ConnectedUserResponse.fromJson(Map<String, dynamic> json) =
      _$ConnectedUserResponseImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get success;
  @override
  List<Contact>? get contacts;

  /// Create a copy of ConnectedUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectedUserResponseImplCopyWith<_$ConnectedUserResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get profileImg => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  List<Service>? get services => throw _privateConstructorUsedError;
  List<CustomService>? get customServices => throw _privateConstructorUsedError;
  int? get contacts => throw _privateConstructorUsedError;
  bool? get favorite => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "_id") String? id,
      String? name,
      String? email,
      String? phone,
      String? designation,
      String? profileImg,
      String? companyName,
      Color? color,
      String? bio,
      List<Service>? services,
      List<CustomService>? customServices,
      int? contacts,
      bool? favorite});

  $ColorCopyWith<$Res>? get color;
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
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? designation = freezed,
    Object? profileImg = freezed,
    Object? companyName = freezed,
    Object? color = freezed,
    Object? bio = freezed,
    Object? services = freezed,
    Object? customServices = freezed,
    Object? contacts = freezed,
    Object? favorite = freezed,
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
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as int?,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of Contact
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
abstract class _$$ContactImplCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$ContactImplCopyWith(
          _$ContactImpl value, $Res Function(_$ContactImpl) then) =
      __$$ContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? name,
      String? email,
      String? phone,
      String? designation,
      String? profileImg,
      String? companyName,
      Color? color,
      String? bio,
      List<Service>? services,
      List<CustomService>? customServices,
      int? contacts,
      bool? favorite});

  @override
  $ColorCopyWith<$Res>? get color;
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
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? designation = freezed,
    Object? profileImg = freezed,
    Object? companyName = freezed,
    Object? color = freezed,
    Object? bio = freezed,
    Object? services = freezed,
    Object? customServices = freezed,
    Object? contacts = freezed,
    Object? favorite = freezed,
  }) {
    return _then(_$ContactImpl(
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
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      customServices: freezed == customServices
          ? _value._customServices
          : customServices // ignore: cast_nullable_to_non_nullable
              as List<CustomService>?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as int?,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactImpl implements _Contact {
  const _$ContactImpl(
      {@JsonKey(name: "_id") this.id,
      this.name,
      this.email,
      this.phone,
      this.designation,
      this.profileImg,
      this.companyName,
      this.color,
      this.bio,
      final List<Service>? services,
      final List<CustomService>? customServices,
      this.contacts,
      this.favorite})
      : _services = services,
        _customServices = customServices;

  factory _$ContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);

  @override
  @JsonKey(name: "_id")
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
  final String? profileImg;
  @override
  final String? companyName;
  @override
  final Color? color;
  @override
  final String? bio;
  final List<Service>? _services;
  @override
  List<Service>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CustomService>? _customServices;
  @override
  List<CustomService>? get customServices {
    final value = _customServices;
    if (value == null) return null;
    if (_customServices is EqualUnmodifiableListView) return _customServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? contacts;
  @override
  final bool? favorite;

  @override
  String toString() {
    return 'Contact(id: $id, name: $name, email: $email, phone: $phone, designation: $designation, profileImg: $profileImg, companyName: $companyName, color: $color, bio: $bio, services: $services, customServices: $customServices, contacts: $contacts, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.profileImg, profileImg) ||
                other.profileImg == profileImg) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._customServices, _customServices) &&
            (identical(other.contacts, contacts) ||
                other.contacts == contacts) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      phone,
      designation,
      profileImg,
      companyName,
      color,
      bio,
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_customServices),
      contacts,
      favorite);

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
      {@JsonKey(name: "_id") final String? id,
      final String? name,
      final String? email,
      final String? phone,
      final String? designation,
      final String? profileImg,
      final String? companyName,
      final Color? color,
      final String? bio,
      final List<Service>? services,
      final List<CustomService>? customServices,
      final int? contacts,
      final bool? favorite}) = _$ContactImpl;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$ContactImpl.fromJson;

  @override
  @JsonKey(name: "_id")
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
  String? get profileImg;
  @override
  String? get companyName;
  @override
  Color? get color;
  @override
  String? get bio;
  @override
  List<Service>? get services;
  @override
  List<CustomService>? get customServices;
  @override
  int? get contacts;
  @override
  bool? get favorite;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
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
