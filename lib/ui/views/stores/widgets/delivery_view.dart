import 'package:dionniebee/app/models/location_dto.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/views/stores/stores_viewmodel.dart';
import 'package:dionniebee/ui/views/stores/widgets/map_widget.dart';
import 'package:dionniebee/ui/views/stores/widgets/sliding_up_panel_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';

class DeliveryView extends StatefulWidget {
  const DeliveryView({super.key});

  @override
  State<DeliveryView> createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView>
    with TickerProviderStateMixin {
  late AnimatedMapController animatedMapController;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    animatedMapController = AnimatedMapController(vsync: this);
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
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
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          titleSpacing: 8,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: TextField(
                      controller: viewModel.textDeliveryController,
                      decoration: InputDecoration(
                          filled: true,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.center_focus_weak_rounded),
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
                ElevatedButton(onPressed: () {}, child: const Text("Filters")),
              ],
            ),
          )),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 200),
            child: MapWidget(
              zoom: 17.0,
              mapController: animatedMapController,
              isBusy: viewModel.busy(loaderBusy),
              isMapReloading: viewModel.busy(mapBusy),
              center: viewModel.myLocationDeliveryNonStreamValue,
              onPositionChanged: (event, point) {
                viewModel.updateNearbyDeliveryStream(LocationDto(
                  maxDistance: 1000,
                  geopoint: LatLngDto(
                    latitude: event.center?.latitude,
                    longitude: event.center?.longitude,
                  ),
                ));
              },
            ),
          ),
          SlidingUpPanel(
            backdropEnabled: true,
            minHeight: 200,
            panel: viewModel.nearbyDeliveryLocations.isEmpty
                ? Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: 200,
                    child: const Center(
                      child: Text("No Store Found"),
                    ),
                  )
                : SlidingUpPanelList(items: viewModel.nearbyDeliveryLocations),
          ),
        ],
      ),
    );
  }
}
