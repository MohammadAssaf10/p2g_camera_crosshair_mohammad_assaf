import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:p2g_camera_crosshair_mohammad_assaf/core/utils/file_helper.dart';

/// Fake PathProvider for tests
class FakePathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    return Directory.systemTemp.path;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Override path_provider before running tests
  setUpAll(() {
    PathProviderPlatform.instance = FakePathProviderPlatform();
  });

  group('FileHelper Tests', () {
    test('downloadFile returns null when file does not exist', () async {
      // Arrange
      final File nonExistentFile = File('/non/existent/path/image.jpg');

      // Act
      final File? result = await FileHelper.downloadFile(nonExistentFile);

      // Assert
      expect(result, isNull);
    });

    test('downloadFile returns File when file exists', () async {
      // Arrange
      final Directory tempDir = await Directory.systemTemp.createTemp();
      final File sourceFile = File('${tempDir.path}/test_image.jpg');

      // Write minimal JPEG header bytes
      await sourceFile.writeAsBytes([0xFF, 0xD8, 0xFF, 0xE0]);

      // Act
      final File? result = await FileHelper.downloadFile(sourceFile);

      // Assert
      expect(result, isNotNull);
      expect(await result!.exists(), isTrue);
    });
  });
}
