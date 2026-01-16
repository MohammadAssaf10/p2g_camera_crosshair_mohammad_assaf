// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_details_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PhotoDetailsState extends PhotoDetailsState {
  @override
  final BlocStatus status;
  @override
  final ImageMetadata? imageMetadata;

  factory _$PhotoDetailsState([
    void Function(PhotoDetailsStateBuilder)? updates,
  ]) => (PhotoDetailsStateBuilder()..update(updates))._build();

  _$PhotoDetailsState._({required this.status, this.imageMetadata}) : super._();
  @override
  PhotoDetailsState rebuild(void Function(PhotoDetailsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhotoDetailsStateBuilder toBuilder() =>
      PhotoDetailsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhotoDetailsState &&
        status == other.status &&
        imageMetadata == other.imageMetadata;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, imageMetadata.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PhotoDetailsState')
          ..add('status', status)
          ..add('imageMetadata', imageMetadata))
        .toString();
  }
}

class PhotoDetailsStateBuilder
    implements Builder<PhotoDetailsState, PhotoDetailsStateBuilder> {
  _$PhotoDetailsState? _$v;

  BlocStatus? _status;
  BlocStatus? get status => _$this._status;
  set status(BlocStatus? status) => _$this._status = status;

  ImageMetadata? _imageMetadata;
  ImageMetadata? get imageMetadata => _$this._imageMetadata;
  set imageMetadata(ImageMetadata? imageMetadata) =>
      _$this._imageMetadata = imageMetadata;

  PhotoDetailsStateBuilder();

  PhotoDetailsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _imageMetadata = $v.imageMetadata;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhotoDetailsState other) {
    _$v = other as _$PhotoDetailsState;
  }

  @override
  void update(void Function(PhotoDetailsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhotoDetailsState build() => _build();

  _$PhotoDetailsState _build() {
    final _$result =
        _$v ??
        _$PhotoDetailsState._(
          status: BuiltValueNullFieldError.checkNotNull(
            status,
            r'PhotoDetailsState',
            'status',
          ),
          imageMetadata: imageMetadata,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
