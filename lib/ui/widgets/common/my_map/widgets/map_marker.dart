import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Marker markerWidget(LatLng point) {
  return Marker(
    point: point,
    builder: (context) {
      return Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Card(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset('assets/logo.png', width: 30, height: 30),
              )),
          const Icon(
            Icons.location_pin,
            size: 35,
            color: Colors.red,
          ),
        ],
      );
    },
  );
}
