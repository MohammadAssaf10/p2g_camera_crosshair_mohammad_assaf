import 'dart:io';

class ImageMetadata {
  final File file;
  final int width;
  final int height;
  final int fileSizeInBytes;
  final DateTime timestamp;
  final String storagePath;
  final String? exifOrientation;

  ImageMetadata({
    required this.file,
    required this.width,
    required this.height,
    required this.fileSizeInBytes,
    required this.timestamp,
    required this.storagePath,
    this.exifOrientation,
  });
}
