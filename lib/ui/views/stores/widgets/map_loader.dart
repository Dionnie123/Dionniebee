import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class MapLoader extends StatelessWidget {
  const MapLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
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
    ));
  }
}
