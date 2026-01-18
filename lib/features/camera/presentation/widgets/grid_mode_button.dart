import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_enums.dart';
import '../bloc/camera_bloc.dart';
import '../bloc/camera_event.dart';
import '../bloc/camera_state.dart';

class GridModeButton extends StatelessWidget {
  const GridModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.orientationOf(context);
    return PositionedDirectional(
      top: orientation == Orientation.portrait ? null : null,
      bottom: orientation == Orientation.portrait ? 70 : 30,
      start: orientation == Orientation.portrait ? 30 : null,
      end: orientation == Orientation.portrait ? null : 70,
      child: IconButton(
        onPressed: () {
          context.read<CameraBloc>().add(ToggleGridMode());
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            ColorsManager.customBlack.withValues(alpha: 0.5),
          ),
        ),
        icon: BlocSelector<CameraBloc, CameraState, GridMode>(
          selector: (state) => state.gridMode,
          builder: (context, gridMode) {
            return Icon(
              _getIconForGridMode(gridMode),
              color: gridMode == GridMode.aimDot ? Colors.red : Colors.white,
              size: 30,
            );
          },
        ),
      ),
    );
  }

  IconData _getIconForGridMode(GridMode mode) {
    switch (mode) {
      case GridMode.crosshair:
        return Icons.grid_on;
      case GridMode.ruleOfThirds:
        return Icons.circle_outlined;
      case GridMode.aimDot:
      case GridMode.redCrosshair:
        return Icons.add_rounded;
    }
  }
}
