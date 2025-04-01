// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_plans.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetPlanResponse _$GetPlanResponseFromJson(Map<String, dynamic> json) {
  return _GetPlanResponse.fromJson(json);
}

/// @nodoc
mixin _$GetPlanResponse {
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "success")
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: "plans")
  List<Plan>? get plans => throw _privateConstructorUsedError;

  /// Serializes this GetPlanResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetPlanResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetPlanResponseCopyWith<GetPlanResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPlanResponseCopyWith<$Res> {
  factory $GetPlanResponseCopyWith(
          GetPlanResponse value, $Res Function(GetPlanResponse) then) =
      _$GetPlanResponseCopyWithImpl<$Res, GetPlanResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "message") String? message,
      @JsonKey(name: "success") bool? success,
      @JsonKey(name: "plans") List<Plan>? plans});
}

/// @nodoc
class _$GetPlanResponseCopyWithImpl<$Res, $Val extends GetPlanResponse>
    implements $GetPlanResponseCopyWith<$Res> {
  _$GetPlanResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetPlanResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? plans = freezed,
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
      plans: freezed == plans
          ? _value.plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<Plan>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetPlanResponseImplCopyWith<$Res>
    implements $GetPlanResponseCopyWith<$Res> {
  factory _$$GetPlanResponseImplCopyWith(_$GetPlanResponseImpl value,
          $Res Function(_$GetPlanResponseImpl) then) =
      __$$GetPlanResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "message") String? message,
      @JsonKey(name: "success") bool? success,
      @JsonKey(name: "plans") List<Plan>? plans});
}

/// @nodoc
class __$$GetPlanResponseImplCopyWithImpl<$Res>
    extends _$GetPlanResponseCopyWithImpl<$Res, _$GetPlanResponseImpl>
    implements _$$GetPlanResponseImplCopyWith<$Res> {
  __$$GetPlanResponseImplCopyWithImpl(
      _$GetPlanResponseImpl _value, $Res Function(_$GetPlanResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetPlanResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? plans = freezed,
  }) {
    return _then(_$GetPlanResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      plans: freezed == plans
          ? _value._plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<Plan>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetPlanResponseImpl implements _GetPlanResponse {
  const _$GetPlanResponseImpl(
      {@JsonKey(name: "message") this.message,
      @JsonKey(name: "success") this.success,
      @JsonKey(name: "plans") final List<Plan>? plans})
      : _plans = plans;

  factory _$GetPlanResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetPlanResponseImplFromJson(json);

  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "success")
  final bool? success;
  final List<Plan>? _plans;
  @override
  @JsonKey(name: "plans")
  List<Plan>? get plans {
    final value = _plans;
    if (value == null) return null;
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetPlanResponse(message: $message, success: $success, plans: $plans)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPlanResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._plans, _plans));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, success,
      const DeepCollectionEquality().hash(_plans));

  /// Create a copy of GetPlanResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPlanResponseImplCopyWith<_$GetPlanResponseImpl> get copyWith =>
      __$$GetPlanResponseImplCopyWithImpl<_$GetPlanResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPlanResponseImplToJson(
      this,
    );
  }
}

abstract class _GetPlanResponse implements GetPlanResponse {
  const factory _GetPlanResponse(
      {@JsonKey(name: "message") final String? message,
      @JsonKey(name: "success") final bool? success,
      @JsonKey(name: "plans") final List<Plan>? plans}) = _$GetPlanResponseImpl;

  factory _GetPlanResponse.fromJson(Map<String, dynamic> json) =
      _$GetPlanResponseImpl.fromJson;

  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "success")
  bool? get success;
  @override
  @JsonKey(name: "plans")
  List<Plan>? get plans;

  /// Create a copy of GetPlanResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetPlanResponseImplCopyWith<_$GetPlanResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return _Plan.fromJson(json);
}

