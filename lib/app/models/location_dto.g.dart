// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationDtoImpl _$$LocationDtoImplFromJson(Map<String, dynamic> json) =>
    _$LocationDtoImpl(
      name: json['name'] as String?,
      address: json['address'] as String?,
      geohash: json['geohash'] as String?,
      distanceInKm: json['distance_in_km'] as num?,
      geopoint: json['geopoint'] == null
          ? null
          : LatLngDto.fromJson(json['geopoint'] as Map<String, dynamic>),
      maxDistance: (json['max_distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LocationDtoImplToJson(_$LocationDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'geohash': instance.geohash,
      'distance_in_km': instance.distanceInKm,
      'geopoint': instance.geopoint,
      'max_distance': instance.maxDistance,
    };

_$LatLngDtoImpl _$$LatLngDtoImplFromJson(Map<String, dynamic> json) =>
    _$LatLngDtoImpl(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LatLngDtoImplToJson(_$LatLngDtoImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
