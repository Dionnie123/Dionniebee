import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.logger.dart';
import 'package:dionniebee/app/models/location_dto.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum MapAccess { unknown, allowed, disallowed }

const String _locationStreamKey = 'location-stream';
const String _nearbyLocationStreamKey = 'nearby-location-stream';

class StoresViewModel extends MultipleStreamViewModel {
  final logger = getLogger('MyViewModel');
  final locationService = locator<LocationService>();
  final dialogService = locator<DialogService>();

  AnimatedMapController? animatedMapController;

  LatLng get location =>
      dataMap?[_locationStreamKey] ?? const LatLng(14.565310, 120.998703);
  bool get hasLocation => dataReady(_locationStreamKey);

  List<LocationDto> get nearbyPlaces =>
      dataMap?[_nearbyLocationStreamKey] ?? [];

/*   LatLng? get number => dataMap?[_numStreamKey]; */

/*   @override
  void onCancel(String key) {
    logger.i("Stream Stopped");
    super.onCancel(key);
  }

  @override
  void onSubscribed(String key) {
    logger.i("Stream Subscribed");
    super.onSubscribed(key);
  } */

  @override
  Map<String, StreamData> get streamsMap => {
        /*   _numStreamKey:
            StreamData<LatLng?>(locationService.epochUpdatesNumbers()), */
        _locationStreamKey:
            StreamData<LatLng?>(locationService.getLocationStream),
        _nearbyLocationStreamKey: StreamData<List<LocationDto>>(
            locationService.getNearbyPlacesStream(_locationDto)),
      };

  LocationDto? _locationDto;
  set mapInfo(LocationDto val) {
    _locationDto = val;
    notifySourceChanged(clearOldData: false);
  }

  final List<LatLng> _markers = [
    const LatLng(14.558098, 121.082855),
    const LatLng(14.616546, 121.051689),
    const LatLng(14.522642, 121.153839)
  ];

  List<LatLng> get markers => _markers;
}
