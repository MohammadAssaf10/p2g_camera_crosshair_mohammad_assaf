import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../generated/l10n.dart';
import '../bloc/camera_bloc.dart';
import '../bloc/camera_event.dart';
import '../bloc/camera_state.dart';

class DiagnosticsButton extends StatelessWidget {
  const DiagnosticsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.orientationOf(context);
    return PositionedDirectional(
      top: orientation == Orientation.portrait ? 50 : null,
      bottom: orientation == Orientation.portrait ? null : 30,
      end: orientation == Orientation.portrait ? 20 : null,
      start: orientation == Orientation.portrait ? null : 20,
      child: BlocSelector<CameraBloc, CameraState, bool>(
        selector: (state) => state.showDiagnostics,
        builder: (context, showDiagnostics) {
          return IconButton(
            onPressed: () {
              context.read<CameraBloc>().add(ToggleDiagnostics());
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                showDiagnostics
                    ? ColorsManager.customGreen.withValues(alpha: 0.5)
                    : ColorsManager.customBlack.withValues(alpha: 0.5),
              ),
            ),
            icon: const Icon(Icons.info_outline, color: Colors.white, size: 30),
            tooltip: S.of(context).toggleDiagnostics,
          );
        },
      ),
    );
  }
}
