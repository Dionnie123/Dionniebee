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
  final Function(double lat, double long, double distance) onMapReady;
  final Function(double lat, double long, double distance) onChanged;

  const MapAnimated(
      {super.key,
      required this.markers,
      required this.boundary,
      required this.currentPoint,
      required this.onChanged,
      required this.onMapReady});

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        dragPoint = _animatedMapController?.mapController.center;
      });
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
            color: Colors.orange,
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
            color: Colors.orangeAccent,
          );
        });
  }

  Widget circle() {
    return CircleLayer(circles: [
      CircleMarker(
        borderColor: Colors.red,
        borderStrokeWidth: 2,
        color: Colors.red.withOpacity(0.1),
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
        : Stack(
            children: [
              FlutterMap(
                mapController: _animatedMapController?.mapController,
                options: MapOptions(
                  minZoom: 12.0,
                  onMapReady: () {
                    updatePointOnDrag();
                    final event = _animatedMapController?.mapController.center;
                    print(event);
                    if (event?.latitude != null && event?.longitude != null) {
                      widget.onMapReady(event!.latitude, event.longitude, 10);
                    }
                  },
                  onMapEvent: (event) {
                    widget.onChanged(
                        event.center.latitude, event.center.longitude, 10);
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
                      currentPointMarker(),
                      dragPointMarker(),
                    ],
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 50),
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
  }
}
