import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_enums.dart';
import '../bloc/camera_bloc.dart';
import '../bloc/camera_state.dart';
import 'camera_body_view.dart';
import 'camera_flash_button.dart';
import 'change_camera_lens_direction.dart';
import 'diagnostics_button.dart';
import 'diagnostics_panel.dart';
import 'grid_mode_button.dart';
import 'grid_overlay_widget.dart';
import 'take_image_button.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CameraBloc, CameraState, BlocStatus>(
      selector: (state) {
        return state.status;
      },
      builder: (context, status) {
        return status == BlocStatus.success
            ? const Expanded(
                child: Stack(
                  children: [
                    CameraBodyView(),
                    GridOverlayWidget(),
                    CameraFlashButton(),
                    ChangeCameraLensDirection(),
                    TakeImageButton(),
                    GridModeButton(),
                    DiagnosticsButton(),
                    DiagnosticsPanel(),
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
