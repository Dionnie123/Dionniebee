import 'package:dionniebee/app/constants/mapbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

import 'map_floating_action_buttons.dart';
import 'package:location/location.dart';

enum MapStatus { ready, loading, error }

class MapAnimated extends StatefulWidget {
  final LatLngBounds boundary;
  final List<Marker> markers;
  final LatLng currentPoint;

  const MapAnimated(
      {super.key,
      required this.markers,
      required this.boundary,
      required this.currentPoint});

  @override
  State<MapAnimated> createState() => _AnimatedMapState();
}

class _AnimatedMapState extends State<MapAnimated>
    with TickerProviderStateMixin {
  LatLng? dragPoint;

  AnimatedMapController? _animatedMapController;

  MapStatus mapStatus = MapStatus.loading;
  var location = Location();
  updatePointOnDrag() {
    setState(() {
      dragPoint = _animatedMapController?.mapController.center;
    });
  }

  @override
  void initState() {
    _animatedMapController = AnimatedMapController(vsync: this);

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
        point: widget.currentPoint,
        builder: (context) {
          return const Icon(
            Icons.location_pin,
            size: 35,
            color: Colors.pink,
          );
        });
  }

  Widget circle() {
    return CircleLayer(circles: [
      CircleMarker(
        borderColor: Colors.red,
        borderStrokeWidth: 2,
        color: Colors.orange.withOpacity(0.1),
        point: widget.currentPoint,
        radius: 15000,
        useRadiusInMeter: true,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return _animatedMapController == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : LayoutBuilder(builder: (context, size) {
            return Stack(
              children: [
                FlutterMap(
                  mapController: _animatedMapController?.mapController,
                  options: MapOptions(
                    //  maxZoom: 12.0,
                    minZoom: 12.0,
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
                      forceIntegerZoomLevel: true,
                      inside: true,
                    ),
                    maxBounds: widget.boundary,
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
                            centerPoint: widget.currentPoint))),
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
