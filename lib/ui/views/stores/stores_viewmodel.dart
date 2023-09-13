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
const String loaderBusy = 'loaderBusy';
const String mapBusy = 'mapBusy';

class StoresViewModel extends MultipleStreamViewModel {
  final logger = getLogger('MyViewModel');
  final locationService = locator<LocationService>();
  final dialogService = locator<DialogService>();

  LatLng? _locationStreamValue;
  LatLng? get locationStreamValue => _locationStreamValue;

  LatLng? _locationNonStreamValue;
  LatLng? get locationNonStreamValue => _locationNonStreamValue;

  List<LocationDto> _nearbyLocations = [];
  List<LocationDto> get nearbyLocations => _nearbyLocations;

  TextEditingController textController = TextEditingController();

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
      _nearbyLocations = data;
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
      textController.text = _locationNonStreamValue.toString();
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

  LatLng calculateCenterPoint() {
    if (nearbyLocations.isEmpty) {
      return const LatLng(
          14.565310, 120.998703); // Default center if the list is empty
    }

    num sumLat = 0.0;
    num sumLng = 0.0;

    for (var point in nearbyLocations) {
      sumLat += point.geopoint?.latitude ?? 0.0;
      sumLng += point.geopoint?.longitude ?? 0.0;
    }

    double avgLat = sumLat / nearbyLocations.length;
    double avgLng = sumLng / nearbyLocations.length;

    return LatLng(avgLat, avgLng);
  }

  start() async {
    await runBusyFuture(
        locationService.determinePosition().then((value) {
          _locationNonStreamValue = value;
          textController.text = value.toString();
          _locationDto = LocationDto(
              maxDistance: 1000,
              geopoint: LatLngDto(
                latitude: value?.latitude,
                longitude: value?.longitude,
              ));
          mapInfo = LocationDto(
            maxDistance: 1000,
            geopoint: LatLngDto(
              latitude: _locationDto?.geopoint?.latitude,
              longitude: _locationDto?.geopoint?.longitude,
            ),
          );
          notifySourceChanged(clearOldData: true);
        }),
        busyObject: loaderBusy,
        throwException: false);

    setBusyForObject(mapBusy, true);
    await Future.delayed(const Duration(milliseconds: 500));
    setBusyForObject(mapBusy, false);
  }
}
