import 'package:dionniebee/app/constants/mapbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

import 'map_floating_action_buttons.dart';
import 'package:location/location.dart';

enum MapStatus { ready, loading, error }

class AnimatedMap extends StatefulWidget {
  final LatLngBounds? boundary;
  final List<Marker> markers;
  final LatLng? currentPoint;

  const AnimatedMap(
      {super.key, required this.markers, this.boundary, this.currentPoint});

  @override
  State<AnimatedMap> createState() => _AnimatedMapState();
}

class _AnimatedMapState extends State<AnimatedMap>
    with TickerProviderStateMixin {
  LatLng? dragPoint;

  AnimatedMapController? _animatedMapController;
  MapController? _mapController;
  MapStatus mapStatus = MapStatus.loading;
  var location = Location();
  updatePointOnDrag() {
    setState(() {
      dragPoint = _animatedMapController?.mapController.center;
    });
  }

  @override
  void initState() {
    try {
      _animatedMapController = AnimatedMapController(vsync: this);
      _mapController = _animatedMapController?.mapController;

      if (_animatedMapController != null &&
          _mapController != null &&
          widget.currentPoint != null) {}
      mapStatus = MapStatus.ready;
    } catch (e) {
      mapStatus = MapStatus.error;
    }

    super.initState();
  }

  Widget mapTemplate() {
    return TileLayer(
      urlTemplate: mpUrlTemplate,
      additionalOptions: mpAdditionOption,
    );
  }

  Widget attributeLayer() {
    return const RichAttributionWidget(
      attributions: [
        TextSourceAttribution(
          'OpenStreetMap contributors',
          /*       onTap: () => launchUrl(
                        Uri.parse('https://openstreetmap.org/copyright')), */
        ),
      ],
    );
  }

  Widget clusteredMapWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.red),
      child: Center(
        child: Text(
          widget.markers.length.toString(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Marker dragPointMarker() {
    return Marker(
        point: dragPoint ?? const LatLng(0, 0),
        builder: (context) {
          return const Icon(
            Icons.location_pin,
            size: 35,
            color: Colors.pink,
          );
        });
  }

  Marker currentPointMarker() {
    return Marker(
        point: widget.currentPoint ?? const LatLng(0, 0),
        builder: (context) {
          return const Icon(
            Icons.location_pin,
            size: 35,
            color: Colors.pink,
          );
        });
  }

  Widget circle() {
    return (widget.currentPoint == null)
        ? const SizedBox.shrink()
        : CircleLayer(circles: [
            CircleMarker(
              borderColor: Colors.red,
              borderStrokeWidth: 2,
              color: Colors.orange.withOpacity(0.1),
              point: widget.currentPoint ?? const LatLng(0, 0),
              radius: 15000,
              useRadiusInMeter: true,
            )
          ]);
  }

  final philippineMaxBounds = LatLngBounds.fromPoints(
      [const LatLng(4.382696, 112.1661), const LatLng(21.53021, 127.0742)]);

  @override
  Widget build(BuildContext context) {
    return (mapStatus == MapStatus.loading)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : LayoutBuilder(builder: (context, size) {
            return Stack(
              children: [
                widget.currentPoint == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : FlutterMap(
                        mapController: _animatedMapController?.mapController,
                        options: MapOptions(
                          onMapReady: () {
                            updatePointOnDrag();
                          },
                          onMapEvent: (event) {
                            updatePointOnDrag();
                          },
                          interactiveFlags: InteractiveFlag.drag |
                              InteractiveFlag.flingAnimation |
                              InteractiveFlag.pinchMove |
                              InteractiveFlag.pinchZoom |
                              InteractiveFlag.doubleTapZoom,
                          boundsOptions: const FitBoundsOptions(
                              forceIntegerZoomLevel: true, inside: true),
                          maxBounds: philippineMaxBounds,
                          center: widget.currentPoint,
                          rotationThreshold: 0.0,
                          zoom: 12.0,
                        ),
                        nonRotatedChildren: [attributeLayer()],
                        children: [
                          mapTemplate(),
                          circle(),
                          MarkerClusterLayerWidget(
                            options: MarkerClusterLayerOptions(
                              anchorPos: AnchorPos.align(AnchorAlign.center),
                              maxClusterRadius: 100,
                              size: const Size(40, 40),
                              fitBoundsOptions: const FitBoundsOptions(
                                //Pag-tap pakita agad ng branch
                                forceIntegerZoomLevel: false,
                                padding: EdgeInsets.all(50),
                              ),
                              markers: [
                                ...widget.markers,
                              ],
                              builder: (context, markers) {
                                return clusteredMapWidget();
                              },
                            ),
                          ),
                          MarkerLayer(
                            markers: [
                              dragPointMarker(),
                              currentPointMarker(),
                            ],
                          ),
                        ],
                      ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: MapFloatActionButtons(
                          controller: _animatedMapController,
                          centerPoint:
                              widget.currentPoint ?? const LatLng(0, 0),
                        ))),
                /*   Positioned(
                  top: (size.maxHeight - 35) / 2,
                  left: (size.maxWidth / 2) - 35 / 2,
                  child: const Icon(
                    Icons.location_pin,
                    size: 35,
                    color: Colors.green,
                  ),
                ), */
                Align(
                  child: Column(
                    children: [
                      Text(widget.currentPoint.toString()),
                      Text(dragPoint.toString()),
                    ],
                  ),
                ),
                Align(
                  child: Column(
                    children: [
                      Text(widget.currentPoint.toString()),
                      Text(dragPoint.toString()),
                    ],
                  ),
                )
              ],
            );
          });
  }
}
