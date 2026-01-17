import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../bloc/camera_bloc.dart';
import '../bloc/camera_event.dart';

class ChangeCameraLensDirection extends StatelessWidget {
  const ChangeCameraLensDirection({super.key});

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.orientationOf(context);
    return PositionedDirectional(
      top: orientation == Orientation.portrait ? null : 30,
      bottom: orientation == Orientation.portrait ? 70 : null,
      end: orientation == Orientation.portrait ? 30 : 70,
      child: IconButton(
        onPressed: () {
          final CameraLensDirection currentLensDirection = context
              .read<CameraBloc>()
              .state
              .currentLensDirection;
          final targetLensDirection =
              currentLensDirection == CameraLensDirection.back
              ? CameraLensDirection.front
              : CameraLensDirection.back;
          context.read<CameraBloc>().add(
            SwitchCamera((b) => b..targetLensDirection = targetLensDirection),
          );
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            ColorsManager.customBlack.withValues(alpha: 0.5),
          ),
        ),
        icon: const Icon(Icons.flip_camera_ios, color: Colors.white, size: 30),
      ),
    );
  }
}
