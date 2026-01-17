import 'package:flutter/material.dart';

class RuleOfThirdsGrid extends StatelessWidget {
  const RuleOfThirdsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.orientationOf(context);
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                  width: 1,
                  height: double.infinity,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
              Container(
                width: 1,
                height: double.infinity,
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Spacer(flex: orientation == Orientation.landscape ? 2 : 1),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.white.withValues(alpha: 0.5),
              ),
              Spacer(flex: orientation == Orientation.landscape ? 2 : 1),
            ],
          ),
        ),
      ],
    );
  }
}
