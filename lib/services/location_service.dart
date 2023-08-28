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

  Stream<List<dynamic>> getNearbyPlacesStream(LocationDto? locationDto) {
    if (locationDto != null) {
      return geo
          .collection(collectionRef: collectionReference)
          .within(
            center: GeoFirePoint(
              locationDto.point?.geopoint?.latitude ?? 0,
              locationDto.point!.geopoint?.longitude ?? 0,
            ),
            radius: 100000,
            field: 'point',
          )
          .map((event) {
        final x = event.map((e) {
          final k = e.data() as Map<dynamic, dynamic>;
          final m = k['point']['geopoint'] as GeoPoint;
          print('==================');
          print(m.latitude);
          return e.data();
        }).toList();
        return x;
      });
    }
    return const Stream.empty();
  }
}
