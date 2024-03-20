import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.logger.dart';
import 'package:dionniebee/app/models/location_dto.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _locationStreamKey = 'location-stream';
const String _nearbyLocationDeliveryStreamKey =
    '_nearbyLocationDeliveryStreamKey';
const String _nearbyLocationPickupStreamKey = '_nearbyLocationPickupStreamKey';
const String loaderBusy = 'loaderBusy';
const String mapBusy = 'mapBusy';

class StoresViewModel extends MultipleStreamViewModel {
  final logger = getLogger('MyViewModel');
  final locationService = locator<LocationService>();
  final dialogService = locator<DialogService>();

  LatLng? _myLocationStreamValue;
  LatLng? get myLocationStreamValue => _myLocationStreamValue;

  LatLng? _myLocationDeliveryNonStreamValue;
  LatLng? get myLocationDeliveryNonStreamValue =>
      _myLocationDeliveryNonStreamValue;

  LatLng? _myLocationPickupNonStreamValue;
  LatLng? get myLocationPickupNonStreamValue => _myLocationPickupNonStreamValue;

  TextEditingController textDeliveryController = TextEditingController();
  TextEditingController textPickupController = TextEditingController();

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

  List<LocationDto> _nearbyDeliveryLocations = [];
  List<LocationDto> get nearbyDeliveryLocations => _nearbyDeliveryLocations;

  List<LocationDto> _nearbyPickupLocations = [];
  List<LocationDto> get nearbyPickupLocations => _nearbyPickupLocations;

  @override
  void onData(String key, data) {
    if (key == _locationStreamKey) {
      _myLocationStreamValue = data;
    }
    if (key == _nearbyLocationDeliveryStreamKey) {
      _nearbyDeliveryLocations = data;
    }
    if (key == _nearbyLocationPickupStreamKey) {
      _nearbyPickupLocations = data;
    }
    super.onData(key, data);
  }

  @override
  Map<String, StreamData> get streamsMap => {
        _locationStreamKey:
            StreamData<LatLng?>(locationService.getLocationStream),
        _nearbyLocationDeliveryStreamKey: StreamData<List<LocationDto>>(
            locationService.getNearbyPlacesStream(_locationDeliveryDto)),
        _nearbyLocationPickupStreamKey: StreamData<List<LocationDto>>(
            locationService.getNearbyPlacesStream(_locationPickupDto)),
      };

  LocationDto? _locationDeliveryDto;
  LocationDto? _locationPickupDto;

  void updateNearbyDeliveryStream(LocationDto val) {
    if (val.geopoint?.longitude != null && val.geopoint?.latitude != null) {
      _myLocationDeliveryNonStreamValue =
          LatLng(val.geopoint?.latitude ?? 0, val.geopoint?.longitude ?? 0);
      textDeliveryController.text =
          _myLocationDeliveryNonStreamValue.toString();
      _locationDeliveryDto = val;
      notifySourceChanged(clearOldData: true);
    }
  }

  void updateNearbyPickupStream(LocationDto val) {
    if (val.geopoint?.longitude != null && val.geopoint?.latitude != null) {
      _myLocationPickupNonStreamValue =
          LatLng(val.geopoint?.latitude ?? 0, val.geopoint?.longitude ?? 0);
      textPickupController.text = _myLocationPickupNonStreamValue.toString();
      _locationPickupDto = val;
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
        locationService.determinePosition().then((value) {
          _myLocationDeliveryNonStreamValue = value;
          _myLocationPickupNonStreamValue = value;
          textDeliveryController.text = value != null ? value.toString() : "";
          textPickupController.text = value != null ? value.toString() : "";

          _locationDeliveryDto = LocationDto(
            maxDistance: 1000,
            geopoint: LatLngDto(
              latitude: value?.latitude,
              longitude: value?.longitude,
            ),
          );
          _locationPickupDto = LocationDto(
              maxDistance: 1000,
              geopoint: LatLngDto(
                latitude: value?.latitude,
                longitude: value?.longitude,
              ));
          notifySourceChanged(clearOldData: true);
        }),
        busyObject: loaderBusy,
        throwException: false);

    setBusyForObject(mapBusy, true);
    await Future.delayed(const Duration(milliseconds: 500));
    setBusyForObject(mapBusy, false);
  }
}
