import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../extensions/extensions.dart';
import '../../../hooks/keep_alive_hook.dart';
import '../../../models/chart_data/chart_data_model.dart';
import '../../../themes/app_colors.dart';

class CircularChartWidget extends HookWidget {
  const CircularChartWidget({
    Key? key,
    required List<ChartDataModel> data,
  })  : _data = data,
        super(key: key);

  final List<ChartDataModel> _data;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
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
                child: const Text('Funds value'),
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
                child: const Text('Profit'),
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
                child: const Text('Available'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Stack(
                  children: [
                    SfCircularChart(
                      series: <DoughnutSeries<ChartDataModel, String>>[
                        DoughnutSeries<ChartDataModel, String>(
                          explode: false,
                          animationDuration: 800,
                          dataSource: _data,
                          xValueMapper: (data, _) => data.x,
                          yValueMapper: (data, _) => data.y,
                          pointColorMapper: (model, index) {
                            return model.color;
                          },
                          cornerStyle: CornerStyle.bothFlat,
                          innerRadius: '85%',
                          radius: '100%',
                          dataLabelMapper: (data, _) => '${data.y} %',
                        )
                      ],
                      margin: EdgeInsets.zero,
                      tooltipBehavior: TooltipBehavior(enable: true),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '53 567.89',
                            style: context.theme.headline2,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'BTC',
                            style: context.theme.bodyText2.dopGray,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final item in _data)
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: item.color,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${item.x} - ${item.y.toInt()} %',
                                style: context.theme.bodyText2,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ).paddingHorizontal(),
        ),
      ],
    );
  }
}
