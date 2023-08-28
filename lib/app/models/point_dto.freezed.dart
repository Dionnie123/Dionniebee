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
  String? get geohash => throw _privateConstructorUsedError;
  LatLngDto? get geopoint => throw _privateConstructorUsedError;
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
  $Res call({String? geohash, LatLngDto? geopoint, double? maxDistance});

  $LatLngDtoCopyWith<$Res>? get geopoint;
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
    Object? geohash = freezed,
    Object? geopoint = freezed,
    Object? maxDistance = freezed,
  }) {
    return _then(_value.copyWith(
      geohash: freezed == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String?,
      geopoint: freezed == geopoint
          ? _value.geopoint
          : geopoint // ignore: cast_nullable_to_non_nullable
              as LatLngDto?,
      maxDistance: freezed == maxDistance
          ? _value.maxDistance
          : maxDistance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LatLngDtoCopyWith<$Res>? get geopoint {
    if (_value.geopoint == null) {
      return null;
    }

    return $LatLngDtoCopyWith<$Res>(_value.geopoint!, (value) {
      return _then(_value.copyWith(geopoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PointDtoCopyWith<$Res> implements $PointDtoCopyWith<$Res> {
  factory _$$_PointDtoCopyWith(
          _$_PointDto value, $Res Function(_$_PointDto) then) =
      __$$_PointDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? geohash, LatLngDto? geopoint, double? maxDistance});

  @override
  $LatLngDtoCopyWith<$Res>? get geopoint;
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
    Object? geohash = freezed,
    Object? geopoint = freezed,
    Object? maxDistance = freezed,
  }) {
    return _then(_$_PointDto(
      geohash: freezed == geohash
          ? _value.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String?,
      geopoint: freezed == geopoint
          ? _value.geopoint
          : geopoint // ignore: cast_nullable_to_non_nullable
              as LatLngDto?,
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
  _$_PointDto({this.geohash, this.geopoint, this.maxDistance});

  factory _$_PointDto.fromJson(Map<String, dynamic> json) =>
      _$$_PointDtoFromJson(json);

  @override
  final String? geohash;
  @override
  final LatLngDto? geopoint;
  @override
  final double? maxDistance;

  @override
  String toString() {
    return 'PointDto(geohash: $geohash, geopoint: $geopoint, maxDistance: $maxDistance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointDto &&
            (identical(other.geohash, geohash) || other.geohash == geohash) &&
            (identical(other.geopoint, geopoint) ||
                other.geopoint == geopoint) &&
            (identical(other.maxDistance, maxDistance) ||
                other.maxDistance == maxDistance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, geohash, geopoint, maxDistance);

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
      {final String? geohash,
      final LatLngDto? geopoint,
      final double? maxDistance}) = _$_PointDto;

  factory _PointDto.fromJson(Map<String, dynamic> json) = _$_PointDto.fromJson;

  @override
  String? get geohash;
  @override
  LatLngDto? get geopoint;
  @override
  double? get maxDistance;
  @override
  @JsonKey(ignore: true)
  _$$_PointDtoCopyWith<_$_PointDto> get copyWith =>
      throw _privateConstructorUsedError;
}

LatLngDto _$LatLngDtoFromJson(Map<String, dynamic> json) {
  return _LatLngDto.fromJson(json);
}

/// @nodoc
mixin _$LatLngDto {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatLngDtoCopyWith<LatLngDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLngDtoCopyWith<$Res> {
  factory $LatLngDtoCopyWith(LatLngDto value, $Res Function(LatLngDto) then) =
      _$LatLngDtoCopyWithImpl<$Res, LatLngDto>;
  @useResult
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class _$LatLngDtoCopyWithImpl<$Res, $Val extends LatLngDto>
    implements $LatLngDtoCopyWith<$Res> {
  _$LatLngDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LatLngDtoCopyWith<$Res> implements $LatLngDtoCopyWith<$Res> {
  factory _$$_LatLngDtoCopyWith(
          _$_LatLngDto value, $Res Function(_$_LatLngDto) then) =
      __$$_LatLngDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class __$$_LatLngDtoCopyWithImpl<$Res>
    extends _$LatLngDtoCopyWithImpl<$Res, _$_LatLngDto>
    implements _$$_LatLngDtoCopyWith<$Res> {
  __$$_LatLngDtoCopyWithImpl(
      _$_LatLngDto _value, $Res Function(_$_LatLngDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_LatLngDto(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_LatLngDto implements _LatLngDto {
  _$_LatLngDto({this.latitude, this.longitude});

  factory _$_LatLngDto.fromJson(Map<String, dynamic> json) =>
      _$$_LatLngDtoFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'LatLngDto(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LatLngDto &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LatLngDtoCopyWith<_$_LatLngDto> get copyWith =>
      __$$_LatLngDtoCopyWithImpl<_$_LatLngDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LatLngDtoToJson(
      this,
    );
  }
}

abstract class _LatLngDto implements LatLngDto {
  factory _LatLngDto({final double? latitude, final double? longitude}) =
      _$_LatLngDto;

  factory _LatLngDto.fromJson(Map<String, dynamic> json) =
      _$_LatLngDto.fromJson;

  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_LatLngDtoCopyWith<_$_LatLngDto> get copyWith =>
      throw _privateConstructorUsedError;
}
