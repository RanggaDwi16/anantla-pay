import 'package:permission_handler/permission_handler.dart';

Future<void> checkLocationPermission() async {
  var status = await Permission.location.status;
  if (!status.isGranted) {
    await Permission.location.request();
  }
}