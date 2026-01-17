import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/widgets/loader.dart';
import '../bloc/camera_bloc.dart';
import '../bloc/camera_state.dart';

class CameraLoader extends StatelessWidget {
  const CameraLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CameraBloc, CameraState, BlocStatus>(
      selector: (state) {
        return state.status;
      },
      builder: (context, status) {
        return status == BlocStatus.loading
            ? const Expanded(child: Loader())
            : const SizedBox.shrink();
      },
    );
  }
}
