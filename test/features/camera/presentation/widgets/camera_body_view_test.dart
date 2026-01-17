import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p2g_camera_crosshair_mohammad_assaf/features/camera/presentation/bloc/camera_bloc.dart';
import 'package:p2g_camera_crosshair_mohammad_assaf/features/camera/presentation/widgets/camera_body_view.dart';
import 'package:p2g_camera_crosshair_mohammad_assaf/features/camera/presentation/widgets/grid_overlay_widget.dart';

class MockCameraBloc extends CameraBloc {
  final CameraController controller;

  MockCameraBloc(this.controller);

  @override
  CameraController? get cameraController => controller;
}

class MockCameraController extends CameraController {
  final CameraDescription _cameraDescription;

  MockCameraController({
    CameraLensDirection lensDirection = CameraLensDirection.back,
  }) : _cameraDescription = CameraDescription(
         name: lensDirection == CameraLensDirection.back
             ? 'mock_back_camera'
             : 'mock_front_camera',
         lensDirection: lensDirection,
         sensorOrientation: 0,
       ),
       super(
         CameraDescription(
           name: lensDirection == CameraLensDirection.back
               ? 'mock_back_camera'
               : 'mock_front_camera',
           lensDirection: lensDirection,
           sensorOrientation: 0,
         ),
         ResolutionPreset.high,
       );

  @override
  CameraValue get value => CameraValue(
    isInitialized: true,
    previewSize: const Size(1920, 1080),
    isRecordingVideo: false,
    isTakingPicture: false,
    isStreamingImages: false,
    isRecordingPaused: false,
    flashMode: FlashMode.off,
    exposureMode: ExposureMode.auto,
    focusMode: FocusMode.auto,
    exposurePointSupported: false,
    focusPointSupported: false,
    deviceOrientation: DeviceOrientation.portraitUp,
    description: _cameraDescription,
  );

  @override
  Future<void> initialize() async {
    // Mock initialization
  }
}

void main() {
  group('CameraBodyView Tests', () {
    late MockCameraController mockCameraController;

    setUp(() {
      mockCameraController = MockCameraController();
    });

    testWidgets(
      'GridOverlayWidget is always displayed over camera in portrait mode',
      (WidgetTester tester) async {
        // Arrange
        final mockBloc = MockCameraBloc(mockCameraController);

        // Set portrait size
        tester.view.physicalSize = const Size(1080, 1920);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider<CameraBloc>.value(
                value: mockBloc,
                child: const Stack(children: [CameraBodyView()]),
              ),
            ),
          ),
        );

        // Assert
        expect(find.byType(GridOverlayWidget), findsOneWidget);
        expect(find.byType(CameraPreview), findsOneWidget);

        // Verify GridOverlayWidget is a child of CameraPreview (overlay)
        final cameraPreview = tester.widget<CameraPreview>(
          find.byType(CameraPreview),
        );
        expect(cameraPreview.child, isA<GridOverlayWidget>());

        // Reset the physical size after the test
        addTearDown(() {
          tester.view.resetPhysicalSize();
        });
      },
    );

    testWidgets(
      'GridOverlayWidget is always displayed over camera in landscape mode',
      (WidgetTester tester) async {
        // Arrange
        final mockBloc = MockCameraBloc(mockCameraController);

        // Set landscape size
        tester.view.physicalSize = const Size(1920, 1080);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider<CameraBloc>.value(
                value: mockBloc,
                child: const Stack(children: [CameraBodyView()]),
              ),
            ),
          ),
        );

        // Assert
        expect(find.byType(GridOverlayWidget), findsOneWidget);
        expect(find.byType(CameraPreview), findsOneWidget);

        // Verify GridOverlayWidget is a child of CameraPreview (overlay)
        final cameraPreview = tester.widget<CameraPreview>(
          find.byType(CameraPreview),
        );
        expect(cameraPreview.child, isA<GridOverlayWidget>());

        // Reset the physical size after the test
        addTearDown(() {
          tester.view.resetPhysicalSize();
        });
      },
    );

    testWidgets(
      'GridOverlayWidget is always displayed over front camera in portrait mode',
      (WidgetTester tester) async {
        // Arrange
        final mockFrontCameraController = MockCameraController(
          lensDirection: CameraLensDirection.front,
        );
        final mockBloc = MockCameraBloc(mockFrontCameraController);

        // Set portrait size
        tester.view.physicalSize = const Size(1080, 1920);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider<CameraBloc>.value(
                value: mockBloc,
                child: const Stack(children: [CameraBodyView()]),
              ),
            ),
          ),
        );

        // Assert
        expect(find.byType(GridOverlayWidget), findsOneWidget);
        expect(find.byType(CameraPreview), findsOneWidget);

        // Verify GridOverlayWidget is a child of CameraPreview (overlay)
        final cameraPreview = tester.widget<CameraPreview>(
          find.byType(CameraPreview),
        );
        expect(cameraPreview.child, isA<GridOverlayWidget>());

        // Reset the physical size after the test
        addTearDown(() {
          tester.view.resetPhysicalSize();
        });
      },
    );

    testWidgets(
      'GridOverlayWidget is always displayed over front camera in landscape mode',
      (WidgetTester tester) async {
        // Arrange
        final mockFrontCameraController = MockCameraController(
          lensDirection: CameraLensDirection.front,
        );
        final mockBloc = MockCameraBloc(mockFrontCameraController);

        // Set landscape size
        tester.view.physicalSize = const Size(1920, 1080);
        tester.view.devicePixelRatio = 1.0;

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider<CameraBloc>.value(
                value: mockBloc,
                child: const Stack(children: [CameraBodyView()]),
              ),
            ),
          ),
        );

        // Assert
        expect(find.byType(GridOverlayWidget), findsOneWidget);
        expect(find.byType(CameraPreview), findsOneWidget);

        // Verify GridOverlayWidget is a child of CameraPreview (overlay)
        final cameraPreview = tester.widget<CameraPreview>(
          find.byType(CameraPreview),
        );
        expect(cameraPreview.child, isA<GridOverlayWidget>());

        // Reset the physical size after the test
        addTearDown(() {
          tester.view.resetPhysicalSize();
        });
      },
    );
  });
}
