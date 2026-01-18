import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';

class RedCrosshair extends StatelessWidget {
  const RedCrosshair({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final Orientation orientation = MediaQuery.orientationOf(context);
    return Stack(
      children: [
        PositionedDirectional(
          bottom: orientation == Orientation.portrait
              ? screenSize.height * 0.12
              : screenSize.height * 0.44,
          start: orientation == Orientation.portrait ? 0 : null,
          end: orientation == Orientation.portrait
              ? null
              : screenSize.width * 0.026,
          child: Center(
            child: Container(
              height: orientation == Orientation.portrait ? 1.5 : 1,
              width: screenSize.width * 0.2,
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
          top: orientation == Orientation.portrait
              ? null
              : screenSize.height * 0.236,
          bottom: orientation == Orientation.portrait
              ? screenSize.height * 0.083
              : 0,
          start: orientation == Orientation.portrait
              ? screenSize.width * 0.142
              : null,
          end: orientation == Orientation.portrait
              ? null
              : screenSize.width * 0.055,
          child: Center(
            child: Container(
              width: orientation == Orientation.portrait ? 1.5 : 1,
              height: orientation == Orientation.portrait
                  ? screenSize.height * 0.55
                  : screenSize.height * 0.22,
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
          bottom: orientation == Orientation.portrait
              ? screenSize.height * 0.119
              : screenSize.height * 0.439,
          start: orientation == Orientation.portrait
              ? screenSize.width * 0.14
              : screenSize.width * 0.1966,
          child: Center(
            child: Container(
              width: orientation == Orientation.portrait ? 3 : 2,
              height: orientation == Orientation.portrait ? 3 : 2,
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
