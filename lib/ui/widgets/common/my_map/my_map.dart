import 'package:dionniebee/ui/widgets/common/my_map/widgets/animated_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';

import 'my_map_model.dart';
import 'widgets/marker_widget.dart';

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
        body: viewModel.currentCoordinates == null
            ? const Center(child: CircularProgressIndicator())
            : AnimatedMap(
                boundary: LatLngBounds.fromPoints([
                  const LatLng(4.382696, 112.1661),
                  const LatLng(21.53021, 127.0742)
                ]),
                markers: viewModel.markers.map((e) => markerWidget(e)).toList(),
                currentPoint:
                    viewModel.currentCoordinates ?? const LatLng(0, 0),
              ));
  }

  @override
  MyMapModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyMapModel();
}
