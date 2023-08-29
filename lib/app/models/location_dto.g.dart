// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationDto _$$_LocationDtoFromJson(Map<String, dynamic> json) =>
    _$_LocationDto(
      name: json['name'] as String?,
      address: json['address'] as String?,
      geohash: json['geohash'] as String?,
      distanceInKm: json['distance_in_km'] as num?,
      geopoint: json['geopoint'] == null
          ? null
          : LatLngDto.fromJson(json['geopoint'] as Map<String, dynamic>),
      maxDistance: (json['max_distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_LocationDtoToJson(_$_LocationDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'geohash': instance.geohash,
      'distance_in_km': instance.distanceInKm,
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
