import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/filter_subtypes.dart';
import '../../../extensions/extensions.dart';
import '../../../providers/screen_service.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/assets.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/loading_button.dart';

class DcaModal extends StatelessWidget {
  const DcaModal({
    Key? key,
    required this.selectedFilter,
    required this.onSelectSubFilter,
  }) : super(key: key);
  final FilterSubtypes selectedFilter;
  final Function(FilterSubtypes val) onSelectSubFilter;

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
                'DCA',
                style: context.theme.headline2,
              ),
              ActionButton(
                onTap: router.pop,
                radius: 24,
                backgroundColor: AppColors.dopGray.withOpacity(.3),
                icon: Assets.iconsClose.png,
              ),
            ],
          ).paddingAll(16),
          const Divider(),
          Column(
            children: [
              for (final subFilter in FilterSubtypes.values)
                Column(
                  children: [
                    ListTile(
                      onTap: () {
                        onSelectSubFilter(subFilter);
                        router.pop();
                      },
                      title: Center(
                        child: Text(
                          '${subFilter.title} (6)',
                          style: selectedFilter == subFilter
                              ? context.theme.bodyText1.blue
                              : context.theme.bodyText1.dopGray,
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 24),
          LoadingButton(
            onPressed: router.pop,
            style: context.theme.grayButtonStyle,
            child: const Text('Cancel'),
          ).expandedHorizontally().paddingHorizontal(),
          SizedBox(
            height: context.bottomPadding + 24,
          ),
        ],
      ),
    );
  }
}
