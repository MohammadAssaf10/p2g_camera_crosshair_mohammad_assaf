import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../generated/l10n.dart';
import '../bloc/camera_bloc.dart';
import '../bloc/camera_state.dart';

class DiagnosticsPanel extends StatelessWidget {
  const DiagnosticsPanel({super.key});

  String _getOrientationText(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait ? 'Portrait' : 'Landscape';
  }

  String _getDeviceOrientationText(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    // Determine device orientation based on dimensions
    if (size.width > size.height) {
      return 'Landscape';
    } else {
      return 'Portrait';
    }
  }

  @override
  Widget build(BuildContext context) {
    final CameraController cameraController = context
        .read<CameraBloc>()
        .cameraController!;

    final CameraValue cameraValue = cameraController.value;
    final Size size = MediaQuery.sizeOf(context);
    // Calculate preview aspect ratio
    final double previewAspectRatio = cameraValue.aspectRatio;
    final double displayAspectRatio =
        size.aspectRatio * cameraValue.aspectRatio;
    // Get sensor orientation
    final int sensorOrientation =
        cameraController.description.sensorOrientation;
    final Orientation orientation = MediaQuery.orientationOf(context);
    return PositionedDirectional(
      top: orientation == Orientation.portrait ? 85 : null,
      bottom: orientation == Orientation.portrait ? null : 65,
      end: orientation == Orientation.portrait ? 65 : null,
      start: orientation == Orientation.portrait ? null : 65,
      child: BlocSelector<CameraBloc, CameraState, (bool, CameraLensDirection)>(
        selector: (state) =>
            (state.showDiagnostics, state.currentLensDirection),
        builder: (context, state) {
          if (!state.$1) {
            return const SizedBox.shrink();
          }
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorsManager.customBlack.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ColorsManager.customLightGray.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      S.of(context).diagnostics,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.white24, height: 1),
                const SizedBox(height: 8),
                _buildInfoRow(
                  'Device Orientation',
                  _getDeviceOrientationText(context),
                ),
                _buildInfoRow(
                  'Screen Orientation',
                  _getOrientationText(context),
                ),
                _buildInfoRow(
                  'Preview Aspect Ratio',
                  '${previewAspectRatio.toStringAsFixed(2)} (${(1 / previewAspectRatio).toStringAsFixed(2)})',
                ),
                _buildInfoRow(
                  'Display Aspect Ratio',
                  displayAspectRatio.toStringAsFixed(2),
                ),
                _buildInfoRow(
                  'Camera Sensor Orientation',
                  '$sensorOrientation°',
                ),
                _buildInfoRow(
                  'Lens Direction',
                  state.$2.toString().split('.').last,
                ),
                _buildInfoRow(
                  'Screen Size',
                  '${size.width.toStringAsFixed(0)} x ${size.height.toStringAsFixed(0)}',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
