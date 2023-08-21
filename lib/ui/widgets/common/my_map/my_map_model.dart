import 'dart:math';

import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';

class MyMapModel extends StreamViewModel<LatLng?> {
  final locationService = locator<LocationService>();

  LatLng? get currentCoordinates {
    return data;
  }

  @override
  Stream<LatLng?> get stream => locationService.locationStream;

  final List<LatLng> _markers = List.generate(
    10,
    (index) {
      double randomLatitude = 14.55 + Random().nextDouble() * (14.65 - 14.55);
      // Longitude range for the Philippines: approximately 117.0 to 127.0
      double randomLongitude =
          121.03 + Random().nextDouble() * (121.09 - 121.03);
      return LatLng(randomLatitude, randomLongitude);
    },
  );

  List<LatLng> get markers => _markers;
}
