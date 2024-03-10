import 'package:dionniebee/app/constants/mapbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

import 'map_floating_action_buttons.dart';

enum MapStatus { ready, loading, error }

// ignore: must_be_immutable
class MapAnimated extends StatefulWidget {
  final AnimatedMapController? animatedMapController;
  final LatLngBounds boundary;
  final List<Marker> markers;
  final LatLng centerPoint;
  final Function() onMapReady;
  final Function(LatLng, double distance) onChanged;

  const MapAnimated(
      {super.key,
      required this.markers,
      required this.boundary,
      required this.centerPoint,
      required this.onChanged,
      required this.onMapReady,
      required this.animatedMapController});

  @override
  State<MapAnimated> createState() => _AnimatedMapState();
}

class _AnimatedMapState extends State<MapAnimated> {
  LatLng? dragPoint;

  MapStatus mapStatus = MapStatus.loading;

  Widget mapTemplate() {
    return TileLayer(
      urlTemplate: mapUrlTemplate,
      additionalOptions: mapAdditionOption,
    );
  }

  Widget attributeLayer() {
    return const RichAttributionWidget(
      attributions: [
        TextSourceAttribution(
          'OpenStreetMap contributors',
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
      child: const Icon(
        Icons.location_pin,
        size: 35,
        color: Colors.orange,
      ),
    );
  }

  Marker centerPointMarker() {
    return Marker(
        point: widget.centerPoint,
        child: const Icon(
          Icons.location_pin,
          size: 35,
          color: Colors.orangeAccent,
        ));
  }

  Widget circle() {
    return CircleLayer(circles: [
      CircleMarker(
        borderColor: Colors.red,
        borderStrokeWidth: 2,
        color: Colors.red.withOpacity(0.1),
        point: widget.centerPoint,
        radius: 15000,
        useRadiusInMeter: true,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: widget.animatedMapController?.mapController,
          options: MapOptions(
            keepAlive: false,
            maxBounds: widget.boundary,
            center: widget.centerPoint,
            rotationThreshold: 0.0,
            zoom: 12.0,
            minZoom: 12.0,
            onMapReady: () {
              widget.onMapReady();
            },
            onPointerUp: (event, point) {
              if (widget.animatedMapController?.mapController.center != null) {
                dragPoint = widget.animatedMapController?.mapController.center;
                widget.onChanged(point, 10);
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
          nonRotatedChildren: [attributeLayer()],
          children: [
            mapTemplate(),
            //  circle(),
            MarkerClusterLayerWidget(
              options: MarkerClusterLayerOptions(
                /*   anchorPos: AnchorPos.align(AnchorAlign.center),
                  fitBoundsOptions: const CameraFit.bounds(
                  //Pag-tap pakita agad ng branch
                  forceIntegerZoomLevel: false,
                  padding: EdgeInsets.all(50),
                ), */
                maxClusterRadius: 100,
                size: const Size(40, 40),
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
                centerPointMarker(),
                dragPointMarker(),
              ],
            ),
          ],
        ),
        const Positioned(
            top: 5,
            bottom: 0,
            left: 5,
            right: 0,
            child: Icon(
              Icons.location_pin,
              size: 35,
              color: Colors.pink,
            )),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 50),
                child: MapFloatActionButtons(
                    controller: widget.animatedMapController,
                    centerPoint: widget.centerPoint))),
        Align(
          alignment: Alignment.bottomLeft,
          child: Wrap(
            children: [
              Text(widget.centerPoint.toString()),
              Text(
                "Drag Point: ${dragPoint.toString()}",
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
