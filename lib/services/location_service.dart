// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dionniebee/app/models/point_dto.dart';
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

  void listenToLocationStream() {
    location.onLocationChanged.listen((locationData) {
      if (locationData.latitude != null && locationData.longitude != null) {
        _locationController.add(LatLng(
          locationData.latitude ?? 0,
          locationData.longitude ?? 0,
        ));
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

  Stream<List<String>> getNearbyPlacesStream(PointDto? mapInfo) {
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
          print(k['point']);
          return PointDto(
                  geohash: k['point']['geohash'],
                  geopoint: LatLngDto(
                      latitude: k['latitude'], longitude: k['longitude']))
              .toString();
        }).toList();
      });
    }
    return const Stream.empty();
  }
}

class MapInfo {
  final double latitude;
  final double longitude;
  final double maxDistance;
  MapInfo({
    required this.latitude,
    required this.longitude,
    required this.maxDistance,
  });
}
