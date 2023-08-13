import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';

class LocationService with ListenableServiceMixin {
  LatLng? _currentLocation;

  var location = Location();

  LocationService() {
    listenToReactiveValues([_locationStream]);
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged.listen((locationData) {
          if (locationData.latitude != null && locationData.longitude != null) {
            _locationStream.value = LatLng(
              locationData.latitude ?? 0,
              locationData.longitude ?? 0,
            );
          }
        });
      }
    });
  }

  final ReactiveValue<LatLng?> _locationStream = ReactiveValue<LatLng?>(null);
  LatLng? get locationStream => _locationStream.value;

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
