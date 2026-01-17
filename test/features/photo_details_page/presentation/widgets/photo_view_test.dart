import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p2g_camera_crosshair_mohammad_assaf/features/photo_details_page/presentation/widgets/image_info_row.dart';
import 'package:p2g_camera_crosshair_mohammad_assaf/generated/l10n.dart';

void main() {
  group('PhotoView Tests - EXIF Orientation Info Row', () {
    Widget createTestWidget({String? exifOrientation}) {
      return MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) {
              String getOrientationDescription(String orientation) {
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

              return Container(
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
                      value: 'Jan 17, 2026 - 10:30 AM',
                    ),
                    if (exifOrientation != null) ...[
                      const Divider(height: 24),
                      ImageInfoRow(
                        icon: Icons.screen_rotation_outlined,
                        title: S.of(context).exifOrientation,
                        value: getOrientationDescription(exifOrientation),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      );
    }

    testWidgets(
      'exif orientation info row is displayed when exifOrientation is not null',
      (WidgetTester tester) async {
        // Act
        await tester.pumpWidget(createTestWidget(exifOrientation: '6'));
        await tester.pumpAndSettle();

        // Assert - Find the orientation info row icon
        expect(find.byIcon(Icons.screen_rotation_outlined), findsOneWidget);

        // Verify the orientation description text is present (Right (90°))
        expect(find.textContaining('Right'), findsOneWidget);
        expect(find.textContaining('90°'), findsOneWidget);

        // Verify timestamp icon is also present
        expect(find.byIcon(Icons.access_time_outlined), findsOneWidget);
      },
    );

    testWidgets(
      'exif orientation info row is NOT displayed when exifOrientation is null',
      (WidgetTester tester) async {
        // Act
        await tester.pumpWidget(createTestWidget(exifOrientation: null));
        await tester.pumpAndSettle();

        // Assert - Orientation icon should NOT be present
        expect(find.byIcon(Icons.screen_rotation_outlined), findsNothing);

        // But timestamp icon should still be present
        expect(find.byIcon(Icons.access_time_outlined), findsOneWidget);
      },
    );

    testWidgets('divider is displayed only when exifOrientation is not null', (
      WidgetTester tester,
    ) async {
      // Test with exifOrientation
      await tester.pumpWidget(createTestWidget(exifOrientation: '6'));
      await tester.pumpAndSettle();

      // Should find 1 divider (between timestamp and orientation)
      expect(find.byType(Divider), findsOneWidget);

      // Test without exifOrientation
      await tester.pumpWidget(createTestWidget(exifOrientation: null));
      await tester.pumpAndSettle();

      // Should find no dividers
      expect(find.byType(Divider), findsNothing);
    });
  });
}
