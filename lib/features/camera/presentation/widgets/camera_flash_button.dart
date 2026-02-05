import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../generated/l10n.dart';
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
      child: BlocSelector<CameraBloc, CameraState, bool>(
        selector: (state) {
          return state.isFlashLightOn;
        },
        builder: (context, isFlashLightOn) {
          return IconButton(
            onPressed: () {
              context.read<CameraBloc>().add(ToggleFlashLight());
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                isFlashLightOn
                    ? ColorsManager.customGreen.withValues(alpha: 0.5)
                    : ColorsManager.customBlack.withValues(alpha: 0.5),
              ),
            ),
            icon: Icon(
              _getFlashIcon(isFlashLightOn),
              color: Colors.white,
              size: 30,
            ),
            tooltip: S.of(context).toggleFlashLight,
          );
        },
      ),
    );
  }

  IconData _getFlashIcon(bool isFlashLightOn) {
    if (isFlashLightOn) {
      return Icons.flash_on_rounded;
    }
    return Icons.flash_off_rounded;
  }
}
