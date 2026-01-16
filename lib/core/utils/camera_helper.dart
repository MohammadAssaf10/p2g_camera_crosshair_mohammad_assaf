import 'package:permission_handler/permission_handler.dart';

class CameraHelper {
  CameraHelper._();

  static Future<PermissionStatus> checkCameraPermissions() async {
    PermissionStatus cameraPermission = await Permission.camera.status;
    if (cameraPermission.isGranted || cameraPermission.isPermanentlyDenied) {
      return cameraPermission;
    }
    cameraPermission = await Permission.camera.request();
    return cameraPermission;
  }
}
