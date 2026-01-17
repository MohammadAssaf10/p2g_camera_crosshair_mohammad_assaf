import 'dart:io';

import 'package:built_value/built_value.dart';

part 'photo_details_event.g.dart';

abstract class PhotoDetailsEvent {}

abstract class SaveImage extends PhotoDetailsEvent
    implements Built<SaveImage, SaveImageBuilder> {
  File get image;
  SaveImage._();
  factory SaveImage([void Function(SaveImageBuilder) updates]) = _$SaveImage;
}
