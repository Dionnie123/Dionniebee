import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Marker markerWidget(int i, LatLng point, {Color? color}) {
  return Marker(
    point: point,
    builder: (context) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.location_pin, size: 35, color: color ?? Colors.red),
        ],
      );
    },
  );
}
