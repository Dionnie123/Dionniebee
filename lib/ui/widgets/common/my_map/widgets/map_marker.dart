import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Marker markerWidget(int i, LatLng point) {
  return Marker(
    point: point,
    builder: (context) {
      return Stack(
        fit: StackFit.expand,
        children: [
          const SizedBox(
            width: 35,
            height: 35,
          ),
          const Icon(
            Icons.location_pin,
            size: 35,
            color: Colors.red,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              i.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
    },
  );
}
