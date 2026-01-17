// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "cameraPermissionMessage": MessageLookupByLibrary.simpleMessage(
      "This app requires camera access to function properly.\nPlease enable camera permissions in your device settings",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Camera Permission Required",
    ),
    "captureResult": MessageLookupByLibrary.simpleMessage("Capture Result"),
    "diagnostics": MessageLookupByLibrary.simpleMessage("Diagnostics"),
    "errorSavingImage": MessageLookupByLibrary.simpleMessage(
      "Error Saving Image",
    ),
    "errorSavingImageMessage": MessageLookupByLibrary.simpleMessage(
      "We encountered an issue while saving your photo. Please try again.",
    ),
    "exifOrientation": MessageLookupByLibrary.simpleMessage("EXIF ORIENTATION"),
    "fileSize": MessageLookupByLibrary.simpleMessage("FILE SIZE"),
    "imageMetadata": MessageLookupByLibrary.simpleMessage("IMAGE METADATA"),
    "openSettings": MessageLookupByLibrary.simpleMessage("Open Settings"),
    "orientationDown": MessageLookupByLibrary.simpleMessage("Down (180°)"),
    "orientationDownMirrored": MessageLookupByLibrary.simpleMessage(
      "Down, Mirrored",
    ),
    "orientationLeft": MessageLookupByLibrary.simpleMessage("Left (270°)"),
    "orientationLeftMirrored": MessageLookupByLibrary.simpleMessage(
      "Left, Mirrored",
    ),
    "orientationRight": MessageLookupByLibrary.simpleMessage("Right (90°)"),
    "orientationRightMirrored": MessageLookupByLibrary.simpleMessage(
      "Right, Mirrored",
    ),
    "orientationUp": MessageLookupByLibrary.simpleMessage("Up (0°)"),
    "orientationUpMirrored": MessageLookupByLibrary.simpleMessage(
      "Up, Mirrored",
    ),
    "resolution": MessageLookupByLibrary.simpleMessage("RESOLUTION"),
    "retakePhoto": MessageLookupByLibrary.simpleMessage("Retake Photo"),
    "storagePath": MessageLookupByLibrary.simpleMessage("STORAGE PATH"),
    "timestamp": MessageLookupByLibrary.simpleMessage("TIMESTAMP"),
    "toggleDiagnostics": MessageLookupByLibrary.simpleMessage(
      "Toggle Diagnostics",
    ),
  };
}