/// @nodoc
mixin _$Plan {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "mrp")
  int? get mrp => throw _privateConstructorUsedError;
  @JsonKey(name: "duration")
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: "shortBenefits")
  List<Benefit>? get shortBenefits => throw _privateConstructorUsedError;
  @JsonKey(name: "benefits")
  List<Benefit>? get benefits => throw _privateConstructorUsedError;
  @JsonKey(name: "active")
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int? get v => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "features")
  List<String>? get features => throw _privateConstructorUsedError;
  @JsonKey(name: "monthlyPrice")
  int? get monthlyPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "yearlyPrice")
  int? get yearlyPrice => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "mrp") int? mrp,
      @JsonKey(name: "duration") String? duration,
      @JsonKey(name: "shortBenefits") List<Benefit>? shortBenefits,
      @JsonKey(name: "benefits") List<Benefit>? benefits,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "__v") int? v,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "features") List<String>? features,
      @JsonKey(name: "monthlyPrice") int? monthlyPrice,
      @JsonKey(name: "yearlyPrice") int? yearlyPrice});
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
    Object? id = freezed,
    Object? title = freezed,
    Object? mrp = freezed,
    Object? duration = freezed,
    Object? shortBenefits = freezed,
    Object? benefits = freezed,
    Object? active = freezed,
    Object? v = freezed,
    Object? updatedAt = freezed,
    Object? features = freezed,
    Object? monthlyPrice = freezed,
    Object? yearlyPrice = freezed,
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
      mrp: freezed == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      shortBenefits: freezed == shortBenefits
          ? _value.shortBenefits
          : shortBenefits // ignore: cast_nullable_to_non_nullable
              as List<Benefit>?,
      benefits: freezed == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<Benefit>?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      monthlyPrice: freezed == monthlyPrice
          ? _value.monthlyPrice
          : monthlyPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      yearlyPrice: freezed == yearlyPrice
          ? _value.yearlyPrice
          : yearlyPrice // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "mrp") int? mrp,
      @JsonKey(name: "duration") String? duration,
      @JsonKey(name: "shortBenefits") List<Benefit>? shortBenefits,
      @JsonKey(name: "benefits") List<Benefit>? benefits,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "__v") int? v,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "features") List<String>? features,
      @JsonKey(name: "monthlyPrice") int? monthlyPrice,
      @JsonKey(name: "yearlyPrice") int? yearlyPrice});
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
    Object? id = freezed,
    Object? title = freezed,
    Object? mrp = freezed,
    Object? duration = freezed,
    Object? shortBenefits = freezed,
    Object? benefits = freezed,
    Object? active = freezed,
    Object? v = freezed,
    Object? updatedAt = freezed,
    Object? features = freezed,
    Object? monthlyPrice = freezed,
    Object? yearlyPrice = freezed,
  }) {
    return _then(_$PlanImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      mrp: freezed == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      shortBenefits: freezed == shortBenefits
          ? _value._shortBenefits
          : shortBenefits // ignore: cast_nullable_to_non_nullable
              as List<Benefit>?,
      benefits: freezed == benefits
          ? _value._benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<Benefit>?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      monthlyPrice: freezed == monthlyPrice
          ? _value.monthlyPrice
          : monthlyPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      yearlyPrice: freezed == yearlyPrice
          ? _value.yearlyPrice
          : yearlyPrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanImpl implements _Plan {
  const _$PlanImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "mrp") this.mrp,
      @JsonKey(name: "duration") this.duration,
      @JsonKey(name: "shortBenefits") final List<Benefit>? shortBenefits,
      @JsonKey(name: "benefits") final List<Benefit>? benefits,
      @JsonKey(name: "active") this.active,
      @JsonKey(name: "__v") this.v,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "features") final List<String>? features,
      @JsonKey(name: "monthlyPrice") this.monthlyPrice,
      @JsonKey(name: "yearlyPrice") this.yearlyPrice})
      : _shortBenefits = shortBenefits,
        _benefits = benefits,
        _features = features;

  factory _$PlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "mrp")
  final int? mrp;
  @override
  @JsonKey(name: "duration")
  final String? duration;
  final List<Benefit>? _shortBenefits;
  @override
  @JsonKey(name: "shortBenefits")
  List<Benefit>? get shortBenefits {
    final value = _shortBenefits;
    if (value == null) return null;
    if (_shortBenefits is EqualUnmodifiableListView) return _shortBenefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Benefit>? _benefits;
  @override
  @JsonKey(name: "benefits")
  List<Benefit>? get benefits {
    final value = _benefits;
    if (value == null) return null;
    if (_benefits is EqualUnmodifiableListView) return _benefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "active")
  final bool? active;
  @override
  @JsonKey(name: "__v")
  final int? v;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
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
  @JsonKey(name: "monthlyPrice")
  final int? monthlyPrice;
  @override
  @JsonKey(name: "yearlyPrice")
  final int? yearlyPrice;

  @override
  String toString() {
    return 'Plan(id: $id, title: $title, mrp: $mrp, duration: $duration, shortBenefits: $shortBenefits, benefits: $benefits, active: $active, v: $v, updatedAt: $updatedAt, features: $features, monthlyPrice: $monthlyPrice, yearlyPrice: $yearlyPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality()
                .equals(other._shortBenefits, _shortBenefits) &&
            const DeepCollectionEquality().equals(other._benefits, _benefits) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.monthlyPrice, monthlyPrice) ||
                other.monthlyPrice == monthlyPrice) &&
            (identical(other.yearlyPrice, yearlyPrice) ||
                other.yearlyPrice == yearlyPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      mrp,
      duration,
      const DeepCollectionEquality().hash(_shortBenefits),
      const DeepCollectionEquality().hash(_benefits),
      active,
      v,
      updatedAt,
      const DeepCollectionEquality().hash(_features),
      monthlyPrice,
      yearlyPrice);

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
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "title") final String? title,
      @JsonKey(name: "mrp") final int? mrp,
      @JsonKey(name: "duration") final String? duration,
      @JsonKey(name: "shortBenefits") final List<Benefit>? shortBenefits,
      @JsonKey(name: "benefits") final List<Benefit>? benefits,
      @JsonKey(name: "active") final bool? active,
      @JsonKey(name: "__v") final int? v,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      @JsonKey(name: "features") final List<String>? features,
      @JsonKey(name: "monthlyPrice") final int? monthlyPrice,
      @JsonKey(name: "yearlyPrice") final int? yearlyPrice}) = _$PlanImpl;

  factory _Plan.fromJson(Map<String, dynamic> json) = _$PlanImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "mrp")
  int? get mrp;
  @override
  @JsonKey(name: "duration")
  String? get duration;
  @override
  @JsonKey(name: "shortBenefits")
  List<Benefit>? get shortBenefits;
  @override
  @JsonKey(name: "benefits")
  List<Benefit>? get benefits;
  @override
  @JsonKey(name: "active")
  bool? get active;
  @override
  @JsonKey(name: "__v")
  int? get v;
  @override
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "features")
  List<String>? get features;
  @override
  @JsonKey(name: "monthlyPrice")
  int? get monthlyPrice;
  @override
  @JsonKey(name: "yearlyPrice")
  int? get yearlyPrice;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanImplCopyWith<_$PlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Benefit _$BenefitFromJson(Map<String, dynamic> json) {
  return _Benefit.fromJson(json);
}

