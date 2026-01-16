import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_weight_manager.dart';
import '../../../../generated/l10n.dart';
import '../bloc/camera_bloc.dart';
import '../bloc/camera_event.dart';
import '../bloc/camera_state.dart';

class CameraPermissionDeniedView extends StatefulWidget {
  const CameraPermissionDeniedView({super.key});

  @override
  State<CameraPermissionDeniedView> createState() =>
      _CameraPermissionDeniedViewState();
}

class _CameraPermissionDeniedViewState
    extends State<CameraPermissionDeniedView> {
  late final AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    super.initState();
    _lifecycleListener = AppLifecycleListener(
      onRestart: () {
        context.read<CameraBloc>().add(InitializeCamera());
      },
    );
  }

  @override
  void dispose() {
    _lifecycleListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CameraBloc, CameraState, PermissionStatus?>(
      selector: (state) {
        return state.cameraPermissionStatus;
      },
      builder: (context, cameraPermissionStatus) {
        return cameraPermissionStatus == PermissionStatus.denied ||
                cameraPermissionStatus == PermissionStatus.permanentlyDenied
            ? Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera_alt_rounded,
                        size: 80,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        S.of(context).cameraPermissionRequired,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeightManager.bold,
                          color: ColorsManager.customBlack,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          S.of(context).cameraPermissionMessage,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          openAppSettings();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.customBlack,
                        ),
                        child: SizedBox(
                          width: 150,
                          child: Text(
                            S.of(context).openSettings,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeightManager.medium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
