import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../constants/graph_periods.dart';
import '../../../extensions/extensions.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/assets.dart';
import '../../../utils/dimens.dart';

class GraphWidget extends HookWidget {
  final int selectedPeriodIndex;
  final Function(int val) onChangePeriod;

  const GraphWidget({
    Key? key,
    required this.selectedPeriodIndex,
    required this.onChangePeriod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.symmetric(horizontal: horizontalPaddingValue),
            children: [
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Assets.iconsCheck.png,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Summary funds value',
                    style: context.theme.bodyText3,
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Assets.iconsCheck.pngColored(
                      color: AppColors.globalBackground,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'BTC',
                    style: context.theme.bodyText3,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final period in GraphPeriods.values)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      onChangePeriod.call(period.index);
                    },
                    style: context.theme.smallButtonSelectedStyle.copyWith(
                      backgroundColor: MaterialStateProperty.all(
                        selectedPeriodIndex == period.index
                            ? const Color(0xFF282B39)
                            : Colors.transparent,
                      ),
                      textStyle: MaterialStateProperty.all(
                        context.theme.caption1.copyWith(
                          fontSize: 13,
                          height: 1.23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        selectedPeriodIndex == period.index
                            ? AppColors.white
                            : AppColors.dopGray,
                      ),
                    ),
                    child: Text(period.title),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
          ],
        ).paddingHorizontal(),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 375 / 176,
          child: SfSparkLineChart(
            //Enable the trackball
            trackball: const SparkChartTrackball(),
            marker: const SparkChartMarker(
              displayMode: SparkChartMarkerDisplayMode.last,
            ),
            labelDisplayMode: SparkChartLabelDisplayMode.last,
            lastPointColor: AppColors.red,
            axisLineDashArray: const [4, 2],
            axisLineColor: AppColors.white.withOpacity(0.4),
            axisLineWidth: 1,
            data: List.generate(
              50,
              (index) => Random().nextInt(50) - 25,
            ),
          ),
        ),
      ],
    );
  }
}
