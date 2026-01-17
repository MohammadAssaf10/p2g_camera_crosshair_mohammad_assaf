import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/utils/app_enums.dart';

part 'camera_state.g.dart';

abstract class CameraState implements Built<CameraState, CameraStateBuilder> {
  BlocStatus get status;
  PermissionStatus? get cameraPermissionStatus;
  bool get isCameraInitialized;
  FlashMode get flashMode;
  CameraLensDirection get currentLensDirection;
  File? get capturedImage;
  bool get showDiagnostics;
  GridMode get gridMode;
  CameraState._();
  factory CameraState([void Function(CameraStateBuilder) updates]) =
      _$CameraState;

  factory CameraState.initial() => CameraState(
    (b) => b
      ..cameraPermissionStatus = null
      ..isCameraInitialized = false
      ..flashMode = FlashMode.off
      ..currentLensDirection = CameraLensDirection.back
      ..capturedImage = null
      ..showDiagnostics = false
      ..gridMode = GridMode.crosshair
      ..status = BlocStatus.initial,
  );
}
