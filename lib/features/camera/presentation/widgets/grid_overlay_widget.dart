import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_enums.dart';
import '../bloc/camera_bloc.dart';
import '../bloc/camera_state.dart';
import 'aim_dot.dart';
import 'crosshair.dart';
import 'rule_of_thirds_grid.dart';

class GridOverlayWidget extends StatelessWidget {
  const GridOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CameraBloc, CameraState, GridMode>(
      selector: (state) => state.gridMode,
      builder: (context, gridMode) {
        switch (gridMode) {
          case GridMode.crosshair:
            return const Crosshair();
          case GridMode.ruleOfThirds:
            return const RuleOfThirdsGrid();
          case GridMode.aimDot:
            return const AimDot();
        }
      },
    );
  }
}
