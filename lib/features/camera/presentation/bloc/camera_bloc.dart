import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/camera_helper.dart';
import 'camera_event.dart';
import 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraController? cameraController;
  final GlobalKey<State<StatefulWidget>> repaintBoundaryKey =
      GlobalKey<State<StatefulWidget>>();
  CameraBloc() : super(CameraState.initial()) {
    on<InitializeCamera>((event, emit) async {
      emit(state.rebuild((b) => b..status = BlocStatus.loading));
      final PermissionStatus cameraPermissionStatus =
          await CameraHelper.checkCameraPermissions();
      emit(
        state.rebuild(
          (b) => b..cameraPermissionStatus = cameraPermissionStatus,
        ),
      );
      if (!cameraPermissionStatus.isGranted) {
        emit(state.rebuild((b) => b..status = BlocStatus.failure));
        return;
      }
      try {
        final List<CameraDescription> cameras = await availableCameras();
        final camera = cameras.firstWhere(
          (desc) => desc.lensDirection == CameraLensDirection.back,
          orElse: () => cameras.first,
        );
        cameraController = CameraController(
          camera,
          ResolutionPreset.max,
          enableAudio: false,
        );
        await cameraController!.initialize();
        emit(
          state.rebuild(
            (b) => b
              ..isCameraInitialized = cameraController!.value.isInitialized
              ..currentLensDirection = camera.lensDirection
              ..status = BlocStatus.success,
          ),
        );
      } catch (e) {
        debugPrint('Error initializing camera: $e');
        emit(
          state.rebuild(
            (b) => b
              ..isCameraInitialized = false
              ..status = BlocStatus.failure,
          ),
        );
      }
    });
    on<ToggleCameraFlash>((event, emit) async {
      if (cameraController == null || !cameraController!.value.isInitialized) {
        return;
      }
      try {
        FlashMode newFlashMode;
        switch (state.flashMode) {
          case FlashMode.off:
            newFlashMode = FlashMode.auto;
            break;
          case FlashMode.auto:
            newFlashMode = FlashMode.always;
            break;
          case FlashMode.always:
            newFlashMode = FlashMode.off;
            break;
          default:
            newFlashMode = FlashMode.off;
        }
        await cameraController!.setFlashMode(newFlashMode);
        emit(
          state.rebuild(
            (b) => b
              ..flashMode = newFlashMode
              ..showDiagnostics = false,
          ),
        );
      } catch (e) {
        debugPrint('Error toggling flash: $e');
      }
    });
    on<SwitchCamera>((event, emit) async {
      if (cameraController == null) return;
      try {
        emit(
          state.rebuild(
            (b) => b
              ..status = BlocStatus.loading
              ..showDiagnostics = false,
          ),
        );
        final List<CameraDescription> cameras = await availableCameras();
        final camera = cameras.firstWhere(
          (desc) => desc.lensDirection == event.targetLensDirection,
          orElse: () => cameras.first,
        );
        await cameraController!.setDescription(camera);
        emit(
          state.rebuild(
            (b) => b
              ..currentLensDirection = camera.lensDirection
              ..status = BlocStatus.success,
          ),
        );
      } catch (e) {
        debugPrint('Error switching camera: $e');
        emit(state.rebuild((b) => b..status = BlocStatus.failure));
      }
    });
    on<CaptureImage>((event, emit) async {
      if (cameraController == null || !cameraController!.value.isInitialized) {
        return;
      }
      try {
        // Capture the widget with grid overlay
        final RenderRepaintBoundary? boundary =
            repaintBoundaryKey.currentContext?.findRenderObject()
                as RenderRepaintBoundary?;

        if (boundary != null) {
          final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
          final ByteData? byteData = await image.toByteData(
            format: ui.ImageByteFormat.png,
          );

          if (byteData != null) {
            final Uint8List pngBytes = byteData.buffer.asUint8List();

            // Save the image to a temporary file
            final Directory tempDir = await getTemporaryDirectory();
            final String filePath =
                '${tempDir.path}/camera_${DateTime.now().millisecondsSinceEpoch}.png';
            final File file = File(filePath);
            await file.writeAsBytes(pngBytes);

            emit(
              state.rebuild(
                (b) => b
                  ..capturedImage = file
                  ..showDiagnostics = false,
              ),
            );
            emit(state.rebuild((b) => b..capturedImage = null));
          }
        }
      } catch (e) {
        debugPrint('Error capturing image: $e');
      }
    });
    on<ToggleDiagnostics>((event, emit) {
      emit(state.rebuild((b) => b..showDiagnostics = !state.showDiagnostics));
    });
    on<ToggleGridMode>((event, emit) {
      GridMode newGridMode;
      switch (state.gridMode) {
        case GridMode.crosshair:
          newGridMode = GridMode.ruleOfThirds;
          break;
        case GridMode.ruleOfThirds:
          newGridMode = GridMode.aimDot;
          break;
        case GridMode.aimDot:
          newGridMode = GridMode.redCrosshair;
          break;
        case GridMode.redCrosshair:
          newGridMode = GridMode.crosshair;
          break;
      }
      emit(
        state.rebuild(
          (b) => b
            ..gridMode = newGridMode
            ..showDiagnostics = false,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    cameraController?.dispose();
    return super.close();
  }
}
