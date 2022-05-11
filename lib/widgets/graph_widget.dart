import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../constants/graph_periods.dart';
import '../extensions/extensions.dart';
import '../hooks/keep_alive_hook.dart';
import '../store/line_chart_state/line_chart_state.dart';
import '../themes/app_colors.dart';
import '../utils/assets.dart';
import '../utils/dimens.dart';
import '../utils/durations_utils.dart';
import 'dashed_line.dart';

class LineChartWidget extends HookWidget {
  const LineChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _lineChartState = useMemoized(LineChartState.new);
    useAutomaticKeepAlive();
    final _timer = useMemoized(
      () {
        return Timer.periodic(
          const Duration(milliseconds: 1000),
          (timer) {
            _lineChartState.chartData2.replaceRange(
                _lineChartState.chartData2.length - 1,
                _lineChartState.chartData2.length, [
              SalesData(
                _lineChartState.chartData2.last.year,
                _lineChartState.chartData2.last.sales +
                    Random().nextDouble() -
                    .5,
              )
            ]);
            _lineChartState.chartData1.replaceRange(
                _lineChartState.chartData1.length - 1,
                _lineChartState.chartData1.length, [
              SalesData(
                _lineChartState.chartData1.last.year,
                _lineChartState.chartData1.last.sales +
                    Random().nextDouble() -
                    .5,
              )
            ]);
            _lineChartState
              ..chartData2 = [..._lineChartState.chartData2].asObservable()
              ..chartData1 = [..._lineChartState.chartData1].asObservable();
          },
        );
      },
    );

