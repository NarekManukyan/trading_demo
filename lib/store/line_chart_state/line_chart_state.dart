import 'dart:math';

import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';

import '../../constants/graph_periods.dart';
import '../../widgets/graph_widget.dart';

part 'line_chart_state.g.dart';

class LineChartState = _LineChartState with _$LineChartState;

abstract class _LineChartState with Store {
  _LineChartState() {
    chartData1 = [
      SalesData(
        DateTime(2022, 5),
        0,
      ),
      ...List.generate(30, (index) {
        return SalesData(
          DateTime(2022, 5, index + 2),
          Random().nextInt(200) - 100,
        );
      }),
    ].asObservable();
    chartData2 = [
      SalesData(
        DateTime(2022, 5),
        0,
      ),
      ...List.generate(30, (index) {
        return SalesData(
          DateTime(2022, 5, index + 2),
          Random().nextInt(200) - 100,
        );
      }),
    ].asObservable();
  }

  @observable
  bool summaryGraphDisabled = false;
  @observable
  bool btcGraphDisabled = false;
  @observable
  GraphPeriods selectedPeriod = GraphPeriods.D30;
  @observable
  ObservableList<SalesData> chartData1 = <SalesData>[].asObservable();
  @observable
  ObservableList<SalesData> chartData2 = <SalesData>[].asObservable();

  @computed
  ObservableList<double> get maxValues => [
        chartData1.map((e) => e.sales).max,
        chartData2.map((e) => e.sales).max,
      ].toList().asObservable();

  @computed
  ObservableList<double> get minValues => [
        chartData1.map((e) => e.sales).min,
        chartData2.map((e) => e.sales).min,
      ].toList().asObservable();

  @computed
  double get areaSize => maxValues.max - minValues.min;
}
