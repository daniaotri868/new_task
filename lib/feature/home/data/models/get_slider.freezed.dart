// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_slider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SliderImageModel _$SliderImageModelFromJson(Map<String, dynamic> json) {
  return _SliderImageModel.fromJson(json);
}

/// @nodoc
mixin _$SliderImageModel {
  String? get image => throw _privateConstructorUsedError;
  int? get companyId => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SliderImageModelCopyWith<SliderImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderImageModelCopyWith<$Res> {
  factory $SliderImageModelCopyWith(
          SliderImageModel value, $Res Function(SliderImageModel) then) =
      _$SliderImageModelCopyWithImpl<$Res, SliderImageModel>;
  @useResult
  $Res call({String? image, int? companyId, int? countryId});
}

/// @nodoc
class _$SliderImageModelCopyWithImpl<$Res, $Val extends SliderImageModel>
    implements $SliderImageModelCopyWith<$Res> {
  _$SliderImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? companyId = freezed,
    Object? countryId = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SliderImageModelImplCopyWith<$Res>
    implements $SliderImageModelCopyWith<$Res> {
  factory _$$SliderImageModelImplCopyWith(_$SliderImageModelImpl value,
          $Res Function(_$SliderImageModelImpl) then) =
      __$$SliderImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? image, int? companyId, int? countryId});
}

/// @nodoc
class __$$SliderImageModelImplCopyWithImpl<$Res>
    extends _$SliderImageModelCopyWithImpl<$Res, _$SliderImageModelImpl>
    implements _$$SliderImageModelImplCopyWith<$Res> {
  __$$SliderImageModelImplCopyWithImpl(_$SliderImageModelImpl _value,
      $Res Function(_$SliderImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? companyId = freezed,
    Object? countryId = freezed,
  }) {
    return _then(_$SliderImageModelImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SliderImageModelImpl implements _SliderImageModel {
  _$SliderImageModelImpl({this.image, this.companyId, this.countryId});

  factory _$SliderImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SliderImageModelImplFromJson(json);

  @override
  final String? image;
  @override
  final int? companyId;
  @override
  final int? countryId;

  @override
  String toString() {
    return 'SliderImageModel(image: $image, companyId: $companyId, countryId: $countryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderImageModelImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image, companyId, countryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderImageModelImplCopyWith<_$SliderImageModelImpl> get copyWith =>
      __$$SliderImageModelImplCopyWithImpl<_$SliderImageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SliderImageModelImplToJson(
      this,
    );
  }
}

abstract class _SliderImageModel implements SliderImageModel {
  factory _SliderImageModel(
      {final String? image,
      final int? companyId,
      final int? countryId}) = _$SliderImageModelImpl;

  factory _SliderImageModel.fromJson(Map<String, dynamic> json) =
      _$SliderImageModelImpl.fromJson;

  @override
  String? get image;
  @override
  int? get companyId;
  @override
  int? get countryId;
  @override
  @JsonKey(ignore: true)
  _$$SliderImageModelImplCopyWith<_$SliderImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
