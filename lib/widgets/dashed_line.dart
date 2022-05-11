import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../themes/app_colors.dart';

class DashedLine extends HookWidget {
  final double height;
  final double dashWidth;
  final Color color;
  final double opacity;

  const DashedLine({
    Key? key,
    this.height = 1,
    this.color = AppColors.dopGray,
    this.dashWidth = 2.0,
    this.opacity = .2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          direction: Axis.horizontal,
          children: List.generate(
            dashCount,
            (index) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color.withOpacity(opacity),
                    borderRadius: BorderRadius.circular(height),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
