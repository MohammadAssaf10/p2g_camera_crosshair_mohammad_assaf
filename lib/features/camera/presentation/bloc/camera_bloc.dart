import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/camera_helper.dart';
import 'camera_event.dart';
import 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraController? cameraController;
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
          ResolutionPreset.high,
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
        await cameraController!.dispose();
        emit(state.rebuild((b) => b..isCameraInitialized = false));
        final List<CameraDescription> cameras = await availableCameras();
        final camera = cameras.firstWhere(
          (desc) => desc.lensDirection == event.targetLensDirection,
          orElse: () => cameras.first,
        );
        cameraController = CameraController(
          camera,
          ResolutionPreset.high,
          enableAudio: false,
        );
        await cameraController!.initialize();
        await cameraController!.setFlashMode(state.flashMode);
        emit(
          state.rebuild(
            (b) => b
              ..isCameraInitialized = cameraController!.value.isInitialized
              ..currentLensDirection = camera.lensDirection
              ..status = BlocStatus.success,
          ),
        );
      } catch (e) {
        debugPrint('Error switching camera: $e');
        emit(
          state.rebuild(
            (b) => b
              ..isCameraInitialized = false
              ..status = BlocStatus.failure,
          ),
        );
      }
    });
    on<CaptureImage>((event, emit) async {
      if (cameraController == null || !cameraController!.value.isInitialized) {
        return;
      }
      try {
        final XFile image = await cameraController!.takePicture();
        emit(
          state.rebuild(
            (b) => b
              ..capturedImage = File(image.path)
              ..showDiagnostics = false,
          ),
        );
        emit(state.rebuild((b) => b..capturedImage = null));
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
