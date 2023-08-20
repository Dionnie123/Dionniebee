import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';

class MyMapModel extends StreamViewModel<LatLng> {
  final locationService = locator<LocationService>();

  LatLng? get currentCoordinates {
    // print(data);
    return data;
  }

  @override
  Stream<LatLng> get stream => locationService.locationStream;
  final useTransformerId = 'useTransformerId';
  final markerSize = 50.0;

  bool _useTransformer = true;
  get useTransformer => _useTransformer;
  set useTransformer(val) {
    _useTransformer = val;
    notifyListeners();
  }

  LatLng pointer = const LatLng(0, 0);

  void updatePoint(
    BuildContext context,
    AnimatedMapController controller,
    MapEvent? event,
  ) {
    final pointX = getPointX(context);
    final pointY = getPointY(context);

    pointer =
        controller.mapController.pointToLatLng(CustomPoint(pointX, pointY));
    notifyListeners();
  }

  double getPointX(BuildContext context) {
    return MediaQuery.of(context).size.width / 2;
  }

  double getPointY(BuildContext context) {
    return MediaQuery.of(context).size.height / 2;
  }

  Marker buildPin(LatLng point) => Marker(
      point: point,
      builder: (ctx) => Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Card(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:
                        Image.asset('assets/logo.png', width: 30, height: 30),
                  )),
              const Icon(
                Icons.location_pin,
                size: 35,
                color: Colors.red,
              ),
            ],
          ),
      width: 70,
      height: 70,
      anchorPos: AnchorPos.align(AnchorAlign.center));

  List<Marker> markers = [];
}
