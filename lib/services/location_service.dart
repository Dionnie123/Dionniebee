// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dionniebee/app/models/location_dto.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

enum LocationAccess { unknown, allowed, disallowed }

class LocationService {
  final Distance distance = const Distance();
  Location location = Location();
  GeoFlutterFire geo = GeoFlutterFire();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('locations');

  final StreamController<LatLng?> locationController = BehaviorSubject();
  Stream<LatLng?> get getLocationStream => locationController.stream;

  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  PermissionStatus? get permissionGranted => _permissionGranted;
  LocationData? _locationData;
  LocationData? get locationData => _locationData;

  Future<void> initialise() async {
    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied ||
          _permissionGranted == PermissionStatus.deniedForever) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      location.onLocationChanged.listen((locationData) {
        if (locationData.latitude != null && locationData.longitude != null) {
          locationController.add(
            LatLng(
              locationData.latitude ?? 0,
              locationData.longitude ?? 0,
            ),
          );
        }
      });
    } catch (e) {
      print("ERROR ${e.toString()}");
    }
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

  Stream<List<LocationDto>> getNearbyPlacesStream(LocationDto? point) {
    if (point != null) {
      final center = geo.point(
          latitude: point.geopoint?.latitude ?? 0,
          longitude: point.geopoint?.longitude ?? 0);
      return geo
          .collection(collectionRef: collectionReference)
          .within(
            center: center,
            radius: point.maxDistance ?? 10,
            field: 'point',
          )
          .map((event) {
        return event.map((e) {
          final k = e.data() as Map<String, dynamic>;
          final g = k['point']['geopoint'] as GeoPoint;
          final num km = distance.as(
              LengthUnit.Kilometer,
              LatLng(point.geopoint?.latitude ?? 0,
                  point.geopoint?.longitude ?? 0),
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
