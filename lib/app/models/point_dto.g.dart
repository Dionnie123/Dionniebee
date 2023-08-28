// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PointDto _$$_PointDtoFromJson(Map<String, dynamic> json) => _$_PointDto(
      geohash: json['geohash'] as String?,
      geopoint: json['geopoint'] == null
          ? null
          : LatLngDto.fromJson(json['geopoint'] as Map<String, dynamic>),
      maxDistance: (json['max_distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PointDtoToJson(_$_PointDto instance) =>
    <String, dynamic>{
      'geohash': instance.geohash,
      'geopoint': instance.geopoint,
      'max_distance': instance.maxDistance,
    };

_$_LatLngDto _$$_LatLngDtoFromJson(Map<String, dynamic> json) => _$_LatLngDto(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_LatLngDtoToJson(_$_LatLngDto instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
