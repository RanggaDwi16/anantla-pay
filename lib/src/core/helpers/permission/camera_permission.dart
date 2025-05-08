import 'package:permission_handler/permission_handler.dart';

Future<void> checkCameraPermission() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
    await Permission.camera.request();
  }
}

Future<void> checkGalleryPermission() async {
  var status = await Permission.photos.status;
  if (!status.isGranted) {
    // If not granted, request permission
    var result = await Permission.photos.request();
    if (result.isGranted) {
      print('Permission granted');
      // Proceed with image picking logic
    } else {
      print('Permission denied');
      // Handle permission denial (show a message or prompt user)
    }
  } else {
    print('Permission already granted');
  }
}
