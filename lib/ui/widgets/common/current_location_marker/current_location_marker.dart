import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'current_location_marker_model.dart';

class CurrentLocationMarker extends StackedView<CurrentLocationMarkerModel> {
  const CurrentLocationMarker({super.key});

  @override
  Widget builder(
    BuildContext context,
    CurrentLocationMarkerModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CurrentLocationMarkerModel viewModelBuilder(
    BuildContext context,
  ) =>
      CurrentLocationMarkerModel();
}
