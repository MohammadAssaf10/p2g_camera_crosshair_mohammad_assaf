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
        Positioned(
          bottom: 200,
          right: 0,
          left: 0,
          child: Center(
            child: Container(
              height: orientation == Orientation.portrait ? 1.4 : 1,
              width: orientation == Orientation.portrait
                  ? screenSize.width * 0.12
                  : screenSize.width * 0.15,
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
        Center(
          child: Container(
            width: orientation == Orientation.portrait ? 1.4 : 1,
            height: orientation == Orientation.portrait
                ? screenSize.height * 0.45
                : screenSize.height * 0.08,
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
        Positioned(
          bottom: 200,
          left: 0,
          right: 0,
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
