// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PointDto _$$_PointDtoFromJson(Map<String, dynamic> json) => _$_PointDto(
      refLatitude: (json['ref_latitude'] as num?)?.toDouble(),
      refLongitude: (json['ref_longitude'] as num?)?.toDouble(),
      maxDistance: (json['max_distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PointDtoToJson(_$_PointDto instance) =>
    <String, dynamic>{
      'ref_latitude': instance.refLatitude,
      'ref_longitude': instance.refLongitude,
      'max_distance': instance.maxDistance,
    };
