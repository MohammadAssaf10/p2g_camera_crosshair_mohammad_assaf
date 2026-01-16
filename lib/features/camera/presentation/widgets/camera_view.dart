import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../bloc/camera_bloc.dart';
import '../bloc/camera_state.dart';
import 'camera_body_view.dart';
import 'camera_flash_button.dart';
import 'change_camera_lens_direction.dart';
import 'take_image_button.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CameraBloc, CameraState, (PermissionStatus?, bool)>(
      selector: (state) {
        return (state.cameraPermissionStatus, state.isCameraInitialized);
      },
      builder: (context, state) {
        return state.$1 == PermissionStatus.granted && state.$2 == true
            ? const Expanded(
                child: Stack(
                  children: [
                    CameraBodyView(),
                    CameraFlashButton(),
                    ChangeCameraLensDirection(),
                    TakeImageButton(),
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
