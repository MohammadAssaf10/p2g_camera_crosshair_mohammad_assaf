// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_details_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SaveImage extends SaveImage {
  @override
  final File image;

  factory _$SaveImage([void Function(SaveImageBuilder)? updates]) =>
      (SaveImageBuilder()..update(updates))._build();

  _$SaveImage._({required this.image}) : super._();
  @override
  SaveImage rebuild(void Function(SaveImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SaveImageBuilder toBuilder() => SaveImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaveImage && image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'SaveImage',
    )..add('image', image)).toString();
  }
}

class SaveImageBuilder implements Builder<SaveImage, SaveImageBuilder> {
  _$SaveImage? _$v;

  File? _image;
  File? get image => _$this._image;
  set image(File? image) => _$this._image = image;

  SaveImageBuilder();

  SaveImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SaveImage other) {
    _$v = other as _$SaveImage;
  }

  @override
  void update(void Function(SaveImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SaveImage build() => _build();

  _$SaveImage _build() {
    final _$result =
        _$v ??
        _$SaveImage._(
          image: BuiltValueNullFieldError.checkNotNull(
            image,
            r'SaveImage',
            'image',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
