import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/file_helper.dart';
import '../../data/models/image_metadata.dart';
import 'photo_details_event.dart';
import 'photo_details_state.dart';

class PhotoDetailsBloc extends Bloc<PhotoDetailsEvent, PhotoDetailsState> {
  PhotoDetailsBloc() : super(PhotoDetailsState.initial()) {
    on<SaveImage>((event, emit) async {
      emit(state.rebuild((b) => b..status = BlocStatus.loading));
      final File? savedImage = await FileHelper.downloadFile(event.image);
      if (savedImage == null) {
        emit(state.rebuild((b) => b..status = BlocStatus.failure));
        return;
      }

      final ImageMetadata? imageMetadata =
          await FileHelper.extractImageMetadata(savedImage);

      if (imageMetadata == null) {
        emit(state.rebuild((b) => b..status = BlocStatus.failure));
        return;
      }

      emit(
        state.rebuild(
          (b) => b
            ..status = BlocStatus.success
            ..imageMetadata = imageMetadata,
        ),
      );
    });
  }
}
