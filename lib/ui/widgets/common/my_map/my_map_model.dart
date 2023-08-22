import 'dart:math';

import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';

class MyMapModel extends StreamViewModel<LatLng?> {
  final locationService = locator<LocationService>();

  LatLng? get currentCoordinates {
    return data;
  }

  @override
  Stream<LatLng?> get stream => locationService.locationStream;

  List<LatLng> _markers = [];
  List<LatLng> get markers => _markers;

  bool _permit = false;
  bool get permit => _permit;
  Future request() async {
    await Location().requestPermission().then((granted) {
      _permit = (granted == PermissionStatus.granted) ||
          (granted == PermissionStatus.grantedLimited);
    });
  }

  Future start() async {
    _markers = List.generate(
      10,
      (index) {
        double randomLatitude = 14.55 + Random().nextDouble() * (14.65 - 14.55);
        double randomLongitude =
            121.03 + Random().nextDouble() * (121.09 - 121.03);
        return LatLng(randomLatitude, randomLongitude);
      },
    );
    await runBusyFuture(Future.wait([request()]));
  }
}
