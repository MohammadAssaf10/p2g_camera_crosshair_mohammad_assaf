import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';

class RedCrosshair extends StatelessWidget {
  const RedCrosshair({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final Orientation orientation = MediaQuery.orientationOf(context);
    final bool isPortrait = orientation == Orientation.portrait;
    return Stack(
      children: [
        PositionedDirectional(
          bottom: isPortrait ? 160 : 90,
          start: orientation == Orientation.portrait ? 0 : null,
          end: orientation == Orientation.portrait ? null : 160,
          child: Center(
            child: Container(
              height: 1.5,
              width: isPortrait ? 60 : screenSize.width * 0.6,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.1),
                    blurRadius: 1,
                    spreadRadius: 0.1,
                  ),
                ],
              ),
            ),
          ),
        ),
        PositionedDirectional(
          bottom: isPortrait ? 120 : 0,
          start: isPortrait ? 30 : null,
          end: isPortrait ? null : 200,
          child: Center(
            child: Container(
              width: 1.5,
              height: isPortrait ? screenSize.height * 0.6 : 130,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.1),
                    blurRadius: 1,
                    spreadRadius: 0.1,
                  ),
                ],
              ),
            ),
          ),
        ),
        PositionedDirectional(
          bottom: isPortrait ? 159.5 : 89,
          start: isPortrait ? 29.5 : null,
          end: isPortrait ? null : 199.5,
          child: Center(
            child: Container(
              width: 3,
              height: 3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: ColorsManager.customGreen,
                  width: 0.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
