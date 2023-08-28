import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_dto.freezed.dart';
part 'point_dto.g.dart';

@freezed
class PointDto with _$PointDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory PointDto({
    String? geohash,
    LatLngDto? geopoint,
    double? maxDistance,
  }) = _PointDto;

  factory PointDto.fromJson(Map<String, dynamic> json) =>
      _$PointDtoFromJson(json);
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
