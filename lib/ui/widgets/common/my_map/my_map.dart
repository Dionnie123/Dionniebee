import 'dart:math';

import 'package:dionniebee/ui/widgets/common/my_map/widgets/animated_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';

import 'my_map_model.dart';

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
        body: AnimatedMap(
          onPop: () {},
          markers: viewModel.markers,
          currentPoint: viewModel.currentCoordinates,
        ));
  }

  @override
  MyMapModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyMapModel();

  @override
  void onViewModelReady(MyMapModel viewModel) {
    viewModel.markers = List.generate(
      10,
      (index) {
        double randomLatitude = 14.55 + Random().nextDouble() * (14.65 - 14.55);

        // Longitude range for the Philippines: approximately 117.0 to 127.0
        double randomLongitude =
            121.03 + Random().nextDouble() * (121.09 - 121.03);
        return viewModel.buildPin(LatLng(randomLatitude, randomLongitude));
      },
    );
    super.onViewModelReady(viewModel);
  }
}
