import 'package:dionniebee/app/constants/mapbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

import 'map_floating_action_buttons.dart';
import 'package:location/location.dart';

enum MapStatus { ready, loading, error }

// ignore: must_be_immutable
class MapAnimated extends StatefulWidget {
  final AnimatedMapController? animatedMapController;
  final LatLngBounds boundary;
  final List<Marker> markers;
  final LatLng centerPoint;
  final Function() onMapReady;
  final Function(double lat, double long, double distance) onChanged;

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
  var location = Location();
  updatePointOnDrag() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        dragPoint = widget.animatedMapController?.mapController.center;
        print(dragPoint);
      });
    });
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
          /* onTap: () =>
              launchUrl(Uri.parse('https://openstreetmap.org/copyright')), */
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

  Marker centerPointMarker() {
    return Marker(
        point: widget.centerPoint,
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
              widget.onChanged(point.latitude, point.longitude, 10);
              updatePointOnDrag();
            },
            onMapEvent: (event) {},
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
                centerPointMarker(),
                dragPointMarker(),
              ],
            ),
            /*    DragMarkers(
                    markers: [
                      DragMarker(
                        size: const Size.fromWidth(35),
                        point: dragPoint ?? const LatLng(0, 0),
                        offset: const Offset(0.0, -8.0),
                        builder: (ctx, latlang, b) =>
                            const Icon(Icons.location_on, size: 50),
                        onDragUpdate: (details, latLng) => print(latLng),
                      ),
                    ],
                  ), */
          ],
        ),
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
              Text(dragPoint.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
