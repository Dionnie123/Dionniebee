import 'package:dionniebee/app/models/location_dto.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/views/stores/stores_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';

import 'map_widget.dart';
import 'sliding_up_panel_list.dart';

class PickupView extends StatefulWidget {
  const PickupView({super.key});

  @override
  State<PickupView> createState() => _PickupViewState();
}

class _PickupViewState extends State<PickupView> with TickerProviderStateMixin {
  late AnimatedMapController animatedMapController;
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    animatedMapController = AnimatedMapController(vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<StoresViewModel>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                //padding: const EdgeInsets.all(8.0),
                controller: tabController,

                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.red,
                ),

                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                // overlayColor: const MaterialStatePropertyAll(Colors.red),
                tabs: const [
                  Tab(
                    child: Text(
                      "Nearby",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Favorites",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Scaffold(
                  appBar: AppBar(
                      backgroundColor: Colors.white,
                      automaticallyImplyLeading: false,
                      titleSpacing: 8,
                      title: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: TextField(
                                  controller: viewModel.textController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                            Icons.center_focus_weak_rounded),
                                        onPressed: () async {
                                          await viewModel.start();
                                        },
                                      ),
                                      hintText: 'Search...',
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                            hSpaceSmall,
                            ElevatedButton(
                                onPressed: () {}, child: const Text("Filters")),
                          ],
                        ),
                      )),
                  body: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 200),
                        child: MapWidget(
                          mapController: animatedMapController,
                          isBusy: viewModel.busy(loaderBusy),
                          isMapReloading: viewModel.busy(mapBusy),
                          center: viewModel.locationNonStreamValue ??
                              viewModel.calculateCenterPoint(),
                          markers: viewModel.markers,
                          onPositionChanged: (event, point) {
                            viewModel.mapInfo = LocationDto(
                              maxDistance: 1000,
                              geopoint: LatLngDto(
                                latitude: event.center?.latitude,
                                longitude: event.center?.longitude,
                              ),
                            );
                          },
                        ),
                      ),
                      SlidingUpPanel(
                        // color: Colors.black.withOpacity(0.8),
                        backdropEnabled: true,
                        minHeight: 200,
                        panel: SlidingUpPanelList(
                            items: viewModel.nearbyLocations),
                      ),
                    ],
                  ),
                ),
                const Text("fdsfds")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
