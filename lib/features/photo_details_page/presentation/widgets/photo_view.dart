import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_weight_manager.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/image_metadata.dart';
import '../bloc/photo_details_bloc.dart';
import '../bloc/photo_details_state.dart';
import 'image_info_card.dart';
import 'image_info_row.dart';
import 'retake_photo_button.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({super.key});

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  String _formatTimestamp(DateTime timestamp) {
    final DateFormat dateFormat = DateFormat('MMM dd, yyyy - hh:mm a');
    return dateFormat.format(timestamp);
  }

  String _getOrientationDescription(BuildContext context, String orientation) {
    switch (orientation) {
      case '1':
        return S.of(context).orientationUp;
      case '3':
        return S.of(context).orientationDown;
      case '6':
        return S.of(context).orientationRight;
      case '8':
        return S.of(context).orientationLeft;
      case '2':
        return S.of(context).orientationUpMirrored;
      case '4':
        return S.of(context).orientationDownMirrored;
      case '5':
        return S.of(context).orientationLeftMirrored;
      case '7':
        return S.of(context).orientationRightMirrored;
      default:
        return S.of(context).orientationUp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PhotoDetailsBloc, PhotoDetailsState, ImageMetadata?>(
      selector: (state) => state.imageMetadata,
      builder: (context, imageMetadata) {
        return imageMetadata != null
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: ColorsManager.customGray),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              imageMetadata.file,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                S.of(context).imageMetadata,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeightManager.bold,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.info_outline_rounded,
                              color: ColorsManager.customGreen,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: ImageInfoCard(
                                icon: Icons.photo_size_select_actual_outlined,
                                title: S.of(context).resolution,
                                value:
                                    '${imageMetadata.width} × ${imageMetadata.height}',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ImageInfoCard(
                                icon: Icons.storage_outlined,
                                title: S.of(context).fileSize,
                                value: _formatFileSize(
                                  imageMetadata.fileSizeInBytes,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ImageInfoCard(
                          icon: Icons.folder_outlined,
                          title: S.of(context).storagePath,
                          value: imageMetadata.storagePath,
                          valueTextStyle: const TextStyle(
                            color: ColorsManager.customLightGray,
                            fontSize: 16,
                            fontWeight: FontWeightManager.medium,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ImageInfoRow(
                                icon: Icons.access_time_outlined,
                                title: S.of(context).timestamp,
                                value: _formatTimestamp(
                                  imageMetadata.timestamp,
                                ),
                              ),
                              if (imageMetadata.exifOrientation != null) ...[
                                const Divider(
                                  height: 24,
                                  color: ColorsManager.customGray,
                                ),
                                ImageInfoRow(
                                  icon: Icons.screen_rotation_outlined,
                                  title: S.of(context).exifOrientation,
                                  value: _getOrientationDescription(
                                    context,
                                    imageMetadata.exifOrientation!,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        const Divider(
                          height: 48,
                          color: ColorsManager.customGray,
                        ),
                        const RetakePhotoButton(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
