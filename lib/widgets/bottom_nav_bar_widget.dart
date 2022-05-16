import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../utils/assets.dart';
import '../../utils/dimens.dart';
import '../themes/app_colors.dart';
import 'gradient_box.dart';

class BottomNavBarWidget extends HookWidget {
  const BottomNavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(
        left: horizontalPaddingValue,
        right: horizontalPaddingValue,
        bottom: 27,
      ),
      decoration: BoxDecoration(
        color: AppColors.blockBackground,
        image: const DecorationImage(
          image: AssetImage(
            Assets.iconsAppBarBackground,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
        border: GradientBoxBorder(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(.1),
              Colors.transparent,
            ],
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            offset: const Offset(0, 0.68),
            blurRadius: 3.07,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.0683),
            offset: const Offset(0, 2.93),
            blurRadius: 5.78,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.0886),
            offset: const Offset(0, 7.07),
            blurRadius: 9.67,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.105),
            offset: const Offset(0, 13.4),
            blurRadius: 16.25,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.1214),
            offset: const Offset(0, 22.25),
            blurRadius: 27.05,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.1417),
            offset: const Offset(0, 33.92),
            blurRadius: 43.59,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.17),
            offset: const Offset(0, 48.73),
            blurRadius: 67.4,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(.21),
            offset: const Offset(0, 67),
            blurRadius: 100,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () {},
                child: Assets.iconsAutorenew.png,
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () {},
                child: Assets.iconsGraph.png,
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () {},
                child: Assets.iconsAdd.png,
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () {},
                child: Assets.iconsFilter.png,
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () {},
                child: Assets.iconsUser.png,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
