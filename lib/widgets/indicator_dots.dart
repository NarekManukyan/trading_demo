import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../themes/app_colors.dart';

class PageViewIndicator extends HookWidget {
  final int length;
  final double selectedIndex;
  final EdgeInsets? margin;
  final Duration? animationDuration;

  const PageViewIndicator({
    Key? key,
    required this.length,
    required this.selectedIndex,
    this.margin,
    this.animationDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  Color getColor(int index) {
    if (index == selectedIndex.round()) {
      return AppColors.blue;
    }
    return const Color(0xFF343850);
  }

  @override
  Widget build(BuildContext context) {
    final indicators = <Widget>[];
    for (var index = 0; index < length; index++) {
      indicators.add(
        AnimatedContainer(
          duration: animationDuration!,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: getColor(index),
          ),
          margin: margin ?? const EdgeInsets.all(2),
          width: 8,
          height: 8,
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: indicators,
    );
  }
}
