import 'package:camera/camera.dart';
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
    CameraValue camera = cameraController.value;
    // fetch screen size
    final size = MediaQuery.sizeOf(context);

    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    double scale = size.aspectRatio * camera.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;
    return Positioned.fill(
      child: Transform.scale(
        scale: scale,
        child: Center(
          child: OrientationBuilder(
            builder: (context, orientation) {
              cameraController.lockCaptureOrientation(
                orientation == Orientation.portrait
                    ? DeviceOrientation.portraitUp
                    : DeviceOrientation.landscapeLeft,
              );
              return CameraPreview(cameraController);
            },
          ),
        ),
      ),
    );
  }
}
