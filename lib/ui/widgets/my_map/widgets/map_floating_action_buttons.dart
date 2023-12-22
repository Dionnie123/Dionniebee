import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';

class MapFloatActionButtons extends StatelessWidget {
  final LatLng centerPoint;
  final AnimatedMapController? controller;
  const MapFloatActionButtons(
      {super.key, required this.controller, required this.centerPoint});

  @override
  Widget build(BuildContext context) {
    return _SeparatedColumn(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      separator: const SizedBox(height: 8),
      children: [
        FloatingActionButton(
          backgroundColor: Colors.black.withOpacity(0.6),
          onPressed: () {
            controller?.mapController.move(centerPoint, 12.0);
          },
          tooltip: 'Clear modifications',
          child: const Icon(Icons.center_focus_strong),
        ),
        /*   FloatingActionButton(
          backgroundColor: Colors.black.withOpacity(0.6),
          onPressed: () => controller?.animatedZoomIn(),
          tooltip: 'Zoom in',
          child: const Icon(Icons.zoom_in),
        ),
        FloatingActionButton(
          backgroundColor: Colors.black.withOpacity(0.6),
          onPressed: () => controller?.animatedZoomOut(),
          tooltip: 'Zoom out',
          child: const Icon(Icons.zoom_out),
        ), */
      ],
    );
  }
}

class _SeparatedColumn extends StatelessWidget {
  const _SeparatedColumn({
    required this.separator,
    this.children = const [],
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final Widget separator;
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        ..._buildChildren(),
      ],
    );
  }

  Iterable<Widget> _buildChildren() sync* {
    for (var i = 0; i < children.length; i++) {
      yield children[i];
      if (i < children.length - 1) yield separator;
    }
  }
}
