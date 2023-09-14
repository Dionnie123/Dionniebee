import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

@freezed
class LocationDto with _$LocationDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory LocationDto({
    String? name,
    String? address,
    String? geohash,
    num? distanceInKm,
    LatLngDto? geopoint,
    double? maxDistance,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}

@freezed
class LatLngDto with _$LatLngDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory LatLngDto({
    double? latitude,
    double? longitude,
  }) = _LatLngDto;

  factory LatLngDto.fromJson(Map<String, dynamic> json) =>
      _$LatLngDtoFromJson(json);
}
