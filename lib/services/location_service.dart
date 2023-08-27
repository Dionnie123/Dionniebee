// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

class LocationService {
  Location location = Location();
  GeoFlutterFire geo = GeoFlutterFire();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('locations');

  final StreamController<LatLng?> _locationController = BehaviorSubject();
  Stream<LatLng?> get getLocationStream => _locationController.stream;

  LocationService() {
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted ||
          granted == PermissionStatus.grantedLimited) {
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

  Stream<List<String>> getNearbyPlacesStream(MapInfo? mapInfo) {
    if (mapInfo != null) {
      final center = geo.point(
          latitude: mapInfo.refLatitude, longitude: mapInfo.refLongitude);
      return geo
          .collection(collectionRef: collectionReference)
          .within(
            center: center,
            radius: mapInfo.maxDistance,
            field: 'point',
          )
          .map((event) => event.map((e) => e.data().toString()).toList());
    }
    return Stream<List<String>>.fromIterable([]);
  }
}

class MapInfo {
  final double refLatitude;
  final double refLongitude;
  final double maxDistance;
  MapInfo({
    required this.refLatitude,
    required this.refLongitude,
    required this.maxDistance,
  });
}
