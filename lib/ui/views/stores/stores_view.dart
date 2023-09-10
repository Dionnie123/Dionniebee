import 'package:collection/collection.dart';
import 'package:dionniebee/app/constants/mapbox.dart';
import 'package:dionniebee/app/models/location_dto.dart';
import 'package:dionniebee/ui/widgets/common/my_map/widgets/cluster_map.dart';
import 'package:dionniebee/ui/widgets/common/my_map/widgets/map_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
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
        initialiseSpecialViewModelsOnce: true,
        onViewModelReady: (viewModel) async {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await viewModel.start();
          });
        },
        builder: (
          BuildContext context,
          StoresViewModel viewModel,
          Widget? child,
        ) {
          return Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(56.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(
                                      "${viewModel.locationNonStreamValue ?? "Your Address"}")),
                              IconButton(
                                  onPressed: () async {
                                    await viewModel.start();
                                  },
                                  icon: const Icon(
                                      Icons.center_focus_strong_rounded))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            body: LayoutBuilder(builder: (context, size) {
              return SlidingUpPanel(
                backdropEnabled: true,
                minHeight: 200,
                panel: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: viewModel.nearbyLocations
                        .mapIndexed((index, location) => Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      location.name.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " - ${location.distanceInKm} km",
                                    overflow: TextOverflow.ellipsis,
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
                      viewModel.isBusy
                          ? Container(color: Colors.grey)
                          : FlutterMap(
                              mapController:
                                  animatedMapController.mapController,
                              options: MapOptions(
                                center: viewModel.locationNonStreamValue ??
                                    const LatLng(14.565310, 120.998703),
                                zoom: 12.0,
                                minZoom: 12.0,
                                rotationThreshold: 0.0,
                                maxBounds: LatLngBounds.fromPoints([
                                  const LatLng(4.382696, 112.1661),
                                  const LatLng(21.53021, 127.0742)
                                ]),
                                onPositionChanged: (event, point) {
                                  viewModel.mapInfo = LocationDto(
                                    maxDistance: 1000,
                                    geopoint: LatLngDto(
                                      latitude: event.center?.latitude,
                                      longitude: event.center?.longitude,
                                    ),
                                  );
                                },
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
                                MarkerClusterLayerWidget(
                                  options: MarkerClusterLayerOptions(
                                    anchorPos:
                                        AnchorPos.align(AnchorAlign.center),
                                    maxClusterRadius: 100,
                                    size: const Size(40, 40),
                                    fitBoundsOptions: const FitBoundsOptions(
                                      forceIntegerZoomLevel: false,
                                      padding: EdgeInsets.all(50),
                                    ),
                                    markers: viewModel.markers
                                        .mapIndexed(
                                            (i, e) => markerWidget(i, e))
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
                                        viewModel.locationNonStreamValue ??
                                            const LatLng(14.565310, 120.998703),
                                        color: Colors.purple),
                                  ],
                                ),
                              ],
                            ),
                      if (viewModel.isBusy)
                        Align(
                          alignment: Alignment.topCenter,
                          child: LinearProgressIndicator(
                              minHeight: 5,
                              backgroundColor: Colors.red.shade100,
                              color: Colors.red),
                        ),
                      if (!viewModel.isBusy)
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
