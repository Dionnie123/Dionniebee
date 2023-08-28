// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationDto _$$_LocationDtoFromJson(Map<String, dynamic> json) =>
    _$_LocationDto(
      name: json['name'] as String?,
      address: json['address'] as String?,
      distance: json['distance'] as num?,
      point: json['point'] == null
          ? null
          : PointDto.fromJson(json['point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LocationDtoToJson(_$_LocationDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'distance': instance.distance,
      'point': instance.point,
    };

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
