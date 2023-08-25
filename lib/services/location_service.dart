// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      print('cccccccccccccccc');
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

  Stream<List<dynamic>> getNearbyLocationStream(MapInfo? mapInfo) {
    print('>>>>>>>>>>>>>>>>>>>>>>>');
    final geo = GeoFlutterFire();
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('locations');
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
          .map((event) => event);
    }
    return Stream<List<dynamic>>.fromIterable([]);
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