    useEffect(
      () {
        return _timer.cancel;
      },
      [_lineChartState],
    );

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
              GestureDetector(
                onTap: () {
                  _lineChartState.summaryGraphDisabled =
                      !_lineChartState.summaryGraphDisabled;
                },
                child: Row(
                  children: [
                    Observer(
                      builder: (_) {
                        return Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: _lineChartState.summaryGraphDisabled
                                ? Colors.transparent
                                : AppColors.green,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColors.green),
                          ),
                          child: _lineChartState.summaryGraphDisabled
                              ? const SizedBox()
                              : Assets.iconsCheck.png,
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Summary funds value',
                      style: context.theme.bodyText2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              GestureDetector(
                onTap: () {
                  _lineChartState.btcGraphDisabled =
                      !_lineChartState.btcGraphDisabled;
                },
                child: Row(
                  children: [
                    Observer(
                      builder: (_) {
                        return Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: _lineChartState.btcGraphDisabled
                                ? Colors.transparent
                                : AppColors.yellow,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColors.yellow),
                          ),
                          child: _lineChartState.btcGraphDisabled
                              ? const SizedBox()
                              : Assets.iconsCheck.pngColored(
                                  color: AppColors.globalBackground,
                                ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'BTC',
                      style: context.theme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Observer(
          builder: (_) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final period in GraphPeriods.values)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // _lineChartState.selectedPeriod = period;
                        },
                        style: context.theme.smallButtonStyle.copyWith(
                          backgroundColor: MaterialStateProperty.all(
                            _lineChartState.selectedPeriod == period
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
                            _lineChartState.selectedPeriod == period
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
            ).paddingHorizontal();
          },
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 375 / 176,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final _oneSectionSize =
                  constraints.maxHeight / _lineChartState.areaSize;
              return Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Observer(
                          builder: (_) {
                            return SfCartesianChart(
                              margin: const EdgeInsets.only(
                                left: 16,
                                right: 46,
                              ),
                              tooltipBehavior: TooltipBehavior(enable: false),
                              series: <ChartSeries>[
                                LineSeries<SalesData, int>(
                                  dataSource: _lineChartState.chartData1,
                                  xValueMapper: (sales, _) =>
                                      sales.year.millisecondsSinceEpoch,
                                  yValueMapper: (sales, _) => sales.sales,
                                  color: _lineChartState.summaryGraphDisabled
                                      ? Colors.transparent
                                      : AppColors.green,
                                  width: _lineChartState.summaryGraphDisabled
                                      ? 0
                                      : 3,
                                ),
                                LineSeries<SalesData, int>(
                                  dataSource: _lineChartState.chartData2,
                                  xValueMapper: (sales, _) =>
                                      sales.year.millisecondsSinceEpoch,
                                  yValueMapper: (sales, _) => sales.sales,
                                  color: _lineChartState.btcGraphDisabled
                                      ? Colors.transparent
                                      : AppColors.yellow,
                                  width:
                                      _lineChartState.btcGraphDisabled ? 0 : 3,
                                ),
                              ],
                              trackballBehavior: TrackballBehavior(
                                activationMode: ActivationMode.singleTap,
                              ),
                              zoomPanBehavior: ZoomPanBehavior(),
                              plotAreaBorderWidth: 0,
                              primaryXAxis: NumericAxis(
                                isVisible: false,
                              ),
                              primaryYAxis: NumericAxis(
                                isVisible: false,
                                maximum: _lineChartState.maxValues.max + 5,
                                minimum: _lineChartState.minValues.min - 5,
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '1d',
                              style: context.theme.bodyText2.dopGray,
                            ).paddingHorizontal(),
                          ),
                          Expanded(
                            child: Text(
                              '15d',
                              style: context.theme.bodyText2.dopGray,
                              textAlign: TextAlign.center,
                            ).paddingHorizontal(),
                          ),
                          Expanded(
                            child: Text(
                              '30d',
                              style: context.theme.bodyText2.dopGray,
                              textAlign: TextAlign.end,
                            ).paddingHorizontal(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Observer(
                    builder: (_) {
                      return IgnorePointer(
                        child: Column(
                          children: [
                            SizedBox(
                              width: context.width,
                              height: _oneSectionSize *
                                      (_lineChartState.maxValues.max) -
                                  5,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      AppColors.green.withOpacity(.1),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.width,
                              height: (_oneSectionSize *
                                      (_lineChartState.minValues.min + 5))
                                  .abs(),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.red.withOpacity(.2),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return Positioned(
                        right: 0,
                        left: 0,
                        bottom: _oneSectionSize *
                            (0 - _lineChartState.minValues.min - 5),
                        child: IgnorePointer(
                          child: Center(
                            child: Row(
                              children: [
                                const Expanded(
                                  child: DashedLine(
                                    color: AppColors.white,
                                    dashWidth: 4,
                                    opacity: .4,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Text(
                                    '0 %',
                                    style:
                                        context.theme.bodyText2.blue.copyWith(
                                      fontSize: 8,
                                      height: 2,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 18,
                                  child: DashedLine(
                                    color: AppColors.white,
                                    dashWidth: 4,
                                    opacity: .4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      if (_lineChartState.summaryGraphDisabled) {
                        return const SizedBox();
                      }
                      return AnimatedPositioned(
                        duration: animationDuration,
                        right: 0,
                        left: 0,
                        top: _oneSectionSize *
                                ((_lineChartState.maxValues.min -
                                        _lineChartState.chartData1.last.sales)
                                    .abs()) -
                            10,
                        child: IgnorePointer(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.green,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Text(
                                    '${_lineChartState.chartData1.last.sales.toStringAsFixed(1)} %',
                                    style:
                                        context.theme.bodyText2.white.copyWith(
                                      fontSize: 8,
                                      height: 2,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 18),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      if (_lineChartState.btcGraphDisabled) {
                        return const SizedBox();
                      }
                      return AnimatedPositioned(
                        duration: animationDuration,
                        right: 0,
                        left: 0,
                        top: _oneSectionSize *
                                ((_lineChartState.maxValues.min -
                                        _lineChartState.chartData2.last.sales)
                                    .abs()) -
                            10,
                        child: IgnorePointer(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Text(
                                    '${_lineChartState.chartData2.last.sales.toStringAsFixed(1)} %',
                                    style:
                                        context.theme.bodyText2.white.copyWith(
                                      fontSize: 8,
                                      height: 2,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 18),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final DateTime year;
  final double sales;
}
