import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dionniebee/app/models/location_dto.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stacked/stacked_annotations.dart';

enum LocationAccess { unknown, allowed, disallowed }

@LazySingleton()
class LocationService {
  final Distance distance = const Distance();
  late LocationSettings locationSettings;

  GeoFlutterFire geo = GeoFlutterFire();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('locations');

  final StreamController<LatLng?> locationController = BehaviorSubject();
  Stream<LatLng?> get getLocationStream => locationController.stream;

  LatLng? lastDeterminedPosition;
  Future<LatLng?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    LatLng? temp;
    try {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.bestForNavigation,
              timeLimit: const Duration(seconds: 5))
          .then((value) async {
        lastDeterminedPosition = LatLng(value.latitude, value.longitude);
        temp = LatLng(value.latitude, value.longitude);
      });
    } catch (e) {
      return Future.error(
          "${e.toString()}\nThis is a Geolocator bug that causes fetching location take forever, \nso we added 5 seconds time limit to prevent this.");
      //  return lastDeterminedPosition;
    }

    return temp;
  }

  Stream<List<LocationDto>> getNearbyPlacesStream(LocationDto? point) {
    try {
      if (point != null) {
        final center = geo.point(
            latitude: point.geopoint?.latitude ?? 0,
            longitude: point.geopoint?.longitude ?? 0);
        return geo
            .collection(collectionRef: collectionReference)
            .within(
              center: center,
              radius: point.maxDistance ?? 10,
              field: 'point',
            )
            .map((event) {
          return event.map((e) {
            final k = e.data() as Map<String, dynamic>;
            final g = k['point']['geopoint'] as GeoPoint;
            final num km = distance.as(
                LengthUnit.Kilometer,
                LatLng(point.geopoint?.latitude ?? 0,
                    point.geopoint?.longitude ?? 0),
                LatLng(g.latitude, g.longitude));
            return LocationDto(
                distanceInKm: km,
                name: k['point']['name'],
                address: k['point']['address'],
                geohash: k['point']['geohash'],
                geopoint: LatLngDto(
                  latitude: g.latitude,
                  longitude: g.longitude,
                ));
          }).toList();
        });
      }
    } catch (e) {
      return const Stream.empty();
    }
    return const Stream.empty();
  }
}
