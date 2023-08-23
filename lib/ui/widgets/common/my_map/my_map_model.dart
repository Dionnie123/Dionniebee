import 'dart:math';

import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';

enum MapAccess { unknown, allowed, disallowed }

class MyMapModel extends StreamViewModel<LatLng?> {
  final locationService = locator<LocationService>();

  LatLng? get currentCoordinates {
    return data;
  }

  @override
  Stream<LatLng?> get stream {
    return locationService.locationStream;
  }

  final List<LatLng> _markers = List.generate(
    10,
    (index) {
      double randomLatitude = 14.55 + Random().nextDouble() * (14.65 - 14.55);
      double randomLongitude =
          121.03 + Random().nextDouble() * (121.09 - 121.03);
      return LatLng(randomLatitude, randomLongitude);
    },
  );
  List<LatLng> get markers => _markers;

  MapAccess _permit = MapAccess.unknown;
  MapAccess get permit => _permit;
  Future request() async {
    await Location().requestPermission().then((granted) {
      if ((granted == PermissionStatus.granted) ||
          (granted == PermissionStatus.grantedLimited)) {
        locationService.listen();
        _permit = MapAccess.allowed;
      } else {
        _permit = MapAccess.disallowed;
      }
      notifyListeners();
    }).whenComplete(() => print(permit));
  }
}
