import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

import 'package:p2g_camera_crosshair_mohammad_assaf/core/utils/camera_helper.dart';

class FakePermissionHandler extends PermissionHandlerPlatform {
  PermissionStatus statusToReturn;

  FakePermissionHandler(this.statusToReturn);

  @override
  Future<PermissionStatus> checkPermissionStatus(Permission permission) async {
    return statusToReturn;
  }

  @override
  Future<Map<Permission, PermissionStatus>> requestPermissions(
    List<Permission> permissions,
  ) async {
    return {for (final permission in permissions) permission: statusToReturn};
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CameraHelper Tests', () {
    test('returns granted when permission already granted', () async {
      PermissionHandlerPlatform.instance = FakePermissionHandler(
        PermissionStatus.granted,
      );

      final result = await CameraHelper.checkCameraPermissions();

      expect(result, PermissionStatus.granted);
    });

    test('requests permission when initially denied', () async {
      PermissionHandlerPlatform.instance = FakePermissionHandler(
        PermissionStatus.denied,
      );

      final result = await CameraHelper.checkCameraPermissions();

      expect(result, PermissionStatus.denied);
    });
  });
}
