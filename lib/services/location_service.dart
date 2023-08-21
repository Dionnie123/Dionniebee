import 'dart:async';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

class LocationService {
  LocationService() {
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        _locationController.sink.add(null);

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
  LatLng? _liveLocation;
  Location location = Location();
  final StreamController<LatLng?> _locationController = BehaviorSubject();

  Stream<LatLng?> get locationStream => _locationController.stream;

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
}
