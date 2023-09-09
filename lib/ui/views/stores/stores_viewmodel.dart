import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.logger.dart';
import 'package:dionniebee/app/models/location_dto.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _locationStreamKey = 'location-stream';
const String _nearbyLocationStreamKey = 'nearby-location-stream';

class StoresViewModel extends MultipleStreamViewModel {
  final logger = getLogger('MyViewModel');
  final locationService = locator<LocationService>();
  final dialogService = locator<DialogService>();

  LatLng? _locationStreamValue;
  LatLng? get locationStreamValue => _locationStreamValue;

  LatLng? _locationNonStreamValue;
  LatLng? get locationNonStreamValue => _locationNonStreamValue;

  List<LocationDto> _nearbyLocation = [];
  List<LocationDto> get nearbyLocation => _nearbyLocation;

  @override
  void onFutureError(error, Object? key) {
    super.onFutureError(error, key);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dialogService.showDialog(
          title: "Error",
          barrierDismissible: true,
          description: error.toString(),
          dialogPlatform: DialogPlatform.Custom);
    });
  }

  @override
  void onData(String key, data) {
    if (key == _locationStreamKey) {
      _locationStreamValue = data;
    }
    if (key == _nearbyLocationStreamKey) {
      _nearbyLocation = data;
    }
    super.onData(key, data);
  }

  @override
  Map<String, StreamData> get streamsMap => {
        _locationStreamKey:
            StreamData<LatLng?>(locationService.getLocationStream),
        _nearbyLocationStreamKey: StreamData<List<LocationDto>>(
            locationService.getNearbyPlacesStream(_locationDto)),
      };

  LocationDto? _locationDto;
  set mapInfo(LocationDto val) {
    if (val.geopoint?.longitude != null && val.geopoint?.latitude != null) {
      _locationNonStreamValue =
          LatLng(val.geopoint?.latitude ?? 0, val.geopoint?.longitude ?? 0);
      _locationDto = val;
      notifySourceChanged(clearOldData: true);
    }
  }

  final List<LatLng> _markers = [
    const LatLng(14.558098, 121.082855),
    const LatLng(14.616546, 121.051689),
    const LatLng(14.522642, 121.153839)
  ];

  List<LatLng> get markers => _markers;

  start() async {
    await runBusyFuture(
        Future.wait([
          locationService
              .determinePosition()
              .then((value) => _locationNonStreamValue = value)
        ]),
        throwException: true);
  }
}
