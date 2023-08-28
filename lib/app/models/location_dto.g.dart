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
