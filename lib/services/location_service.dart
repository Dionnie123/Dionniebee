// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dionniebee/app/models/location_dto.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

class LocationService {
  final Distance distance = const Distance();
  Location location = Location();
  GeoFlutterFire geo = GeoFlutterFire();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('locations');

  final StreamController<LatLng?> _locationController = BehaviorSubject();
  Stream<LatLng?> get getLocationStream => _locationController.stream;

  LocationService() {
    Location().requestPermission().then((granted) {
      if ((granted == PermissionStatus.granted) ||
          (granted == PermissionStatus.grantedLimited)) {
        location.onLocationChanged.listen((locationData) {
          if (locationData.latitude != null && locationData.longitude != null) {
            _locationController.add(LatLng(
              locationData.latitude ?? 0,
              locationData.longitude ?? 0,
            ));
          }
        });
      }
    });
  }

  Future<LatLng?> getLocation() async {
    try {
      LocationData locationData = await location.getLocation();
      return LatLng(
        locationData.latitude ?? 0.0,
        locationData.longitude ?? 0.0,
      );
    } on Exception catch (e) {
      debugPrint('Could not get location: ${e.toString()}');
    }
    return null;
  }

  Stream<int> epochUpdatesNumbers() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      yield DateTime.now().millisecondsSinceEpoch;
    }
  }

  Stream<List<LocationDto>> getNearbyPlacesStream(LocationDto? mapInfo) {
    if (mapInfo != null) {
      final center = geo.point(
          latitude: mapInfo.geopoint?.latitude ?? 0,
          longitude: mapInfo.geopoint?.longitude ?? 0);
      return geo
          .collection(collectionRef: collectionReference)
          .within(
            center: center,
            radius: mapInfo.maxDistance ?? 10,
            field: 'point',
          )
          .map((event) {
        return event.map((e) {
          final k = e.data() as Map<String, dynamic>;
          final g = k['point']['geopoint'] as GeoPoint;
          final num km = distance.as(
              LengthUnit.Kilometer,
              LatLng(mapInfo.geopoint?.latitude ?? 0,
                  mapInfo.geopoint?.longitude ?? 0),
              LatLng(g.latitude, g.longitude));
          return LocationDto(
              distanceInKm: km,
              name: k['point']['name'],
              address: k['point']['address'],
              geohash: k['point']['geohash'],
              geopoint: LatLngDto(
                latitude: g.latitude,
                longitude: g.longitude,
              ));
        }).toList();
      });
    }
    return const Stream.empty();
  }
}
