import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';
import '../themes/app_colors.dart';

class TotalTile extends StatelessWidget {
  const TotalTile({
    Key? key,
  }) : super(key: key);

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '฿ 0.00376',
                style: context.theme.headline2,
              ),
              const SizedBox(width: 8),
              Text(
                '0.07%',
                style: context.theme.bodyText3.copyWith(
                  color: AppColors.green,
                ),
              ).paddingOnly(top: 2),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Total bot profit',
            style: context.theme.bodyText3.copyWith(
              color: AppColors.dopGray,
            ),
          ),
        ],
      ),
    );
  }
}
