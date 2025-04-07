import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

part 'location_provider.g.dart';

@riverpod
Future<String> location(LocationRef ref) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permission denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permission permanently denied');
  }

  Position position = await Geolocator.getCurrentPosition();

  List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  final placemark = placemarks.first;
  final city = placemark.subAdministrativeArea ?? 'Unknown';
  final country = placemark.country ?? 'Unknown';

  return '$city, $country';
}
