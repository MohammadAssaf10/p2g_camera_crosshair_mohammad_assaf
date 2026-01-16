import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/widgets/loader.dart';
import '../bloc/photo_details_bloc.dart';
import '../bloc/photo_details_state.dart';

class PhotoDetailsLoader extends StatelessWidget {
  const PhotoDetailsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PhotoDetailsBloc, PhotoDetailsState, BlocStatus>(
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
