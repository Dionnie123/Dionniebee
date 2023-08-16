import 'dart:async';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

class LocationService {
  LatLng? _currentLocation;

  var location = Location();

  Stream<int> epochUpdatesNumbers() async* {
    int counter = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield counter += 1;
    }
  }

  Stream<int> loc() async* {
    int counter = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield counter += 1;
    }
  }

  LocationService() {
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
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
  }
  final StreamController<LatLng> _locationController = BehaviorSubject();

  closeController() {
    _locationController.close();
  }

  Stream<LatLng> get locationStream => _locationController.stream;

  Future<LatLng?> getLocation() async {
    try {
      LocationData userLocation = await location.getLocation();
      _currentLocation = LatLng(
        userLocation.latitude ?? 0.0,
        userLocation.longitude ?? 0.0,
      );
    } on Exception catch (e) {
      debugPrint('Could not get location: ${e.toString()}');
    }
    return _currentLocation;
  }
}
