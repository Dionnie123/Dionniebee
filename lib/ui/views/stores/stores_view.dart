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
        onViewModelReady: (viewModel) async {
          await viewModel.start();
        },
        builder: (
          BuildContext context,
          StoresViewModel viewModel,
          Widget? child,
        ) {
          return Scaffold(
            appBar: AppBar(
              bottom: viewModel.isBusy
                  ? null
                  : PreferredSize(
                      preferredSize: const Size.fromHeight(56.0),
                      child: Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(viewModel.location.toString())),
                                IconButton(
                                    onPressed: () async {
                                      animatedMapController.mapController.move(
                                          viewModel.location ??
                                              const LatLng(0, 0),
                                          12);
                                    },
                                    icon: const Icon(
                                        Icons.center_focus_strong_rounded))
                              ],
                            ),
                          ),
                        ),
                      )),
            ),
            body: LayoutBuilder(builder: (context, size) {
              return viewModel.isBusy
                  ? const Center(child: CircularProgressIndicator())
                  : SlidingUpPanel(
                      header: const Text("HEADER"),
                      footer: const Text("FOOTER"),
                      backdropEnabled: true,
                      minHeight: 200,
                      panel: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: viewModel.nearbyLocation
                              .mapIndexed((index, location) => Card(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            location.toString(),
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
                            FlutterMap(
                              mapController:
                                  animatedMapController.mapController,
                              options: MapOptions(
                                center: viewModel.location ??
                                    const LatLng(14.565310, 120.998703),
                                zoom: 12.0,
                                minZoom: 12.0,
                                rotationThreshold: 0.0,
                                maxBounds: LatLngBounds.fromPoints([
                                  const LatLng(4.382696, 112.1661),
                                  const LatLng(21.53021, 127.0742)
                                ]),
                                onMapReady: () {
                                  viewModel.mapInfo = LocationDto(
                                    maxDistance: 1000,
                                    geopoint: LatLngDto(
                                      latitude: viewModel.location?.latitude,
                                      longitude: viewModel.location?.longitude,
                                    ),
                                  );
                                },
                                onMapEvent: (event) {
                                  viewModel.mapInfo = LocationDto(
                                    maxDistance: 1000,
                                    geopoint: LatLngDto(
                                      latitude: event.center.latitude,
                                      longitude: event.center.longitude,
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
                                        viewModel.location ??
                                            const LatLng(0, 0),
                                        color: Colors.purple),
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
