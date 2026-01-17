// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Camera Permission Required`
  String get cameraPermissionRequired {
    return Intl.message(
      'Camera Permission Required',
      name: 'cameraPermissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `This app requires camera access to function properly.\nPlease enable camera permissions in your device settings`
  String get cameraPermissionMessage {
    return Intl.message(
      'This app requires camera access to function properly.\nPlease enable camera permissions in your device settings',
      name: 'cameraPermissionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Open Settings`
  String get openSettings {
    return Intl.message(
      'Open Settings',
      name: 'openSettings',
      desc: '',
      args: [],
    );
  }

  /// `Capture Result`
  String get captureResult {
    return Intl.message(
      'Capture Result',
      name: 'captureResult',
      desc: '',
      args: [],
    );
  }

  /// `IMAGE METADATA`
  String get imageMetadata {
    return Intl.message(
      'IMAGE METADATA',
      name: 'imageMetadata',
      desc: '',
      args: [],
    );
  }

  /// `RESOLUTION`
  String get resolution {
    return Intl.message('RESOLUTION', name: 'resolution', desc: '', args: []);
  }

  /// `FILE SIZE`
  String get fileSize {
    return Intl.message('FILE SIZE', name: 'fileSize', desc: '', args: []);
  }

  /// `STORAGE PATH`
  String get storagePath {
    return Intl.message(
      'STORAGE PATH',
      name: 'storagePath',
      desc: '',
      args: [],
    );
  }

  /// `TIMESTAMP`
  String get timestamp {
    return Intl.message('TIMESTAMP', name: 'timestamp', desc: '', args: []);
  }

  /// `EXIF ORIENTATION`
  String get exifOrientation {
    return Intl.message(
      'EXIF ORIENTATION',
      name: 'exifOrientation',
      desc: '',
      args: [],
    );
  }

  /// `Up (0°)`
  String get orientationUp {
    return Intl.message('Up (0°)', name: 'orientationUp', desc: '', args: []);
  }

  /// `Down (180°)`
  String get orientationDown {
    return Intl.message(
      'Down (180°)',
      name: 'orientationDown',
      desc: '',
      args: [],
    );
  }

  /// `Right (90°)`
  String get orientationRight {
    return Intl.message(
      'Right (90°)',
      name: 'orientationRight',
      desc: '',
      args: [],
    );
  }

  /// `Left (270°)`
  String get orientationLeft {
    return Intl.message(
      'Left (270°)',
      name: 'orientationLeft',
      desc: '',
      args: [],
    );
  }

  /// `Up, Mirrored`
  String get orientationUpMirrored {
    return Intl.message(
      'Up, Mirrored',
      name: 'orientationUpMirrored',
      desc: '',
      args: [],
    );
  }

  /// `Down, Mirrored`
  String get orientationDownMirrored {
    return Intl.message(
      'Down, Mirrored',
      name: 'orientationDownMirrored',
      desc: '',
      args: [],
    );
  }

  /// `Left, Mirrored`
  String get orientationLeftMirrored {
    return Intl.message(
      'Left, Mirrored',
      name: 'orientationLeftMirrored',
      desc: '',
      args: [],
    );
  }

  /// `Right, Mirrored`
  String get orientationRightMirrored {
    return Intl.message(
      'Right, Mirrored',
      name: 'orientationRightMirrored',
      desc: '',
      args: [],
    );
  }

  /// `Retake Photo`
  String get retakePhoto {
    return Intl.message(
      'Retake Photo',
      name: 'retakePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Diagnostics`
  String get toggleDiagnostics {
    return Intl.message(
      'Toggle Diagnostics',
      name: 'toggleDiagnostics',
      desc: '',
      args: [],
    );
  }

  /// `Diagnostics`
  String get diagnostics {
    return Intl.message('Diagnostics', name: 'diagnostics', desc: '', args: []);
  }

  /// `Error Saving Image`
  String get errorSavingImage {
    return Intl.message(
      'Error Saving Image',
      name: 'errorSavingImage',
      desc: '',
      args: [],
    );
  }

  /// `We encountered an issue while saving your photo. Please try again.`
  String get errorSavingImageMessage {
    return Intl.message(
      'We encountered an issue while saving your photo. Please try again.',
      name: 'errorSavingImageMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
