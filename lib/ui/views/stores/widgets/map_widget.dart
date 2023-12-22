import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:dionniebee/app/constants/mapbox.dart';
import 'package:dionniebee/ui/widgets/my_map/widgets/cluster_map.dart';
import 'package:dionniebee/ui/widgets/my_map/widgets/map_marker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'map_loader.dart';

class MapWidget extends StatelessWidget {
  final double zoom;
  final AnimatedMapController mapController;
  final bool isBusy;
  final bool isMapReloading;
  final LatLng? center;
  final Function(MapPosition, bool)? onPositionChanged;
  final List<LatLng> markers;
  const MapWidget(
      {super.key,
      required this.mapController,
      required this.isBusy,
      this.center,
      this.onPositionChanged,
      this.markers = const [],
      required this.isMapReloading,
      this.zoom = 12.0});

  @override
  Widget build(BuildContext context) {
    LatLng fallbackPoints = const LatLng(14.565310, 120.998703);
    LatLngBounds philippineBounds = LatLngBounds.fromPoints(
        [const LatLng(4.382696, 112.1661), const LatLng(21.53021, 127.0742)]);

    Widget pointerIcon() {
      return Icon(
        Icons.location_pin,
        size: 35,
        color: Colors.orange.shade600,
      );
    }

    return LoaderOverlay(
      overlayColor: Colors.black.withOpacity(0.5),
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 250),
      child: Builder(builder: (context) {
        if (isBusy) {
          context.loaderOverlay
              .show(widgetBuilder: (progress) => const MapLoader());
        } else {
          context.loaderOverlay.hide();
        }
        return Stack(
          children: [
            isMapReloading
                ? Container(color: Colors.grey)
                : FlutterMap(
                    mapController: mapController.mapController,
                    options: MapOptions(
                      keepAlive: true,
                      center: center ?? fallbackPoints,
                      zoom: zoom,
                      minZoom: 12.0,
                      rotationThreshold: 0.0,
                      maxBounds: philippineBounds,
                      onPositionChanged: (event, point) {
                        if (onPositionChanged != null) {
                          onPositionChanged!(event, point);
                        }
                      },
                      interactiveFlags: InteractiveFlag.drag |
                          InteractiveFlag.flingAnimation |
                          InteractiveFlag.pinchMove |
                          InteractiveFlag.pinchZoom |
                          InteractiveFlag.doubleTapZoom,
                      boundsOptions: const FitBoundsOptions(
                        forceIntegerZoomLevel: true,
                        inside: true,
                      ),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: mapUrlTemplate2,
                        additionalOptions: mapAdditionOption,
                      ),
                      MarkerClusterLayerWidget(
                        options: MarkerClusterLayerOptions(
                          anchorPos: AnchorPos.align(AnchorAlign.center),
                          maxClusterRadius: 100,
                          size: const Size(40, 40),
                          fitBoundsOptions: const FitBoundsOptions(
                            forceIntegerZoomLevel: false,
                            padding: EdgeInsets.all(50),
                          ),
                          markers: markers
                              .mapIndexed((i, e) => markerWidget(i, e))
                              .toList(),
                          builder: (context, markers) {
                            return const ClusterMap(label: "C");
                          },
                        ),
                      ),
                      MarkerLayer(
                        markers: [
                          markerWidget(
                            0,
                            center ?? fallbackPoints,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
            if (!isBusy)
              Positioned(
                top: 4,
                bottom: 0,
                left: 5,
                right: 0,
                child: pointerIcon(),
              ),
          ],
        );
      }),
    );
  }
}
