import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: ColorsManager.customGreen),
    );
  }
}
