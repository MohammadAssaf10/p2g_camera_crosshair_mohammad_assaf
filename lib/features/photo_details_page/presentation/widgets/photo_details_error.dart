import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_weight_manager.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../generated/l10n.dart';
import '../bloc/photo_details_bloc.dart';
import '../bloc/photo_details_state.dart';
import 'retake_photo_button.dart';

class PhotoDetailsError extends StatelessWidget {
  const PhotoDetailsError({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PhotoDetailsBloc, PhotoDetailsState, BlocStatus>(
      selector: (state) => state.status,
      builder: (context, status) {
        return status == BlocStatus.failure
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 80,
                        color: ColorsManager.customLightGray.withValues(
                          alpha: 0.7,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        S.of(context).errorSavingImage,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeightManager.semiBold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        S.of(context).errorSavingImageMessage,
                        style: TextStyle(
                          color: ColorsManager.customLightGray.withValues(
                            alpha: 0.7,
                          ),
                          fontSize: 16,
                          fontWeight: FontWeightManager.regular,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      const RetakePhotoButton(),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
