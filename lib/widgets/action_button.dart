import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class ActionButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final double radius;

  const ActionButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.backgroundColor,
    this.radius = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      color: backgroundColor ?? AppColors.actionButtonBackgroundColor,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: radius,
          height: radius,
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
