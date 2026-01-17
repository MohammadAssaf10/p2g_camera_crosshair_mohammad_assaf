import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_weight_manager.dart';
import '../../../../generated/l10n.dart';

class RetakePhotoButton extends StatelessWidget {
  const RetakePhotoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.customBlack,
        side: const BorderSide(color: ColorsManager.customGray, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            S.of(context).retakePhoto,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeightManager.semiBold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
