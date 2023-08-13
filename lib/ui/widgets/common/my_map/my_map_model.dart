import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';

class MyMapModel extends BaseViewModel {
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
