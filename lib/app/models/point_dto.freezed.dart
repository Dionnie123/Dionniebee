// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointDto _$PointDtoFromJson(Map<String, dynamic> json) {
  return _PointDto.fromJson(json);
}

/// @nodoc
mixin _$PointDto {
  double? get refLatitude => throw _privateConstructorUsedError;
  double? get refLongitude => throw _privateConstructorUsedError;
  double? get maxDistance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointDtoCopyWith<PointDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointDtoCopyWith<$Res> {
  factory $PointDtoCopyWith(PointDto value, $Res Function(PointDto) then) =
      _$PointDtoCopyWithImpl<$Res, PointDto>;
  @useResult
  $Res call({double? refLatitude, double? refLongitude, double? maxDistance});
}

/// @nodoc
class _$PointDtoCopyWithImpl<$Res, $Val extends PointDto>
    implements $PointDtoCopyWith<$Res> {
  _$PointDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refLatitude = freezed,
    Object? refLongitude = freezed,
    Object? maxDistance = freezed,
  }) {
    return _then(_value.copyWith(
      refLatitude: freezed == refLatitude
          ? _value.refLatitude
          : refLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      refLongitude: freezed == refLongitude
          ? _value.refLongitude
          : refLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDistance: freezed == maxDistance
          ? _value.maxDistance
          : maxDistance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PointDtoCopyWith<$Res> implements $PointDtoCopyWith<$Res> {
  factory _$$_PointDtoCopyWith(
          _$_PointDto value, $Res Function(_$_PointDto) then) =
      __$$_PointDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? refLatitude, double? refLongitude, double? maxDistance});
}

/// @nodoc
class __$$_PointDtoCopyWithImpl<$Res>
    extends _$PointDtoCopyWithImpl<$Res, _$_PointDto>
    implements _$$_PointDtoCopyWith<$Res> {
  __$$_PointDtoCopyWithImpl(
      _$_PointDto _value, $Res Function(_$_PointDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refLatitude = freezed,
    Object? refLongitude = freezed,
    Object? maxDistance = freezed,
  }) {
    return _then(_$_PointDto(
      refLatitude: freezed == refLatitude
          ? _value.refLatitude
          : refLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      refLongitude: freezed == refLongitude
          ? _value.refLongitude
          : refLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDistance: freezed == maxDistance
          ? _value.maxDistance
          : maxDistance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_PointDto implements _PointDto {
  _$_PointDto({this.refLatitude, this.refLongitude, this.maxDistance});

  factory _$_PointDto.fromJson(Map<String, dynamic> json) =>
      _$$_PointDtoFromJson(json);

  @override
  final double? refLatitude;
  @override
  final double? refLongitude;
  @override
  final double? maxDistance;

  @override
  String toString() {
    return 'PointDto(refLatitude: $refLatitude, refLongitude: $refLongitude, maxDistance: $maxDistance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointDto &&
            (identical(other.refLatitude, refLatitude) ||
                other.refLatitude == refLatitude) &&
            (identical(other.refLongitude, refLongitude) ||
                other.refLongitude == refLongitude) &&
            (identical(other.maxDistance, maxDistance) ||
                other.maxDistance == maxDistance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, refLatitude, refLongitude, maxDistance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointDtoCopyWith<_$_PointDto> get copyWith =>
      __$$_PointDtoCopyWithImpl<_$_PointDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointDtoToJson(
      this,
    );
  }
}

abstract class _PointDto implements PointDto {
  factory _PointDto(
      {final double? refLatitude,
      final double? refLongitude,
      final double? maxDistance}) = _$_PointDto;

  factory _PointDto.fromJson(Map<String, dynamic> json) = _$_PointDto.fromJson;

  @override
  double? get refLatitude;
  @override
  double? get refLongitude;
  @override
  double? get maxDistance;
  @override
  @JsonKey(ignore: true)
  _$$_PointDtoCopyWith<_$_PointDto> get copyWith =>
      throw _privateConstructorUsedError;
}
