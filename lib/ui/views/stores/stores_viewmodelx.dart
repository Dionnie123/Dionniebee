import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.logger.dart';
import 'package:dionniebee/app/models/location_dto.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _locationStreamKey = 'location-stream';
const String _nearbyLocationStreamKey = 'nearby-location-stream';

class StoresViewModel extends MultipleStreamViewModel {
  final logger = getLogger('MyViewModel');
  final locationService = locator<LocationService>();
  final dialogService = locator<DialogService>();

  LatLng? get location => dataMap?[_locationStreamKey];

  List<LocationDto> get nearbyLocation =>
      dataMap?[_nearbyLocationStreamKey] ?? [];

  @override
  Map<String, StreamData> get streamsMap => {
        _locationStreamKey:
            StreamData<LatLng?>(locationService.getLocationStream),
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

  Future<LatLng?> movex() async {
    final x = await locationService.getLocation();
    print(x);
    return x;
  }

  start() async {
    await Location().requestPermission().then((value) async {
      if (value == PermissionStatus.granted ||
          value == PermissionStatus.grantedLimited) {
        locationService.emitLocation();
        mapInfo = LocationDto(
          maxDistance: 1000,
          geopoint: LatLngDto(
            latitude: location?.latitude,
            longitude: location?.longitude,
          ),
        );
      } else {
        dialogService.showDialog(title: "LOCATION IS EVERYTHING");
      }
    });
  }
}
