import 'package:charts_painter/chart.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../extensions/extensions.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/dashed_line.dart';

class BarChartWidget extends HookWidget {
  const BarChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedItem = useState<int?>(null);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final data = [1, 5, 4, -6, -10, -2, -5];
          final average = data.average;
          final max = data.max;
          final min = data.min;
          final chartHeight = constraints.maxHeight - 96;
          final averagePosition =
              (chartHeight / (max - min)) * (max - average) - 10;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 6,
                ),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: context.theme.smallButtonSecondStyle.copyWith(
                        backgroundColor: MaterialStateProperty.all(
                          AppColors.tub,
                        ),
                        foregroundColor: MaterialStateProperty.all(
                          AppColors.white,
                        ),
                      ),
                      child: const Text('USD'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: context.theme.smallButtonSecondStyle.copyWith(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                        foregroundColor: MaterialStateProperty.all(
                          AppColors.dopGray,
                        ),
                      ),
                      child: const Text('BTC'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Stack(
                children: [
                  Chart<void>(
                    height: chartHeight,
                    state: ChartState(
                      ChartData.fromList(
                        data
                            .map(
                              (e) => BarValue<void>(
                                e.toDouble(),
                              ),
                            )
                            .toList(),
                        axisMax: max.toDouble(),
                        axisMin: min.toDouble(),
                      ),
                      behaviour: ChartBehaviour(
                        onItemClicked: (item) {
                          if (selectedItem.value != item) {
                            selectedItem.value = item;
                          } else {
                            selectedItem.value = null;
                          }
                        },
                      ),
                      itemOptions: BarItemOptions(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        radius: const BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        colorForValue: (_, value, [min]) {
                          return value! >= 0 ? AppColors.green : AppColors.red;
                        },
                      ),
                      foregroundDecorations: [
                        if ((selectedItem.value ?? 0) < data.length)
                          SelectedItemDecoration(
                            selectedItem.value,
                            animate: true,
                            backgroundColor:
                                data.elementAt(selectedItem.value ?? 0) > 0
                                    ? AppColors.green
                                    : AppColors.red,
                            selectedColor:
                                data.elementAt(selectedItem.value ?? 0) > 0
                                    ? AppColors.green
                                    : AppColors.red,
                            selectedStyle:
                                context.theme.bodyText2.white.copyWith(
                              height: 1,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: max == average ? 0 : averagePosition,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        const SizedBox(width: 4),
                        Container(
                          height: 4,
                          width: 4,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const Expanded(
                          child: DashedLine(
                            color: AppColors.white,
                            dashWidth: 4,
                            opacity: 1,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'AVG ${average.toStringAsFixed(2)}',
                            style: context.theme.bodyText2.blue.copyWith(
                              fontSize: 8,
                              height: 2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (final week in [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sun',
                  ])
                    Expanded(
                      child: Center(
                        child: Text(
                          week,
                          style: context.theme.bodyText2.dopGray,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
