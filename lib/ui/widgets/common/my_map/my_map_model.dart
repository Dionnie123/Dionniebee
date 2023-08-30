import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/models/location_dto.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum MapAccess { unknown, allowed, disallowed }

const String _locationStreamKey = 'location-stream';
const String _nearbyLocationStreamKey = 'nearby-location-stream';

class MyMapModel extends MultipleStreamViewModel {
  final locationService = locator<LocationService>();
  final dialogService = locator<DialogService>();

  LatLng? _location;
  LatLng? get location => _location;

  List<LocationDto> _nearbyPlaces = [];
  List<LocationDto> get nearbyPlaces => _nearbyPlaces;

  @override
  void onData(String key, data) {
    if (key == _locationStreamKey) {
      _location = data;
    } else if (key == _nearbyLocationStreamKey) {
      _nearbyPlaces = data;
    }
    notifyListeners();
    super.onData(key, data);
  }

  @override
  Map<String, StreamData> get streamsMap => {
        _locationStreamKey:
            StreamData<dynamic>(locationService.getLocationStream),
        _nearbyLocationStreamKey: StreamData<List<LocationDto>>(
            locationService.getNearbyPlacesStream(_locationDto)),
      };

  LocationDto? _locationDto;
  set mapInfo(LocationDto val) {
    _locationDto = val;
    notifySourceChanged(clearOldData: true);
  }

  final List<LatLng> _markers = [
    const LatLng(14.558098, 121.082855),
    const LatLng(14.616546, 121.051689),
    const LatLng(14.522642, 121.153839)
  ];

  List<LatLng> get markers => _markers;

  MapAccess _permit = MapAccess.unknown;
  MapAccess get permit => _permit;
  Future request() async {
    await Location().requestPermission().then((granted) {
      if ((granted == PermissionStatus.granted) ||
          (granted == PermissionStatus.grantedLimited)) {
        _permit = MapAccess.allowed;
        locationService.listenToLocationStream();
      } else {
        _permit = MapAccess.disallowed;
        dialogService.showDialog(
            description: "Location is Everything", barrierDismissible: false);
      }
      //   notifyListeners();
    });
  }
}
