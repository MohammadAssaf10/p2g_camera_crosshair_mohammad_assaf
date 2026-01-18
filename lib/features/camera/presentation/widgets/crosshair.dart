import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';

class Crosshair extends StatelessWidget {
  const Crosshair({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Center(
          child: Container(
            height: 2,
            width: screenSize.width * 0.35,
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
            width: 2,
            height: screenSize.height * 0.35,
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
            width: 4,
            height: 4,
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
