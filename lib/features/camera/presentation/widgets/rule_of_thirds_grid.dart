import 'package:flutter/material.dart';

class RuleOfThirdsGrid extends StatelessWidget {
  const RuleOfThirdsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CustomPaint(painter: _RuleOfThirdsGridPainter()),
    );
  }
}

class _RuleOfThirdsGridPainter extends CustomPainter {
  static const double _lineOpacity = 0.5;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: _lineOpacity)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Calculate positions for rule of thirds (divide into 3 equal parts)
    final double horizontalThird = size.height / 3;
    final double verticalThird = size.width / 3;

    // Draw two horizontal lines
    canvas.drawLine(
      Offset(0, horizontalThird),
      Offset(size.width, horizontalThird),
      paint,
    );
    canvas.drawLine(
      Offset(0, horizontalThird * 2),
      Offset(size.width, horizontalThird * 2),
      paint,
    );

    // Draw two vertical lines
    canvas.drawLine(
      Offset(verticalThird, 0),
      Offset(verticalThird, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(verticalThird * 2, 0),
      Offset(verticalThird * 2, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
