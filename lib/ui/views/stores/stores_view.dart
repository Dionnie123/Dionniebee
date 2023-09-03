import 'package:collection/collection.dart';
import 'package:dionniebee/app/constants/mapbox.dart';
import 'package:dionniebee/ui/widgets/common/my_map/widgets/cluster_map.dart';
import 'package:dionniebee/ui/widgets/common/my_map/widgets/map_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'stores_viewmodel.dart';

class StoresView extends HookWidget {
  const StoresView({super.key});

  @override
  Widget build(BuildContext context) {
    final tickerProvider = useSingleTickerProvider();
    final AnimatedMapController animatedMapController = AnimatedMapController(
      vsync: tickerProvider,
    );

    return ViewModelBuilder<StoresViewModel>.reactive(
        viewModelBuilder: () => StoresViewModel(),
        builder: (
          BuildContext context,
          StoresViewModel viewModel,
          Widget? child,
        ) {
          return Scaffold(
            appBar: AppBar(),
            body: LayoutBuilder(builder: (context, size) {
              return SlidingUpPanel(
                header: const Text("HEADER"),
                footer: const Text("FOOTER"),
                backdropEnabled: true,
                minHeight: 200,
                panel: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: viewModel.nearbyPlaces
                        .mapIndexed((index, location) => Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    location.name.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " - ${location.distanceInKm} km",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )))
                        .toList(),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(bottom: 256),
                  child: Stack(
                    children: [
                      FlutterMap(
                        mapController: animatedMapController.mapController,
                        options: MapOptions(
                          maxBounds: LatLngBounds.fromPoints([
                            const LatLng(4.382696, 112.1661),
                            const LatLng(21.53021, 127.0742)
                          ]),
                          center: viewModel.location,
                          rotationThreshold: 0.0,
                          zoom: 12.0,
                          minZoom: 12.0,
                          onMapReady: () {},
                          onPointerUp: (event, point) {},
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
                            urlTemplate: mapUrlTemplate,
                            additionalOptions: mapAdditionOption,
                          ),
                          CurrentLocationLayer(),
                          MarkerClusterLayerWidget(
                            options: MarkerClusterLayerOptions(
                              anchorPos: AnchorPos.align(AnchorAlign.center),
                              maxClusterRadius: 100,
                              size: const Size(40, 40),
                              fitBoundsOptions: const FitBoundsOptions(
                                forceIntegerZoomLevel: false,
                                padding: EdgeInsets.all(50),
                              ),
                              markers: viewModel.markers
                                  .mapIndexed((i, e) => markerWidget(i, e))
                                  .toList(),
                              builder: (context, markers) {
                                return const ClusterMap(label: "C");
                              },
                            ),
                          ),
                          MarkerLayer(
                            markers: [
                              markerWidget(0, viewModel.location),
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
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }
}
