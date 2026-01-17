import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../bloc/camera_bloc.dart';
import '../bloc/camera_event.dart';

class TakeImageButton extends StatelessWidget {
  const TakeImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.orientationOf(context);
    return PositionedDirectional(
      top: orientation == Orientation.portrait ? null : 0,
      bottom: orientation == Orientation.portrait ? 40 : 0,
      start: orientation == Orientation.portrait ? 0 : null,
      end: orientation == Orientation.portrait ? 0 : 40,
      child: GestureDetector(
        onTap: () {
          context.read<CameraBloc>().add(CaptureImage());
        },
        child: Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorsManager.customGray, width: 5),
          ),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManager.customGreen.withValues(alpha: 0.4),
                  width: 2.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
