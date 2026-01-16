import 'package:built_value/built_value.dart';

import '../../../../core/utils/app_enums.dart';
import '../../data/models/image_metadata.dart';

part 'photo_details_state.g.dart';

abstract class PhotoDetailsState
    implements Built<PhotoDetailsState, PhotoDetailsStateBuilder> {
  BlocStatus get status;
  ImageMetadata? get imageMetadata;
  PhotoDetailsState._();
  factory PhotoDetailsState([void Function(PhotoDetailsStateBuilder) updates]) =
      _$PhotoDetailsState;

  factory PhotoDetailsState.initial() => PhotoDetailsState(
    (b) => b
      ..status = BlocStatus.initial
      ..imageMetadata = null,
  );
}
