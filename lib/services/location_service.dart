import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

class LocationService {
  Location location = Location();
  late FirebaseAuth _firebaseAuth;

  LocationService() {
    _firebaseAuth = FirebaseAuth.instance;
  }

/*   LocationService() {
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted ||
          granted == PermissionStatus.grantedLimited) {
        // If granted listen to the onLocationChanged stream and emit over our controller

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
  } */

  final StreamController<LatLng?> _locationController = BehaviorSubject();
  Stream<LatLng?> get locationStream => _locationController.stream;
  void listen() {
    location.onLocationChanged.listen((locationData) {
      if (locationData.latitude != null && locationData.longitude != null) {
        _locationController.add(LatLng(
          locationData.latitude ?? 0,
          locationData.longitude ?? 0,
        ));
      }
    });
  }

  LatLng? _liveLocation;
  Future<LatLng?> getLocation() async {
    try {
      LocationData locationData = await location.getLocation();
      _liveLocation = LatLng(
        locationData.latitude ?? 0.0,
        locationData.longitude ?? 0.0,
      );
    } on Exception catch (e) {
      debugPrint('Could not get location: ${e.toString()}');
    }
    return _liveLocation;
  }

  /*  final StreamController<LatLng?> _nearestPointsControler = BehaviorSubject();
  Stream<LatLng?> get nearestPointsStream => _nearestPointsControler.stream; */
  Stream<dynamic> getNearbyLocationStream(
      double refLatitude, double refLongitude, double maxDistance) {
    final geo = GeoFlutterFire();
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('locations');
    final center = geo.point(latitude: refLatitude, longitude: refLongitude);
    return geo
        .collection(collectionRef: collectionReference)
        .within(
          center: center,
          radius: maxDistance,
          field: 'point',
        )
        .map((event) => event);
  }
}
