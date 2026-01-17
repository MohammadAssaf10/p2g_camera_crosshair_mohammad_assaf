import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../bloc/camera_bloc.dart';
import '../bloc/camera_event.dart';
import '../bloc/camera_state.dart';

class CameraFlashButton extends StatelessWidget {
  const CameraFlashButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.orientationOf(context);
    return PositionedDirectional(
      top: orientation == Orientation.portrait ? 50 : 30,
      start: 20,
      child: IconButton(
        onPressed: () {
          context.read<CameraBloc>().add(ToggleCameraFlash());
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            ColorsManager.customBlack.withValues(alpha: 0.5),
          ),
        ),
        icon: BlocSelector<CameraBloc, CameraState, FlashMode>(
          selector: (state) {
            return state.flashMode;
          },
          builder: (context, flashMode) {
            return Icon(
              _getFlashIcon(flashMode),
              color: Colors.white,
              size: 30,
            );
          },
        ),
      ),
    );
  }

  IconData _getFlashIcon(FlashMode flashMode) {
    switch (flashMode) {
      case FlashMode.off:
        return Icons.flash_off;
      case FlashMode.auto:
        return Icons.flash_auto;
      case FlashMode.always:
        return Icons.flash_on;
      default:
        return Icons.flash_off;
    }
  }
}
