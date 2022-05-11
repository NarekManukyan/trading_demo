import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../extensions/extensions.dart';
import '../../themes/app_colors.dart';
import '../../utils/assets.dart';

class AppBarWidget extends HookWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: const BoxDecoration(
        color: AppColors.appBarBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: kToolbarHeight),
          Row(
            children: [
              Assets.iconsBriefcase.png,
              const SizedBox(width: 12),
              Text(
                '53 567.89',
                style: context.theme.headline2,
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: AppColors.iconBackgroundColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Demo',
                  style: context.theme.bodyText2.copyWith(
                    color: AppColors.yellow,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Assets.iconsAngleDown.pngColored(color: AppColors.white),
              ),
              const Spacer(),
              SizedBox(
                height: 32,
                width: 32,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Assets.iconsNotifications.png,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: AppColors.red,
                        ),
                        child: Text(
                          '10',
                          style: context.theme.bodyText2,
                        ).paddingSymmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).paddingHorizontal(),
          const SizedBox(height: 4),
          Center(
            child: Container(
              width: 48,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.dopGray,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
