// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CameraState extends CameraState {
  @override
  final PermissionStatus? cameraPermissionStatus;
  @override
  final bool isCameraInitialized;
  @override
  final FlashMode flashMode;
  @override
  final CameraLensDirection currentLensDirection;
  @override
  final File? capturedImage;

  factory _$CameraState([void Function(CameraStateBuilder)? updates]) =>
      (CameraStateBuilder()..update(updates))._build();

  _$CameraState._({
    this.cameraPermissionStatus,
    required this.isCameraInitialized,
    required this.flashMode,
    required this.currentLensDirection,
    this.capturedImage,
  }) : super._();
  @override
  CameraState rebuild(void Function(CameraStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CameraStateBuilder toBuilder() => CameraStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CameraState &&
        cameraPermissionStatus == other.cameraPermissionStatus &&
        isCameraInitialized == other.isCameraInitialized &&
        flashMode == other.flashMode &&
        currentLensDirection == other.currentLensDirection &&
        capturedImage == other.capturedImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cameraPermissionStatus.hashCode);
    _$hash = $jc(_$hash, isCameraInitialized.hashCode);
    _$hash = $jc(_$hash, flashMode.hashCode);
    _$hash = $jc(_$hash, currentLensDirection.hashCode);
    _$hash = $jc(_$hash, capturedImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CameraState')
          ..add('cameraPermissionStatus', cameraPermissionStatus)
          ..add('isCameraInitialized', isCameraInitialized)
          ..add('flashMode', flashMode)
          ..add('currentLensDirection', currentLensDirection)
          ..add('capturedImage', capturedImage))
        .toString();
  }
}

class CameraStateBuilder implements Builder<CameraState, CameraStateBuilder> {
  _$CameraState? _$v;

  PermissionStatus? _cameraPermissionStatus;
  PermissionStatus? get cameraPermissionStatus =>
      _$this._cameraPermissionStatus;
  set cameraPermissionStatus(PermissionStatus? cameraPermissionStatus) =>
      _$this._cameraPermissionStatus = cameraPermissionStatus;

  bool? _isCameraInitialized;
  bool? get isCameraInitialized => _$this._isCameraInitialized;
  set isCameraInitialized(bool? isCameraInitialized) =>
      _$this._isCameraInitialized = isCameraInitialized;

  FlashMode? _flashMode;
  FlashMode? get flashMode => _$this._flashMode;
  set flashMode(FlashMode? flashMode) => _$this._flashMode = flashMode;

  CameraLensDirection? _currentLensDirection;
  CameraLensDirection? get currentLensDirection => _$this._currentLensDirection;
  set currentLensDirection(CameraLensDirection? currentLensDirection) =>
      _$this._currentLensDirection = currentLensDirection;

  File? _capturedImage;
  File? get capturedImage => _$this._capturedImage;
  set capturedImage(File? capturedImage) =>
      _$this._capturedImage = capturedImage;

  CameraStateBuilder();

  CameraStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cameraPermissionStatus = $v.cameraPermissionStatus;
      _isCameraInitialized = $v.isCameraInitialized;
      _flashMode = $v.flashMode;
      _currentLensDirection = $v.currentLensDirection;
      _capturedImage = $v.capturedImage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CameraState other) {
    _$v = other as _$CameraState;
  }

  @override
  void update(void Function(CameraStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CameraState build() => _build();

  _$CameraState _build() {
    final _$result =
        _$v ??
        _$CameraState._(
          cameraPermissionStatus: cameraPermissionStatus,
          isCameraInitialized: BuiltValueNullFieldError.checkNotNull(
            isCameraInitialized,
            r'CameraState',
            'isCameraInitialized',
          ),
          flashMode: BuiltValueNullFieldError.checkNotNull(
            flashMode,
            r'CameraState',
            'flashMode',
          ),
          currentLensDirection: BuiltValueNullFieldError.checkNotNull(
            currentLensDirection,
            r'CameraState',
            'currentLensDirection',
          ),
          capturedImage: capturedImage,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
