import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/theming/colors_manager.dart';
import '../bloc/camera_bloc.dart';
import '../bloc/camera_state.dart';

class CameraLoader extends StatelessWidget {
  const CameraLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CameraBloc, CameraState, (PermissionStatus?, bool)>(
      selector: (state) {
        return (state.cameraPermissionStatus, state.isCameraInitialized);
      },
      builder: (context, state) {
        return state.$1 == null && !state.$2
            ? const Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.customGreen,
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
