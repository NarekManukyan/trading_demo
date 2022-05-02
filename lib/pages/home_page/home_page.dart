import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../extensions/extensions.dart';
import '../../themes/app_colors.dart';
import '../../utils/assets.dart';
import '../../utils/dimens.dart';
import '../../widgets/action_button.dart';
import '../../widgets/bot_item_widget.dart';
import '../../widgets/indicator_dots.dart';
import '../../widgets/total_tile_widget.dart';
import 'widgets/dca_modal.dart';
import 'widgets/filter_modal.dart';
import 'widgets/graph_widget.dart';
import 'widgets/grid_modal.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageViewController = usePageController();
    final selectedPeriodIndex = useState(0);
    final _selectedFilterIndex = useState(0);
    final _faker = useMemoized(Faker.new);
    final _onOpenFilter = useCallback(
      () async {
        await showCupertinoModalBottomSheet(
          context: context,
          barrierColor: AppColors.blockBackground.withOpacity(.9),
          builder: (_) {
            return const FilterModal();
          },
        );
      },
      [_faker],
    );
    final _onOpenGrid = useCallback(
      () async {
        await showCupertinoModalBottomSheet(
          context: context,
          barrierColor: AppColors.blockBackground.withOpacity(.9),
          builder: (_) {
            return const GridModal();
          },
        );
      },
      [_faker],
    );
    final _onOpenDca = useCallback(
      () async {
        await showCupertinoModalBottomSheet(
          context: context,
          barrierColor: AppColors.blockBackground.withOpacity(.9),
          builder: (_) {
            return const DcaModal();
          },
        );
      },
      [_faker],
    );
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            top: kToolbarHeight + 72,
            bottom: 16,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Automations',
                  style: context.theme.headline1,
                ),
                ActionButton(
                  onTap: () {},
                  icon: Assets.iconsTimeSchedule.png,
                ),
              ],
            ).paddingHorizontal(),
          ),
        ),
        SliverToBoxAdapter(
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 375 / 256,
                  child: PageView(
                    controller: _pageViewController,
                    children: [
                      GraphWidget(
                        selectedPeriodIndex: selectedPeriodIndex.value,
                        onChangePeriod: (val) {
                          selectedPeriodIndex.value = val;
                        },
                      ),
                      GraphWidget(
                        selectedPeriodIndex: selectedPeriodIndex.value,
                        onChangePeriod: (val) {
                          selectedPeriodIndex.value = val;
                        },
                      ),
                      GraphWidget(
                        selectedPeriodIndex: selectedPeriodIndex.value,
                        onChangePeriod: (val) {
                          selectedPeriodIndex.value = val;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                  child: Center(
                    child: PageViewIndicator(
                      selectedIndex: 0,
                      length: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 68,
              child: ListView.builder(
                padding: horizontalPadding,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return const TotalTile().paddingOnly(right: 8);
                },
                itemCount: 10,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            top: 24,
            left: horizontalPaddingValue,
            right: horizontalPaddingValue,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _selectedFilterIndex.value = 0;
                  },
                  style: context.theme.bigButtonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.all(
                      _selectedFilterIndex.value == 0
                          ? AppColors.blue
                          : Colors.transparent,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      _selectedFilterIndex.value == 0
                          ? AppColors.white
                          : AppColors.dopGray,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                        side: BorderSide(
                          color: _selectedFilterIndex.value == 0
                              ? Colors.transparent
                              : AppColors.dopGray,
                        ),
                      ),
                    ),
                  ),
                  child: const Text('All'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedFilterIndex.value != 1) {
                      _selectedFilterIndex.value = 1;
                    } else {
                      _onOpenGrid.call();
                    }
                  },
                  style: context.theme.bigButtonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.all(
                      _selectedFilterIndex.value == 1
                          ? AppColors.blue
                          : Colors.transparent,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      _selectedFilterIndex.value == 1
                          ? AppColors.white
                          : AppColors.dopGray,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                        side: BorderSide(
                          color: _selectedFilterIndex.value == 1
                              ? Colors.transparent
                              : AppColors.dopGray,
                        ),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Grid'),
                      const SizedBox(width: 4),
                      SizedBox(
                        height: 16,
                        width: 16,
                        child: Assets.iconsAngleDown.pngColored(
                          color: _selectedFilterIndex.value == 1
                              ? AppColors.white
                              : AppColors.dopGray,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedFilterIndex.value == 2) {
                      _onOpenDca.call();
                    } else {
                      _selectedFilterIndex.value = 2;
                    }
                  },
                  style: context.theme.bigButtonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.all(
                      _selectedFilterIndex.value == 2
                          ? AppColors.blue
                          : Colors.transparent,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      _selectedFilterIndex.value == 2
                          ? AppColors.white
                          : AppColors.dopGray,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                        side: BorderSide(
                          color: _selectedFilterIndex.value == 2
                              ? Colors.transparent
                              : AppColors.dopGray,
                        ),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('DCA'),
                      const SizedBox(width: 4),
                      SizedBox(
                        height: 16,
                        width: 16,
                        child: Assets.iconsAngleDown.pngColored(
                          color: _selectedFilterIndex.value == 2
                              ? AppColors.white
                              : AppColors.dopGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            top: 16,
            right: horizontalPaddingValue,
            left: horizontalPaddingValue,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: _onOpenFilter.call,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Assets.iconsSort.png,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Value change',
                        style: context.theme.bodyText3.copyWith(
                          color: AppColors.dopGray,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Assets.iconsAngleDown
                            .pngColored(
                              color: AppColors.dopGray,
                            )
                            .paddingAll(4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            bottom: context.bottomPadding + 64,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                return const BotItemWidget();
              },
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
