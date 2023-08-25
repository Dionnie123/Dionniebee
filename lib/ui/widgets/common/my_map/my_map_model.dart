import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/location_service.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';

enum MapAccess { unknown, allowed, disallowed }

const String _liveLocationStreamKey = 'livelocation-stream';
const String _nearestLocationStreamKey = 'nearestlocation-stream';

class MyMapModel extends MultipleStreamViewModel {
  final locationService = locator<LocationService>();

  LatLng? _currentCoordinates;
  LatLng? get currentCoordinates => _currentCoordinates;
  List<String> _nearby = [];
  List<String> get nearby => _nearby;

  @override
  void onData(String key, data) {
    if (key == _liveLocationStreamKey) {
      _currentCoordinates = data;
    } else if (key == _nearestLocationStreamKey) {
      _nearby = data;
    }

    notifyListeners();
    super.onData(key, data);
  }

  @override
  Map<String, StreamData> get streamsMap => {
        _liveLocationStreamKey:
            StreamData<LatLng?>(locationService.locationStream),
        _nearestLocationStreamKey: StreamData<List<dynamic>>(
            locationService.getNearbyLocationStream(_mapInfo)),
      };

  MapInfo? _mapInfo;
  set mapInfo(val) {
    _mapInfo = val;
    notifySourceChanged();
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
        locationService.listen();
        _permit = MapAccess.allowed;
      } else {
        _permit = MapAccess.disallowed;
      }
      notifySourceChanged();
    }).whenComplete(() => print(permit));
  }
}
