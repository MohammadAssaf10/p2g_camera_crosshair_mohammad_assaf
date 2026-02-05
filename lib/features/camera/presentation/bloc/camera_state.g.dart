// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CameraState extends CameraState {
  @override
  final BlocStatus status;
  @override
  final PermissionStatus? cameraPermissionStatus;
  @override
  final bool isCameraInitialized;
  @override
  final CameraLensDirection currentLensDirection;
  @override
  final File? capturedImage;
  @override
  final bool showDiagnostics;
  @override
  final GridMode gridMode;
  @override
  final bool isFlashLightOn;

  factory _$CameraState([void Function(CameraStateBuilder)? updates]) =>
      (CameraStateBuilder()..update(updates))._build();

  _$CameraState._({
    required this.status,
    this.cameraPermissionStatus,
    required this.isCameraInitialized,
    required this.currentLensDirection,
    this.capturedImage,
    required this.showDiagnostics,
    required this.gridMode,
    required this.isFlashLightOn,
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
        status == other.status &&
        cameraPermissionStatus == other.cameraPermissionStatus &&
        isCameraInitialized == other.isCameraInitialized &&
        currentLensDirection == other.currentLensDirection &&
        capturedImage == other.capturedImage &&
        showDiagnostics == other.showDiagnostics &&
        gridMode == other.gridMode &&
        isFlashLightOn == other.isFlashLightOn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, cameraPermissionStatus.hashCode);
    _$hash = $jc(_$hash, isCameraInitialized.hashCode);
    _$hash = $jc(_$hash, currentLensDirection.hashCode);
    _$hash = $jc(_$hash, capturedImage.hashCode);
    _$hash = $jc(_$hash, showDiagnostics.hashCode);
    _$hash = $jc(_$hash, gridMode.hashCode);
    _$hash = $jc(_$hash, isFlashLightOn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CameraState')
          ..add('status', status)
          ..add('cameraPermissionStatus', cameraPermissionStatus)
          ..add('isCameraInitialized', isCameraInitialized)
          ..add('currentLensDirection', currentLensDirection)
          ..add('capturedImage', capturedImage)
          ..add('showDiagnostics', showDiagnostics)
          ..add('gridMode', gridMode)
          ..add('isFlashLightOn', isFlashLightOn))
        .toString();
  }
}

class CameraStateBuilder implements Builder<CameraState, CameraStateBuilder> {
  _$CameraState? _$v;

  BlocStatus? _status;
  BlocStatus? get status => _$this._status;
  set status(BlocStatus? status) => _$this._status = status;

  PermissionStatus? _cameraPermissionStatus;
  PermissionStatus? get cameraPermissionStatus =>
      _$this._cameraPermissionStatus;
  set cameraPermissionStatus(PermissionStatus? cameraPermissionStatus) =>
      _$this._cameraPermissionStatus = cameraPermissionStatus;

  bool? _isCameraInitialized;
  bool? get isCameraInitialized => _$this._isCameraInitialized;
  set isCameraInitialized(bool? isCameraInitialized) =>
      _$this._isCameraInitialized = isCameraInitialized;

  CameraLensDirection? _currentLensDirection;
  CameraLensDirection? get currentLensDirection => _$this._currentLensDirection;
  set currentLensDirection(CameraLensDirection? currentLensDirection) =>
      _$this._currentLensDirection = currentLensDirection;

  File? _capturedImage;
  File? get capturedImage => _$this._capturedImage;
  set capturedImage(File? capturedImage) =>
      _$this._capturedImage = capturedImage;

  bool? _showDiagnostics;
  bool? get showDiagnostics => _$this._showDiagnostics;
  set showDiagnostics(bool? showDiagnostics) =>
      _$this._showDiagnostics = showDiagnostics;

  GridMode? _gridMode;
  GridMode? get gridMode => _$this._gridMode;
  set gridMode(GridMode? gridMode) => _$this._gridMode = gridMode;

  bool? _isFlashLightOn;
  bool? get isFlashLightOn => _$this._isFlashLightOn;
  set isFlashLightOn(bool? isFlashLightOn) =>
      _$this._isFlashLightOn = isFlashLightOn;

  CameraStateBuilder();

  CameraStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _cameraPermissionStatus = $v.cameraPermissionStatus;
      _isCameraInitialized = $v.isCameraInitialized;
      _currentLensDirection = $v.currentLensDirection;
      _capturedImage = $v.capturedImage;
      _showDiagnostics = $v.showDiagnostics;
      _gridMode = $v.gridMode;
      _isFlashLightOn = $v.isFlashLightOn;
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
          status: BuiltValueNullFieldError.checkNotNull(
            status,
            r'CameraState',
            'status',
          ),
          cameraPermissionStatus: cameraPermissionStatus,
          isCameraInitialized: BuiltValueNullFieldError.checkNotNull(
            isCameraInitialized,
            r'CameraState',
            'isCameraInitialized',
          ),
          currentLensDirection: BuiltValueNullFieldError.checkNotNull(
            currentLensDirection,
            r'CameraState',
            'currentLensDirection',
          ),
          capturedImage: capturedImage,
          showDiagnostics: BuiltValueNullFieldError.checkNotNull(
            showDiagnostics,
            r'CameraState',
            'showDiagnostics',
          ),
          gridMode: BuiltValueNullFieldError.checkNotNull(
            gridMode,
            r'CameraState',
            'gridMode',
          ),
          isFlashLightOn: BuiltValueNullFieldError.checkNotNull(
            isFlashLightOn,
            r'CameraState',
            'isFlashLightOn',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
