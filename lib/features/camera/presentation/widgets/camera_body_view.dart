import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/camera_bloc.dart';

class CameraBodyView extends StatelessWidget {
  const CameraBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final CameraController cameraController = context
        .read<CameraBloc>()
        .cameraController!;

    return Positioned.fill(
      child: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            cameraController.lockCaptureOrientation(
              orientation == Orientation.portrait
                  ? DeviceOrientation.portraitUp
                  : DeviceOrientation.landscapeLeft,
            );

            // Recalculate scale based on current orientation
            final CameraValue camera = cameraController.value;
            final Size size = MediaQuery.sizeOf(context);

            // Calculate scale depending on screen and camera ratios
            // Camera preview size is received as landscape (width > height)
            // For portrait: size.aspectRatio is height/width (< 1)
            // For landscape: size.aspectRatio is width/height (> 1)
            double scale;

            if (orientation == Orientation.portrait) {
              // In portrait mode: multiply screen aspect ratio by camera aspect ratio
              scale = size.aspectRatio * camera.aspectRatio;
            } else {
              // In landscape mode: divide screen aspect ratio by camera aspect ratio
              scale = size.aspectRatio / camera.aspectRatio;
            }

            // To prevent scaling down, invert the value if needed
            if (scale < 1) scale = 1 / scale;

            if (kDebugMode) {
              debugPrint('Orientation: $orientation, Scale: $scale');
            }

            return Transform.scale(
              scale: scale,
              child: CameraPreview(cameraController),
            );
          },
        ),
      ),
    );
  }
}
