import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_weight_manager.dart';

class ImageInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const ImageInfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: ColorsManager.customGreen, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              style: const TextStyle(
                color: ColorsManager.customGreen,
                fontSize: 12,
                fontWeight: FontWeightManager.semiBold,
              ),
            ),
          ),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
