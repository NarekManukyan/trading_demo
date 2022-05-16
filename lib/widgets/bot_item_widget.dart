import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../extensions/extensions.dart';
import '../../utils/assets.dart';
import '../constants/bot_sub_types.dart';
import '../constants/bot_types.dart';
import '../constants/bot_work_type.dart';
import '../models/bot_model/bot_model.dart';
import '../providers/screen_service.dart';
import '../themes/app_colors.dart';
import '../utils/durations_utils.dart';

class BotItemWidget extends HookWidget {
  const BotItemWidget({
    Key? key,
    required this.bot,
    required this.isBotProfitSelected,
  }) : super(key: key);

  final BotModel bot;
  final bool isBotProfitSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Material(
            color: AppColors.blockLinkBackground,
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                router.push(BotRoute(bot: bot));
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        bot.botType.icon,
                        const SizedBox(width: 12),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                  ],
                                ),
                                const SizedBox(width: 8),
                                Assets.iconsBinance.png,
                                const SizedBox(width: 4),
                                if (bot.isIncreased)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.iconBackgroundColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'x125',
                                      style: context.theme.bodyText2.copyWith(
                                        color: AppColors.yellow,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (final subType in bot.subTypes)
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      subType.icon,
                                      const SizedBox(width: 4),
                                    ],
                                  ),
                                Text(
                                  intToTimeLeft(bot.workMinutes),
                                  style: context.theme.bodyText2.copyWith(
                                    color: AppColors.dopGray,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  bot.workType.title,
                                  style: context.theme.bodyText2.copyWith(
                                    color: bot.workType.color,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AnimatedSwitcher(
                          duration: animationDuration,
                          child: isBotProfitSelected
                              ? SizedBox(
                                  width: 96,
                                  key: UniqueKey(),
                                  child: Text(
                                    '€${bot.money.toStringAsFixed(1)}',
                                    textAlign: TextAlign.right,
                                    style: context.theme.bodyText1.copyWith(
                                      color: AppColors.green,
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 96,
                                  key: UniqueKey(),
                                  child: Text(
                                    '${bot.percent.toStringAsFixed(1)}%',
                                    textAlign: TextAlign.right,
                                    style: context.theme.bodyText1.copyWith(
                                      color: AppColors.green,
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 8),
                        AnimatedSwitcher(
                          duration: animationDuration,
                          child: isBotProfitSelected
                              ? SizedBox(
                                  width: 96,
                                  key: UniqueKey(),
                                  child: Text(
                                    '${bot.percent.toStringAsFixed(2)}%',
                                    style: context.theme.bodyText2.copyWith(
                                      color: AppColors.dopGray,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              : SizedBox(
                                  width: 96,
                                  key: UniqueKey(),
                                  child: Text(
                                    '€${bot.money.toStringAsFixed(2)}',
                                    style: context.theme.bodyText2.copyWith(
                                      color: AppColors.dopGray,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String intToTimeLeft(int value) {
    int h, m;
    h = value ~/ 60;
    m = value - h * 60;
    return '${h > 0 ? '${h}h' : ''} ${m}min';
  }
}
