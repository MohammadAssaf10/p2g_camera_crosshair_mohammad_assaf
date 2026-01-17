import 'package:built_value/built_value.dart';
import 'package:camera/camera.dart';

part 'camera_event.g.dart';

abstract class CameraEvent {}

abstract class InitializeCamera extends CameraEvent
    implements Built<InitializeCamera, InitializeCameraBuilder> {
  InitializeCamera._();
  factory InitializeCamera([void Function(InitializeCameraBuilder) updates]) =
      _$InitializeCamera;
}

abstract class ToggleCameraFlash extends CameraEvent
    implements Built<ToggleCameraFlash, ToggleCameraFlashBuilder> {
  ToggleCameraFlash._();
  factory ToggleCameraFlash([void Function(ToggleCameraFlashBuilder) updates]) =
      _$ToggleCameraFlash;
}

abstract class SwitchCamera extends CameraEvent
    implements Built<SwitchCamera, SwitchCameraBuilder> {
  CameraLensDirection get targetLensDirection;
  SwitchCamera._();
  factory SwitchCamera([void Function(SwitchCameraBuilder) updates]) =
      _$SwitchCamera;
}

abstract class CaptureImage extends CameraEvent
    implements Built<CaptureImage, CaptureImageBuilder> {
  CaptureImage._();
  factory CaptureImage([void Function(CaptureImageBuilder) updates]) =
      _$CaptureImage;
}

abstract class ToggleDiagnostics extends CameraEvent
    implements Built<ToggleDiagnostics, ToggleDiagnosticsBuilder> {
  ToggleDiagnostics._();
  factory ToggleDiagnostics([void Function(ToggleDiagnosticsBuilder) updates]) =
      _$ToggleDiagnostics;
}
