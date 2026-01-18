import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';

class Crosshair extends StatelessWidget {
  const Crosshair({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final Orientation orientation = MediaQuery.orientationOf(context);
    return Stack(
      children: [
        Center(
          child: Container(
            height: 1.4,
            width: orientation == Orientation.portrait
                ? screenSize.width * 0.35
                : screenSize.width * 0.13,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: ColorsManager.customBlack.withValues(alpha: 0.1),
                  blurRadius: 1,
                  spreadRadius: 0.1,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            width: 1.4,
            height: orientation == Orientation.portrait
                ? screenSize.height * 0.24
                : screenSize.height * 0.16,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: ColorsManager.customBlack.withValues(alpha: 0.1),
                  blurRadius: 1,
                  spreadRadius: 0.1,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            width: 3,
            height: 3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: ColorsManager.customGreen, width: 0.5),
            ),
          ),
        ),
      ],
    );
  }
}
