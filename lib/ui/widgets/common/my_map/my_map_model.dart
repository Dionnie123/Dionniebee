import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';

class MyMapModel extends StreamViewModel<LatLng> {
  final locationService = locator<LocationService>();

  LatLng? get currentCoordinates {
    print(data);
    return data;
  }

  @override
  Stream<LatLng> get stream => locationService.locationStream;

  final useTransformerId = 'useTransformerId';
  final markerSize = 50.0;
  final center = const LatLng(14.58691000, 121.06140000);
  bool _useTransformer = true;
  get useTransformer => _useTransformer;
  set useTransformer(val) {
    _useTransformer = val;
    notifyListeners();
  }

  Marker buildPin(LatLng point) => Marker(
      point: point,
      builder: (ctx) => const Icon(
            Icons.location_pin,
            size: 35,
            color: Colors.red,
          ),
      width: 35,
      height: 35,
      anchorPos: AnchorPos.align(AnchorAlign.center));

  List<AnimatedMarker> markers = [];
}
