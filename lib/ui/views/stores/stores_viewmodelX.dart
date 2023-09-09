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

class StoresViewModel extends ReactiveViewModel {
  final logger = getLogger('MyViewModel');
  final locationService = locator<LocationService>();
  final dialogService = locator<DialogService>();

  LatLng? _location;
  LatLng? get location => _location;

  final List<LocationDto> _nearbyLocation = [];
  List<LocationDto> get nearbyLocation => _nearbyLocation;

  LocationDto? _locationDto;
  set mapInfo(LocationDto val) {
    if (val.geopoint?.longitude != null && val.geopoint?.latitude != null) {
      _location =
          LatLng(val.geopoint?.latitude ?? 0, val.geopoint?.longitude ?? 0);
      _locationDto = val;
    }
  }

  final List<LatLng> _markers = [
    const LatLng(14.558098, 121.082855),
    const LatLng(14.616546, 121.051689),
    const LatLng(14.522642, 121.153839)
  ];

  List<LatLng> get markers => _markers;

  start() async {
    await runBusyFuture(Future.wait([
      locationService.initialise(),
      locationService.getLocation().then((value) => _location = value)
    ]));
    if (locationService.permissionGranted != PermissionStatus.granted) {
      dialogService.showDialog(description: "Location is Everthing");
    }
  }
}
