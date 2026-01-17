import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../generated/l10n.dart';

class PhotoDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PhotoDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        S.of(context).captureResult,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      backgroundColor: ColorsManager.customBlack,
      surfaceTintColor: ColorsManager.customBlack,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
