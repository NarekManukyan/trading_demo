import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/sort_types.dart';
import '../../../extensions/extensions.dart';
import '../../../providers/screen_service.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/assets.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/loading_button.dart';

class FilterModal extends StatelessWidget {
  const FilterModal({
    Key? key,
    required this.selectedSortType,
    required this.onSelectSortType,
    required this.selectedSortTypeDirection,
  }) : super(key: key);

  final SortTypes selectedSortType;
  final SortTypeDirection selectedSortTypeDirection;
  final Function(SortTypes val) onSelectSortType;

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
                backgroundColor: AppColors.dopGray.withOpacity(.3),
                icon: const Icon(
                  CupertinoIcons.clear,
                  size: 12,
                ),
              )
            ],
          ).paddingAll(16),
          const Divider(),
          Column(
            children: [
              for (final sortType in SortTypes.values)
                Column(
                  children: [
                    ListTile(
                      onTap: () {
                        onSelectSortType(sortType);
                        router.pop();
                      },
                      title: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              sortType.title,
                              style: sortType == selectedSortType
                                  ? context.theme.bodyText1.blue
                                  : context.theme.bodyText1.dopGray,
                            ),
                            const SizedBox(width: 4),
                            Assets.iconsArrowUp.pngColored(
                              color: sortType == selectedSortType &&
                                      selectedSortTypeDirection ==
                                          SortTypeDirection.UP
                                  ? AppColors.blue
                                  : AppColors.dopGray,
                            ),
                            Assets.iconsArrowDown.pngColored(
                              color: sortType == selectedSortType &&
                                      selectedSortTypeDirection ==
                                          SortTypeDirection.DOWN
                                  ? AppColors.blue
                                  : AppColors.dopGray,
                            ),
                          ],
                        ),
                      ),
                    ),
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
