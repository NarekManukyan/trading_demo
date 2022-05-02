import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../providers/screen_service.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/loading_button.dart';

class GridModal extends StatelessWidget {
  const GridModal({
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
                'Grid',
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
                  child: Text(
                    'All (6)',
                    style: context.theme.bodyText1,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                title: Center(
                  child: Text(
                    'Spot (4)',
                    style: context.theme.bodyText1,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                title: Center(
                  child: Text(
                    'Futures (2)',
                    style: context.theme.bodyText1,
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
