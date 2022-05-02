import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../providers/screen_service.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/assets.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/loading_button.dart';

class FilterModal extends StatelessWidget {
  const FilterModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 24),
              Text(
                'Sort by',
                style: context.theme.headline2,
              ),
              ActionButton(
                onTap: router.pop,
                radius: 24,
                backgroundColor: AppColors.dopGray,
                icon: const Icon(
                  CupertinoIcons.clear,
                  size: 12,
                ),
              )
            ],
          ).paddingAll(16),
          Column(
            children: [
              ListTile(
                onTap: () {},
                title: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Bot profit',
                        style: context.theme.bodyText1,
                      ),
                      const SizedBox(width: 4),
                      Assets.iconsArrowUp.png,
                      Assets.iconsArrowDown.png,
                    ],
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                title: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Value',
                        style: context.theme.bodyText1,
                      ),
                      const SizedBox(width: 4),
                      Assets.iconsArrowUp.png,
                      Assets.iconsArrowDown.png,
                    ],
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                title: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Alphabetically',
                        style: context.theme.bodyText1,
                      ),
                      const SizedBox(width: 4),
                      Assets.iconsArrowUp.png,
                      Assets.iconsArrowDown.png,
                    ],
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
          const SizedBox(height: 24),
          LoadingButton(
            onPressed: router.pop,
            style: context.theme.grayButtonStyle,
            child: const Text('Cancel'),
          ),
          SizedBox(
            height: context.bottomPadding + 24,
          ),
        ],
      ),
    );
  }
}
