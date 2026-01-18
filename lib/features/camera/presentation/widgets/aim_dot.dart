import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';

class AimDot extends StatelessWidget {
  const AimDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: ColorsManager.customGreen, width: 1),
        ),
      ),
    );
  }
}
