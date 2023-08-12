import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:stacked/stacked.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'stores_viewmodel.dart';

class StoresView extends StackedView<StoresViewModel> {
  const StoresView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoresViewModel viewModel,
    Widget? child,
  ) {
    AnchorAlign anchorAlign = AnchorAlign.top;
    bool counterRotate = false;
    final customMarkers = <Marker>[];

    Marker buildPin(latLng.LatLng point) => Marker(
          point: point,
          builder: (ctx) => const Icon(Icons.location_pin, size: 60),
          width: 60,
          height: 60,
        );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FlutterMap(
        options: MapOptions(
            center: const latLng.LatLng(51.5, -0.09),
            zoom: 5,
            onTap: (_, p) {}),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayer(
            rotate: counterRotate,
            anchorPos: AnchorPos.align(anchorAlign),
            markers: [
              buildPin(
                  const latLng.LatLng(51.51868093513547, -0.12835376940892318)),
              buildPin(
                  const latLng.LatLng(53.33360293799854, -6.284001062079881)),
              Marker(
                point:
                    const latLng.LatLng(47.18664724067855, -1.5436768515939427),
                width: 64,
                height: 64,
                anchorPos: AnchorPos.align(AnchorAlign.left),
                builder: (context) => const ColoredBox(
                  color: Colors.lightBlue,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('-->'),
                  ),
                ),
              ),
              Marker(
                point:
                    const latLng.LatLng(47.18664724067855, -1.5436768515939427),
                width: 64,
                height: 64,
                anchorPos: AnchorPos.align(AnchorAlign.right),
                builder: (context) => const ColoredBox(
                  color: Colors.pink,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('<--'),
                  ),
                ),
              ),
              Marker(
                point:
                    const latLng.LatLng(47.18664724067855, -1.5436768515939427),
                rotate: false,
                builder: (context) => const ColoredBox(color: Colors.black),
              ),
            ],
          ),
          MarkerLayer(
            markers: customMarkers,
            rotate: counterRotate,
            anchorPos: AnchorPos.align(anchorAlign),
          ),
          TileLayer(
            urlTemplate:
                'https://basemaps.cartocdn.com/rastertiles/voyager_nolabels/{z}/{x}/{y}.png',
          ),
        ],
      ),
    );
  }

  @override
  StoresViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoresViewModel();
}
