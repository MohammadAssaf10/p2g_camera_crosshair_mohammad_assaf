// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitializeCamera extends InitializeCamera {
  factory _$InitializeCamera([
    void Function(InitializeCameraBuilder)? updates,
  ]) => (InitializeCameraBuilder()..update(updates))._build();

  _$InitializeCamera._() : super._();
  @override
  InitializeCamera rebuild(void Function(InitializeCameraBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitializeCameraBuilder toBuilder() =>
      InitializeCameraBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitializeCamera;
  }

  @override
  int get hashCode {
    return 258805199;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'InitializeCamera').toString();
  }
}

class InitializeCameraBuilder
    implements Builder<InitializeCamera, InitializeCameraBuilder> {
  _$InitializeCamera? _$v;

  InitializeCameraBuilder();

  @override
  void replace(InitializeCamera other) {
    _$v = other as _$InitializeCamera;
  }

  @override
  void update(void Function(InitializeCameraBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitializeCamera build() => _build();

  _$InitializeCamera _build() {
    final _$result = _$v ?? _$InitializeCamera._();
    replace(_$result);
    return _$result;
  }
}

class _$ToggleCameraFlash extends ToggleCameraFlash {
  factory _$ToggleCameraFlash([
    void Function(ToggleCameraFlashBuilder)? updates,
  ]) => (ToggleCameraFlashBuilder()..update(updates))._build();

  _$ToggleCameraFlash._() : super._();
  @override
  ToggleCameraFlash rebuild(void Function(ToggleCameraFlashBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToggleCameraFlashBuilder toBuilder() =>
      ToggleCameraFlashBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ToggleCameraFlash;
  }

  @override
  int get hashCode {
    return 951696399;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ToggleCameraFlash').toString();
  }
}

class ToggleCameraFlashBuilder
    implements Builder<ToggleCameraFlash, ToggleCameraFlashBuilder> {
  _$ToggleCameraFlash? _$v;

  ToggleCameraFlashBuilder();

  @override
  void replace(ToggleCameraFlash other) {
    _$v = other as _$ToggleCameraFlash;
  }

  @override
  void update(void Function(ToggleCameraFlashBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ToggleCameraFlash build() => _build();

  _$ToggleCameraFlash _build() {
    final _$result = _$v ?? _$ToggleCameraFlash._();
    replace(_$result);
    return _$result;
  }
}

class _$SwitchCamera extends SwitchCamera {
  @override
  final CameraLensDirection targetLensDirection;

  factory _$SwitchCamera([void Function(SwitchCameraBuilder)? updates]) =>
      (SwitchCameraBuilder()..update(updates))._build();

  _$SwitchCamera._({required this.targetLensDirection}) : super._();
  @override
  SwitchCamera rebuild(void Function(SwitchCameraBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SwitchCameraBuilder toBuilder() => SwitchCameraBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SwitchCamera &&
        targetLensDirection == other.targetLensDirection;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, targetLensDirection.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'SwitchCamera',
    )..add('targetLensDirection', targetLensDirection)).toString();
  }
}

class SwitchCameraBuilder
    implements Builder<SwitchCamera, SwitchCameraBuilder> {
  _$SwitchCamera? _$v;

  CameraLensDirection? _targetLensDirection;
  CameraLensDirection? get targetLensDirection => _$this._targetLensDirection;
  set targetLensDirection(CameraLensDirection? targetLensDirection) =>
      _$this._targetLensDirection = targetLensDirection;

  SwitchCameraBuilder();

  SwitchCameraBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _targetLensDirection = $v.targetLensDirection;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SwitchCamera other) {
    _$v = other as _$SwitchCamera;
  }

  @override
  void update(void Function(SwitchCameraBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SwitchCamera build() => _build();

  _$SwitchCamera _build() {
    final _$result =
        _$v ??
        _$SwitchCamera._(
          targetLensDirection: BuiltValueNullFieldError.checkNotNull(
            targetLensDirection,
            r'SwitchCamera',
            'targetLensDirection',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$CaptureImage extends CaptureImage {
  factory _$CaptureImage([void Function(CaptureImageBuilder)? updates]) =>
      (CaptureImageBuilder()..update(updates))._build();

  _$CaptureImage._() : super._();
  @override
  CaptureImage rebuild(void Function(CaptureImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CaptureImageBuilder toBuilder() => CaptureImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CaptureImage;
  }

  @override
  int get hashCode {
    return 61273539;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'CaptureImage').toString();
  }
}

class CaptureImageBuilder
    implements Builder<CaptureImage, CaptureImageBuilder> {
  _$CaptureImage? _$v;

  CaptureImageBuilder();

  @override
  void replace(CaptureImage other) {
    _$v = other as _$CaptureImage;
  }

  @override
  void update(void Function(CaptureImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CaptureImage build() => _build();

  _$CaptureImage _build() {
    final _$result = _$v ?? _$CaptureImage._();
    replace(_$result);
    return _$result;
  }
}

class _$ToggleDiagnostics extends ToggleDiagnostics {
  factory _$ToggleDiagnostics([
    void Function(ToggleDiagnosticsBuilder)? updates,
  ]) => (ToggleDiagnosticsBuilder()..update(updates))._build();

  _$ToggleDiagnostics._() : super._();
  @override
  ToggleDiagnostics rebuild(void Function(ToggleDiagnosticsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToggleDiagnosticsBuilder toBuilder() =>
      ToggleDiagnosticsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ToggleDiagnostics;
  }

  @override
  int get hashCode {
    return 138708899;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ToggleDiagnostics').toString();
  }
}

class ToggleDiagnosticsBuilder
    implements Builder<ToggleDiagnostics, ToggleDiagnosticsBuilder> {
  _$ToggleDiagnostics? _$v;

  ToggleDiagnosticsBuilder();

  @override
  void replace(ToggleDiagnostics other) {
    _$v = other as _$ToggleDiagnostics;
  }

  @override
  void update(void Function(ToggleDiagnosticsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ToggleDiagnostics build() => _build();

  _$ToggleDiagnostics _build() {
    final _$result = _$v ?? _$ToggleDiagnostics._();
    replace(_$result);
    return _$result;
  }
}

class _$ToggleGridMode extends ToggleGridMode {
  factory _$ToggleGridMode([void Function(ToggleGridModeBuilder)? updates]) =>
      (ToggleGridModeBuilder()..update(updates))._build();

  _$ToggleGridMode._() : super._();
  @override
  ToggleGridMode rebuild(void Function(ToggleGridModeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToggleGridModeBuilder toBuilder() => ToggleGridModeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ToggleGridMode;
  }

  @override
  int get hashCode {
    return 245734147;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ToggleGridMode').toString();
  }
}

class ToggleGridModeBuilder
    implements Builder<ToggleGridMode, ToggleGridModeBuilder> {
  _$ToggleGridMode? _$v;

  ToggleGridModeBuilder();

  @override
  void replace(ToggleGridMode other) {
    _$v = other as _$ToggleGridMode;
  }

  @override
  void update(void Function(ToggleGridModeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ToggleGridMode build() => _build();

  _$ToggleGridMode _build() {
    final _$result = _$v ?? _$ToggleGridMode._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
