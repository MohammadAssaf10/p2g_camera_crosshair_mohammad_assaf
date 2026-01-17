import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:native_exif/native_exif.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/photo_details_page/data/models/image_metadata.dart';

class FileHelper {
  FileHelper._();

  static Future<File?> downloadFile(File file) async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final int timestamp = DateTime.now().millisecondsSinceEpoch;
      final String fileName = 'image_$timestamp.jpg';
      final String filePath = '${directory.path}/$fileName';

      final File savedFile = await file.copy(filePath);
      return savedFile;
    } catch (e) {
      return null;
    }
  }

  static Future<ImageMetadata?> extractImageMetadata(File imageFile) async {
    try {
      final FileStat fileStats = await imageFile.stat();
      final Uint8List fileBytes = await imageFile.readAsBytes();

      final ui.Codec codec = await ui.instantiateImageCodec(fileBytes);
      final ui.FrameInfo frame = await codec.getNextFrame();
      final ui.Image image = frame.image;

      // Extract EXIF orientation
      final String? exifOrientation = await _extractEXIFOrientation(
        imageFile.path,
      );

      final ImageMetadata imageMetadata = ImageMetadata(
        file: imageFile,
        width: image.width,
        height: image.height,
        fileSizeInBytes: fileStats.size,
        timestamp: fileStats.modified,
        storagePath: imageFile.path,
        exifOrientation: exifOrientation,
      );

      return imageMetadata;
    } catch (e) {
      return null;
    }
  }

  static Future<String?> _extractEXIFOrientation(String imagePath) async {
    try {
      final Exif exif = await Exif.fromPath(imagePath);
      final Map<String, Object>? attributes = await exif.getAttributes();
      final String? orientationValue = attributes?['Orientation']?.toString();

      await exif.close();
      return orientationValue;
    } catch (e) {
      return null;
    }
  }
}
