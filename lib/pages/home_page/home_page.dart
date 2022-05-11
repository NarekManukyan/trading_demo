import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../constants/filter_subtypes.dart';
import '../../constants/filter_types.dart';
import '../../constants/sort_types.dart';
import '../../extensions/extensions.dart';
import '../../store/home_state/home_state.dart';
import '../../themes/app_colors.dart';
import '../../utils/assets.dart';
import '../../utils/dimens.dart';
import '../../utils/durations_utils.dart';
import '../../widgets/action_button.dart';
import '../../widgets/bot_item_widget.dart';
import '../../widgets/graph_widget.dart';
import '../../widgets/indicator_dots.dart';
import '../../widgets/total_tile_widget.dart';
import 'widgets/bar_chart_widget.dart';
import 'widgets/circular_chart_widget.dart';
import 'widgets/dca_modal.dart';
import 'widgets/filter_modal.dart';
import 'widgets/grid_modal.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageViewController = usePageController();
    final _homeState = useMemoized(HomeState.new);
    final _onOpenFilter = useCallback(
      () async {
        await showCupertinoModalBottomSheet(
          context: context,
          barrierColor: AppColors.blockBackground.withOpacity(.9),
          builder: (_) {
            return FilterModal(
              selectedSortType: _homeState.selectedSortType,
              selectedSortTypeDirection: _homeState.selectedSortTypeDirection,
              onSelectSortType: (val) {
                if (_homeState.selectedSortType == val) {
                  _homeState.selectedSortTypeDirection =
                      _homeState.selectedSortTypeDirection ==
                              SortTypeDirection.UP
                          ? SortTypeDirection.DOWN
                          : SortTypeDirection.UP;
                } else {
                  _homeState
                    ..selectedSortType = val
                    ..selectedSortTypeDirection = SortTypeDirection.UP;
                }
                _homeState.sortByBotProfit();
              },
            );
          },
        );
      },
      [_homeState],
    );
    final _onOpenGrid = useCallback(
      () async {
        await showCupertinoModalBottomSheet(
          context: context,
          barrierColor: AppColors.blockBackground.withOpacity(.9),
          builder: (_) {
            return GridModal(
              selectedFilter: _homeState.selectedSubFilter,
              onSelectSubFilter: (val) {
                _homeState.selectedSubFilter = val;
              },
            );
          },
        );
      },
      [_homeState],
    );
    final _onOpenDca = useCallback(
      () async {
        await showCupertinoModalBottomSheet(
          context: context,
          barrierColor: AppColors.blockBackground.withOpacity(.9),
          builder: (_) {
            return DcaModal(
              selectedFilter: _homeState.selectedSubFilter,
              onSelectSubFilter: (val) {
                _homeState.selectedSubFilter = val;
              },
            );
          },
        );
      },
      [_homeState],
    );

    final _onFilterItemTap = useCallback(
      (filter) {
        if (_homeState.selectedFilter == filter) {
          if (filter == FilterTypes.DCA) {
            _onOpenDca();
          } else if (filter == FilterTypes.GRID) {
            _onOpenGrid();
          }
        } else {
          _homeState.selectedSubFilter = FilterSubtypes.ALL;
        }
        _homeState.selectedFilter = filter;
      },
      [_homeState],
    );
    useEffect(() {
      _pageViewController.addListener(
        () {
          _homeState.page = _pageViewController.page ?? 0;
        },
      );
      return;
    });

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
                  'Bots',
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
                      const LineChartWidget(),
                      Observer(
                        builder: (_) {
                          return CircularChartWidget(
                            data: _homeState.circleChartData,
                          );
                        },
                      ),
                      const BarChartWidget(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                  child: Center(
                    child: Observer(
                      builder: (_) {
                        return PageViewIndicator(
                          selectedIndex: _homeState.page,
                          length: 3,
                        );
                      },
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
              child: ListView(
                padding: horizontalPadding,
                scrollDirection: Axis.horizontal,
                children: const [
                  TotalTile(
                    title: '฿ 0.04876',
                    percent: 1.11,
                    subtitle: 'Total P&L',
                  ),
                  SizedBox(width: 8),
                  TotalTile(
                    title: '฿ 0.00376',
                    percent: 0.07,
                    subtitle: 'Total bot profit',
                  ),
                  SizedBox(width: 8),
                  TotalTile(
                    title: '฿0.12676',
                    subtitle: 'Total value',
                  ),
                ],
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final filter in FilterTypes.values)
                    Row(
                      children: [
                        Observer(
                          builder: (_) {
                            return ElevatedButton(
                              onPressed: () {
                                _onFilterItemTap(filter);
                              },
                              style: context.theme.bigButtonStyle.copyWith(
                                backgroundColor: MaterialStateProperty.all(
                                  _homeState.selectedFilter == filter
                                      ? AppColors.blue
                                      : Colors.transparent,
                                ),
                                foregroundColor: MaterialStateProperty.all(
                                  _homeState.selectedFilter == filter
                                      ? AppColors.white
                                      : AppColors.dopGray,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                    side: BorderSide(
                                      color: _homeState.selectedFilter == filter
                                          ? Colors.transparent
                                          : AppColors.dopGray,
                                    ),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    _filterTitleBuilder(
                                      filter: filter,
                                      selectedFilter: _homeState.selectedFilter,
                                      selectedSubFilter:
                                          _homeState.selectedSubFilter,
                                    ),
                                  ),
                                  if (filter != FilterTypes.ALL)
                                    Row(
                                      children: [
                                        const SizedBox(width: 4),
                                        Assets.iconsAngleDown.pngColored(
                                          color: _homeState.selectedFilter ==
                                                  filter
                                              ? AppColors.white
                                              : AppColors.dopGray,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                ],
              ),
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
                  onTap: _onOpenFilter,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Assets.iconsSort.png,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _homeState.isBotProfitSelected =
                        !_homeState.isBotProfitSelected;
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Observer(
                        builder: (_) {
                          return AnimatedSwitcher(
                            duration: animationDuration,
                            child: SizedBox(
                              width: 90,
                              key: UniqueKey(),
                              child: Text(
                                _homeState.isBotProfitSelected
                                    ? 'Bot profit'
                                    : 'Value change',
                                style: context.theme.bodyText2.copyWith(
                                  color: AppColors.dopGray,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Assets.iconsSortList.png,
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
          sliver: Observer(
            builder: (_) {
              final list = _homeState.selectedFilter == FilterTypes.ALL
                  ? _homeState.botItems
                  : _homeState.selectedFilter == FilterTypes.GRID
                      ? _homeState.gridBots
                      : _homeState.dcaBots;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    return Observer(
                      builder: (_) {
                        return BotItemWidget(
                          bot: list[index],
                          isBotProfitSelected: _homeState.isBotProfitSelected,
                        );
                      },
                    );
                  },
                  childCount: list.length,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  String _filterTitleBuilder({
    required FilterTypes filter,
    required FilterTypes selectedFilter,
    required FilterSubtypes selectedSubFilter,
  }) {
    switch (filter) {
      case FilterTypes.ALL:
        return 'All';
      case FilterTypes.GRID:
      case FilterTypes.DCA:
        if (selectedFilter != filter ||
            selectedSubFilter == FilterSubtypes.ALL) {
          return filter.title;
        } else {
          return '${filter.title} - ${selectedSubFilter.title}';
        }
    }
  }
}
