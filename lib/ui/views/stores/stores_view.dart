import 'package:collection/collection.dart';
import 'package:dionniebee/app/models/location_dto.dart';
import 'package:dionniebee/ui/widgets/common/my_map/widgets/map_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:stacked/stacked.dart';
import 'package:dionniebee/ui/widgets/common/my_map/widgets/map_animated.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'stores_viewmodel.dart';

class StoresView extends HookWidget {
  const StoresView({super.key});

  @override
  Widget build(BuildContext context) {
    final tickerProvider = useSingleTickerProvider();
    final AnimatedMapController animatedMapController =
        AnimatedMapController(vsync: tickerProvider);

    return ViewModelBuilder<StoresViewModel>.reactive(
        viewModelBuilder: () => StoresViewModel(),
        builder: (
          BuildContext context,
          StoresViewModel viewModel,
          Widget? child,
        ) {
          return Scaffold(
            appBar: AppBar(
              title: Text(viewModel.number.toString()),
            ),
            body: LayoutBuilder(builder: (context, size) {
              return SlidingUpPanel(
                header: const Text("HEADER"),
                footer: const Text("FOOTER"),
                backdropEnabled: true,
                minHeight: size.maxHeight * 0.25,
                borderRadius: BorderRadius.circular(15),
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
                    padding: EdgeInsets.only(bottom: size.maxHeight * 0.25),
                    child: MapAnimated(
                      animatedMapController: animatedMapController,
                      onMapReady: () async {
                        print("READY!");
                      },
                      onChanged: (lat, long, distance) {
                        viewModel.mapInfo = LocationDto(
                            maxDistance: distance,
                            geopoint: LatLngDto(
                              latitude: lat,
                              longitude: long,
                            ));
                      },
                      boundary: LatLngBounds.fromPoints([
                        const LatLng(4.382696, 112.1661),
                        const LatLng(21.53021, 127.0742)
                      ]),
                      markers: viewModel.markers
                          .mapIndexed((i, e) => markerWidget(i, e))
                          .toList(),
                      centerPoint: viewModel.location, //Bahay Nakpil Bautista
                    )),
              );
            }),
          );
        });
  }
}