/// @nodoc
mixin _$Benefit {
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this Benefit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Benefit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BenefitCopyWith<Benefit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BenefitCopyWith<$Res> {
  factory $BenefitCopyWith(Benefit value, $Res Function(Benefit) then) =
      _$BenefitCopyWithImpl<$Res, Benefit>;
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class _$BenefitCopyWithImpl<$Res, $Val extends Benefit>
    implements $BenefitCopyWith<$Res> {
  _$BenefitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Benefit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BenefitImplCopyWith<$Res> implements $BenefitCopyWith<$Res> {
  factory _$$BenefitImplCopyWith(
          _$BenefitImpl value, $Res Function(_$BenefitImpl) then) =
      __$$BenefitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "_id") String? id});
}

/// @nodoc
class __$$BenefitImplCopyWithImpl<$Res>
    extends _$BenefitCopyWithImpl<$Res, _$BenefitImpl>
    implements _$$BenefitImplCopyWith<$Res> {
  __$$BenefitImplCopyWithImpl(
      _$BenefitImpl _value, $Res Function(_$BenefitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Benefit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? id = freezed,
  }) {
    return _then(_$BenefitImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
class _$BenefitImpl implements _Benefit {
  const _$BenefitImpl(
      {@JsonKey(name: "title") this.title,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "_id") this.id});

  factory _$BenefitImpl.fromJson(Map<String, dynamic> json) =>
      _$$BenefitImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "_id")
  final String? id;

  @override
  String toString() {
    return 'Benefit(title: $title, description: $description, image: $image, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BenefitImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, image, id);

  /// Create a copy of Benefit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BenefitImplCopyWith<_$BenefitImpl> get copyWith =>
      __$$BenefitImplCopyWithImpl<_$BenefitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BenefitImplToJson(
      this,
    );
  }
}

abstract class _Benefit implements Benefit {
  const factory _Benefit(
      {@JsonKey(name: "title") final String? title,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "image") final String? image,
      @JsonKey(name: "_id") final String? id}) = _$BenefitImpl;

  factory _Benefit.fromJson(Map<String, dynamic> json) = _$BenefitImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "image")
  String? get image;
  @override
  @JsonKey(name: "_id")
  String? get id;

  /// Create a copy of Benefit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BenefitImplCopyWith<_$BenefitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
