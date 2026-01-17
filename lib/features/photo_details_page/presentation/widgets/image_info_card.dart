import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_weight_manager.dart';

class ImageInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final TextStyle? valueTextStyle;

  const ImageInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.valueTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            children: [
              Icon(icon, color: ColorsManager.customGreen, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: ColorsManager.customGreen,
                    fontSize: 12,
                    fontWeight: FontWeightManager.semiBold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                valueTextStyle ??
                const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeightManager.bold,
                ),
          ),
        ],
      ),
    );
  }
}
