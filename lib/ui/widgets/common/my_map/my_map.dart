import 'package:dionniebee/ui/widgets/common/my_map/widgets/animated_map.dart';
import 'package:dionniebee/ui/widgets/common/my_map/widgets/separated_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';

import 'my_map_model.dart';
import 'widgets/non_rotated_children.dart';

class MyMap extends StackedView<MyMapModel> {
  const MyMap({super.key});

  @override
  Widget builder(
    BuildContext context,
    MyMapModel viewModel,
    Widget? child,
  ) {
    return AnimatedMap(
      onPop: () {},
      builder: (context, controller) {
        Widget actions() {
          return SeparatedColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            separator: const SizedBox(height: 8),
            children: [
              FloatingActionButton(
                onPressed: () => controller.animatedRotateFrom(
                  90,
                  customId: viewModel.useTransformer
                      ? viewModel.useTransformerId
                      : null,
                ),
                tooltip: 'Rotate 90°',
                child: const Icon(Icons.rotate_right),
              ),
              FloatingActionButton(
                onPressed: () => controller.animatedRotateFrom(
                  -90,
                  customId: viewModel.useTransformer
                      ? viewModel.useTransformerId
                      : null,
                ),
                tooltip: 'Rotate -90°',
                child: const Icon(Icons.rotate_left),
              ),
              FloatingActionButton(
                onPressed: () {
                  viewModel.markers = [];
                  controller.animateTo(
                    dest: viewModel.center,
                    rotation: 0,
                    customId: viewModel.useTransformer
                        ? viewModel.useTransformerId
                        : null,
                  );
                },
                tooltip: 'Clear modifications',
                child: const Icon(Icons.clear_all),
              ),
              FloatingActionButton(
                onPressed: () => controller.animatedZoomIn(
                  customId: viewModel.useTransformer
                      ? viewModel.useTransformerId
                      : null,
                ),
                tooltip: 'Zoom in',
                child: const Icon(Icons.zoom_in),
              ),
              FloatingActionButton(
                onPressed: () => controller.animatedZoomOut(
                  customId: viewModel.useTransformer
                      ? viewModel.useTransformerId
                      : null,
                ),
                tooltip: 'Zoom out',
                child: const Icon(Icons.zoom_out),
              ),
              FloatingActionButton(
                tooltip: 'Center on markers',
                onPressed: () {
                  if (viewModel.markers.isEmpty) return;

                  final points = viewModel.markers.map((m) => m.point).toList();
                  controller.centerOnPoints(
                    points,
                    customId: viewModel.useTransformer
                        ? viewModel.useTransformerId
                        : null,
                  );
                },
                child: const Icon(Icons.center_focus_strong),
              ),
              FloatingActionButton.extended(
                label: Row(
                  children: [
                    const Text('Transformer'),
                    Switch(
                      activeColor: Colors.blue.shade200,
                      activeTrackColor: Colors.black38,
                      value: viewModel.useTransformer,
                      onChanged: (newValue) {
                        viewModel.useTransformer = newValue;
                      },
                    ),
                  ],
                ),
                onPressed: () {
                  viewModel.useTransformer = !viewModel.useTransformer;
                },
              ),
            ],
          );
        }

        return Stack(
          children: [
            FlutterMap(
              mapController: controller.mapController,
              options: MapOptions(
                  interactiveFlags: InteractiveFlag.drag |
                      InteractiveFlag.flingAnimation |
                      InteractiveFlag.pinchMove |
                      InteractiveFlag.pinchZoom |
                      InteractiveFlag.doubleTapZoom,
                  boundsOptions: const FitBoundsOptions(
                      forceIntegerZoomLevel: true, inside: true),
                  maxBounds: LatLngBounds.fromPoints([
                    const LatLng(4.382696, 112.1661),
                    const LatLng(21.53021, 127.0742)
                  ]),
                  center: const LatLng(14.58691000, 121.06140000),
                  zoom: 10.5,
                  rotationThreshold: 0.0),
              nonRotatedChildren: nrChildren,
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/mbulingit/cll89rse000b401puaxxlcroa/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWJ1bGluZ2l0IiwiYSI6ImNsbDdqdG1ucTBzd2Izc3FxYXF2Nnp3NXMifQ.C0RXDFn0tmETYAAhKrITDw',
                  additionalOptions: const {
                    'token':
                        'pk.eyJ1IjoibWJ1bGluZ2l0IiwiYSI6ImNsbDdqdG1ucTBzd2Izc3FxYXF2Nnp3NXMifQ.C0RXDFn0tmETYAAhKrITDw',
                    'id': 'mapbox.mapbox-streets-v8'
                  },
                ),
                /*   MarkerLayer(
                  markers: [buildPin(const LatLng(14.58691000, 121.06140000))],
                ), */
                CurrentLocationLayer(
                    // followOnLocationUpdate: FollowOnLocationUpdate.always,
                    turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
                    style: const LocationMarkerStyle(
                      marker: DefaultLocationMarker(
                        child: Icon(
                          Icons.navigation,
                          color: Colors.white,
                        ),
                      ),
                      markerSize: Size(40, 40),
                      markerDirection: MarkerDirection.heading,
                    )),
                CircleLayer(
                  circles: [
                    CircleMarker(
                      borderColor: Colors.red,
                      borderStrokeWidth: 2,
                      color: Colors.orange.withOpacity(0.1),
                      point: const LatLng(14.58691000, 121.06140000),
                      radius: 12000,
                      useRadiusInMeter: true,
                    ),
                  ],
                ),
              ],
            ),
            Align(alignment: Alignment.bottomRight, child: actions())
          ],
        );
      },
    );
  }

  @override
  MyMapModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyMapModel();
}
