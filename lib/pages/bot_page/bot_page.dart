import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/bot_types.dart';
import '../../extensions/extensions.dart';
import '../../models/bot_model/bot_model.dart';
import '../../providers/screen_service.dart';
import '../../themes/app_colors.dart';
import '../../utils/assets.dart';
import '../../utils/dimens.dart';
import '../../widgets/action_button.dart';
import '../../widgets/dashed_line.dart';
import '../../widgets/graph_widget.dart';
import '../../widgets/loading_button.dart';
import '../../widgets/total_tile_widget.dart';

class BotPage extends HookWidget {
  const BotPage({
    Key? key,
    required this.bot,
  }) : super(key: key);

  final BotModel bot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grid bot performance',
                  style: context.theme.headline1,
                ),
                ActionButton(
                  onTap: router.pop,
                  radius: 24,
                  backgroundColor: AppColors.dopGray.withOpacity(.3),
                  icon: Assets.iconsClose.png,
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            titleSpacing: horizontalPaddingValue,
            centerTitle: false,
            stretch: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: Stack(
              children: <Widget>[
                ClipRRect(
                  child: SizedBox.expand(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2,
                        sigmaY: 2,
                      ),
                      child: Container(
                        color: AppColors.globalBackground.withOpacity(.8),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 18,
              left: horizontalPaddingValue,
              right: horizontalPaddingValue,
              bottom: 24,
            ),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  bot.botType.icon,
                  const SizedBox(width: 12),
                  Text(
                    bot.from,
                    style: context.theme.bodyText1,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '/ ',
                    style: context.theme.bodyText1.copyWith(
                      color: AppColors.dopGray,
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    bot.to,
                    style: context.theme.bodyText1.copyWith(
                      color: AppColors.dopGray,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Assets.iconsBinance.png,
                  const SizedBox(width: 4),
                  Assets.iconsStopLoss.png,
                  const SizedBox(width: 4),
                  Assets.iconsTakeProfit.png,
                  const Spacer(),
                  ActionButton(
                    onTap: () {},
                    icon: Assets.iconsShowChart.png,
                  ),
                  const SizedBox(width: 8),
                  ActionButton(
                    onTap: () {},
                    icon: Assets.iconsTimeSchedule.png,
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: IntrinsicWidth(
              child: AspectRatio(
                aspectRatio: 375 / 256,
                child: LineChartWidget(),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 24,
            ),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 68,
                child: ListView(
                  padding: horizontalPadding,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    TotalTile(
                      title: '1m 22d',
                      subtitle: 'Trading time',
                    ),
                    SizedBox(width: 8),
                    TotalTile(
                      title: '5270',
                      subtitle: 'Transactions',
                    ),
                    SizedBox(width: 8),
                    TotalTile(
                      percent: 0.61,
                      subtitle: 'Avg. daily',
                    ),
                    SizedBox(width: 8),
                    TotalTile(
                      percent: 83,
                      subtitle: 'Profiltable weeks',
                    ),
                    SizedBox(width: 8),
                    TotalTile(
                      percent: -15,
                      subtitle: 'Max drawdown',
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 24,
              right: horizontalPaddingValue,
              left: horizontalPaddingValue,
            ),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Values in USD',
                          style: context.theme.bodyText2.copyWith(
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
            padding: const EdgeInsets.only(
              top: 8,
              right: horizontalPaddingValue,
              left: horizontalPaddingValue,
            ),
            sliver: SliverToBoxAdapter(
              child: Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Bot profit',
                              style: context.theme.headline2,
                            ),
                            const SizedBox(width: 8),
                            Assets.iconsInfo.png,
                          ],
                        ),
                        Text(
                          '32.33%',
                          style: context.theme.bodyText1.green,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'P&L',
                          style: context.theme.bodyText2.dopGray,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: DashedLine(),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Text(
                              '0.183456676',
                              style: context.theme.bodyText2,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'BTC',
                              style: context.theme.bodyText2.dopGray,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Summary',
                          style: context.theme.bodyText2.dopGray,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: DashedLine(),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Text(
                              '322 344.33',
                              style: context.theme.bodyText2,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'USD',
                              style: context.theme.bodyText2.dopGray,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ).paddingAll(16),
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
              child: Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Current funds',
                              style: context.theme.headline2,
                            ),
                            const SizedBox(width: 8),
                            Assets.iconsInfo.png,
                          ],
                        ),
                        Text(
                          '27.33%',
                          style: context.theme.bodyText1.green,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Assets.iconsInfo.png,
                        const SizedBox(width: 8),
                        Text(
                          'Balance',
                          style: context.theme.bodyText2.dopGray,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: DashedLine(),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Text(
                              '0.183456676',
                              style: context.theme.bodyText2,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'BTC',
                              style: context.theme.bodyText2.dopGray,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Assets.iconsInfo.png,
                        const SizedBox(width: 8),
                        Text(
                          'Value',
                          style: context.theme.bodyText2.dopGray,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: DashedLine(),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Text(
                              '1 322 344.33',
                              style: context.theme.bodyText2,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'USD',
                              style: context.theme.bodyText2.dopGray,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Assets.iconsInfo.png,
                        const SizedBox(width: 8),
                        Text(
                          'P&L value',
                          style: context.theme.bodyText2.dopGray,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: DashedLine(),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Text(
                              '222 344.33',
                              style: context.theme.bodyText2,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'USD',
                              style: context.theme.bodyText2.dopGray,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ).paddingAll(16),
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
              child: Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Initial funds',
                              style: context.theme.headline2,
                            ),
                            const SizedBox(width: 8),
                            Assets.iconsInfo.png,
                          ],
                        ),
                        Text(
                          '-5.00%',
                          style: context.theme.bodyText1.red,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Assets.iconsInfo.png,
                        const SizedBox(width: 8),
                        Text(
                          'Balance',
                          style: context.theme.bodyText2.dopGray,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: DashedLine(),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Text(
                              '0.183456676',
                              style: context.theme.bodyText2,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'BTC',
                              style: context.theme.bodyText2.dopGray,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Assets.iconsInfo.png,
                        const SizedBox(width: 8),
                        Text(
                          'Value',
                          style: context.theme.bodyText2.dopGray,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: DashedLine(),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Text(
                              '1 000 000.00',
                              style: context.theme.bodyText2,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'USD',
                              style: context.theme.bodyText2.dopGray,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Assets.iconsInfo.png,
                        const SizedBox(width: 8),
                        Text(
                          'P&L value',
                          style: context.theme.bodyText2.dopGray,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: DashedLine(),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Text(
                              '-50 000.00',
                              style: context.theme.bodyText2,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'USD',
                              style: context.theme.bodyText2.dopGray,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ).paddingAll(16),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: 24,
              left: horizontalPaddingValue,
              right: horizontalPaddingValue,
              bottom: context.bottomPadding + 32,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  LoadingButton(
                    onPressed: () {},
                    style: context.theme.grayButtonStyle,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Assets.iconsList.png,
                        ),
                        const SizedBox(width: 8),
                        const Text('View details'),
                      ],
                    ),
                  ).expandedHorizontally(),
                  const SizedBox(height: 16),
                  LoadingButton(
                    onPressed: () {},
                    style: context.theme.grayButtonStyle,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Assets.iconsEdit.png,
                        ),
                        const SizedBox(width: 8),
                        const Text('Modify bot'),
                      ],
                    ),
                  ).expandedHorizontally(),
                  const SizedBox(height: 16),
                  LoadingButton(
                    onPressed: router.pop,
                    style: context.theme.blueButtonStyle,
                    child: const Text('Cancel bot'),
                  ).expandedHorizontally(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
