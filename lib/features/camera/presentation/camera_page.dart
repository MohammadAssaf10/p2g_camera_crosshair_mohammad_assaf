import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/camera_bloc.dart';
import 'bloc/camera_state.dart';
import 'widgets/camera_loader.dart';
import 'widgets/camera_permission_denied_view.dart';
import 'widgets/camera_view.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: BlocListener<CameraBloc, CameraState>(
        listener: (context, state) {
          if (state.capturedImage != null) {
            // TODO: Handle push photo details page
          }
        },
        child: const Column(
          children: [
            CameraLoader(),
            CameraPermissionDeniedView(),
            CameraView(),
          ],
        ),
      ),
    );
  }
}
