import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../extensions/extensions.dart';
import '../../utils/assets.dart';
import '../themes/app_colors.dart';

class BotItemWidget extends HookWidget {
  const BotItemWidget({
    Key? key,
  }) : super(key: key);

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
              onTap: () {},
              splashColor: AppColors.blue.withOpacity(.1),
              hoverColor: AppColors.blue.withOpacity(.1),
              focusColor: AppColors.blue.withOpacity(.1),
              highlightColor: AppColors.blue.withOpacity(.1),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.iconsFlatBot.png,
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
                                      'BTC',
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
                                      'ETH',
                                      style: context.theme.bodyText1.copyWith(
                                        color: AppColors.dopGray,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                Assets.iconsBinance.png,
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Assets.iconsStopLoss.png,
                                const SizedBox(width: 4),
                                Assets.iconsTakeProfit.png,
                                const SizedBox(width: 4),
                                Text(
                                  '1h 15min',
                                  style: context.theme.bodyText3.copyWith(
                                    color: AppColors.dopGray,
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
                        Text(
                          '123.5%',
                          style: context.theme.bodyText1.copyWith(
                            color: AppColors.green,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '€15.25',
                          style: context.theme.bodyText3.copyWith(
                            color: AppColors.dopGray,
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
}
