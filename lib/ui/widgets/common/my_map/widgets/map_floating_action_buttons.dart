import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';

import 'separated_column.dart';

class MapFloatActionButtons extends StatelessWidget {
  final LatLng centerPoint;
  final AnimatedMapController? controller;
  const MapFloatActionButtons(
      {super.key, required this.controller, required this.centerPoint});

  @override
  Widget build(BuildContext context) {
    return SeparatedColumn(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      separator: const SizedBox(height: 8),
      children: [
        FloatingActionButton(
          onPressed: () {
            controller?.animateTo(
              zoom: 12.0,
              dest: centerPoint,
              rotation: 0,
            );
          },
          tooltip: 'Clear modifications',
          child: const Icon(Icons.center_focus_strong),
        ),
        FloatingActionButton(
          onPressed: () => controller?.animatedZoomIn(),
          tooltip: 'Zoom in',
          child: const Icon(Icons.zoom_in),
        ),
        FloatingActionButton(
          onPressed: () => controller?.animatedZoomOut(),
          tooltip: 'Zoom out',
          child: const Icon(Icons.zoom_out),
        ),
      ],
    );
  }
}
