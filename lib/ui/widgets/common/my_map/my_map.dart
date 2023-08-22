import 'package:app_settings/app_settings.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:dionniebee/ui/widgets/common/my_map/widgets/map_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';

import 'my_map_model.dart';
import 'widgets/map_marker.dart';

class MyMap extends StackedView<MyMapModel> {
  const MyMap({super.key});

  @override
  Widget builder(
    BuildContext context,
    MyMapModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(),
        body: viewModel.permit == false
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Location is everything! Enable it on Settings",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      vSpaceSmall,
                      const Text(
                        "Hi there! To provide you with the best experience, we need to access your location. This will help us tailor our services to your area.",
                        textAlign: TextAlign.center,
                      ),
                      vSpaceSmall,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.grey)),
                              onPressed: () {},
                              child: const Text("Return")),
                          hSpaceSmall,
                          ElevatedButton(
                              onPressed: () async {
                                if (await Permission
                                        .location.isPermanentlyDenied ||
                                    await Permission.location.isDenied) {
                                  // The user opted to never again see the permission request dialog for this
                                  // app. The only way to change the permission's status now is to let the
                                  // user manually enable it in the system settings.

                                  await AppSettings.openAppSettings();
                                  print("fdsfsf");
                                }
                              },
                              child: const Text("Settings"))
                        ],
                      )
                    ],
                  ),
                ),
              )
            : viewModel.currentCoordinates == null
                ? const Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      vSpaceSmall,
                      Text(
                        "Fetching location...please wait",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ))
                : MapAnimated(
                    boundary: LatLngBounds.fromPoints([
                      const LatLng(4.382696, 112.1661),
                      const LatLng(21.53021, 127.0742)
                    ]),
                    markers:
                        viewModel.markers.map((e) => markerWidget(e)).toList(),
                    currentPoint:
                        viewModel.currentCoordinates ?? const LatLng(0, 0),
                  ));
  }

  @override
  MyMapModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyMapModel();

  @override
  Future<void> onViewModelReady(MyMapModel viewModel) async {
    await viewModel.start();
    super.onViewModelReady(viewModel);
  }
}
