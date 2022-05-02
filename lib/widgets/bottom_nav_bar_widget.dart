import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../utils/assets.dart';
import '../../utils/dimens.dart';
import '../themes/app_colors.dart';

class BottomNavBarWidget extends HookWidget {
  const BottomNavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(
        horizontal: horizontalPaddingValue,
        vertical: 24,
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
      ),
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(32),
              child: InkWell(
                onTap: () {},
                child: Assets.iconsAutorenew.png,
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(32),
              child: InkWell(
                onTap: () {},
                child: Assets.iconsGraph.png,
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(32),
              child: InkWell(
                onTap: () {},
                child: Assets.iconsAdd.png,
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(32),
              child: InkWell(
                onTap: () {},
                child: Assets.iconsFilter.png,
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(32),
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
