import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';
import '../themes/app_colors.dart';

class TotalTile extends StatelessWidget {
  const TotalTile({
    Key? key,
    this.title,
    this.percent,
    required this.subtitle,
  }) : super(key: key);

  final String? title;
  final double? percent;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xff161822),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (title != null)
                Row(
                  children: [
                    Text(
                      title!,
                      style: context.theme.headline2,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              if (percent != null)
                Text(
                  '${percent!.toStringAsFixed(2)}%',
                  style: title == null
                      ? context.theme.headline2.copyWith(
                          color: percent! > 0 ? AppColors.green : AppColors.red,
                        )
                      : context.theme.bodyText2.copyWith(
                          color: percent! > 0 ? AppColors.green : AppColors.red,
                        ),
                ).paddingOnly(top: 2),
            ],
          ),
          Text(
            subtitle,
            style: context.theme.bodyText2.copyWith(
              color: AppColors.dopGray,
            ),
          ),
        ],
      ),
    );
  }
}
