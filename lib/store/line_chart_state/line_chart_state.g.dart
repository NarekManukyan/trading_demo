// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_chart_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LineChartState on _LineChartState, Store {
  Computed<ObservableList<double>>? _$maxValuesComputed;

  @override
  ObservableList<double> get maxValues => (_$maxValuesComputed ??=
          Computed<ObservableList<double>>(() => super.maxValues,
              name: '_LineChartState.maxValues'))
      .value;
  Computed<ObservableList<double>>? _$minValuesComputed;

  @override
  ObservableList<double> get minValues => (_$minValuesComputed ??=
          Computed<ObservableList<double>>(() => super.minValues,
              name: '_LineChartState.minValues'))
      .value;
  Computed<double>? _$areaSizeComputed;

  @override
  double get areaSize =>
      (_$areaSizeComputed ??= Computed<double>(() => super.areaSize,
              name: '_LineChartState.areaSize'))
          .value;

  late final _$summaryGraphDisabledAtom =
      Atom(name: '_LineChartState.summaryGraphDisabled', context: context);

  @override
  bool get summaryGraphDisabled {
    _$summaryGraphDisabledAtom.reportRead();
    return super.summaryGraphDisabled;
  }

  @override
  set summaryGraphDisabled(bool value) {
    _$summaryGraphDisabledAtom.reportWrite(value, super.summaryGraphDisabled,
        () {
      super.summaryGraphDisabled = value;
    });
  }

  late final _$btcGraphDisabledAtom =
      Atom(name: '_LineChartState.btcGraphDisabled', context: context);

  @override
  bool get btcGraphDisabled {
    _$btcGraphDisabledAtom.reportRead();
    return super.btcGraphDisabled;
  }

  @override
  set btcGraphDisabled(bool value) {
    _$btcGraphDisabledAtom.reportWrite(value, super.btcGraphDisabled, () {
      super.btcGraphDisabled = value;
    });
  }

  late final _$selectedPeriodAtom =
      Atom(name: '_LineChartState.selectedPeriod', context: context);

  @override
  GraphPeriods get selectedPeriod {
    _$selectedPeriodAtom.reportRead();
    return super.selectedPeriod;
  }

  @override
  set selectedPeriod(GraphPeriods value) {
    _$selectedPeriodAtom.reportWrite(value, super.selectedPeriod, () {
      super.selectedPeriod = value;
    });
  }

  late final _$chartData1Atom =
      Atom(name: '_LineChartState.chartData1', context: context);

  @override
  ObservableList<SalesData> get chartData1 {
    _$chartData1Atom.reportRead();
    return super.chartData1;
  }

  @override
  set chartData1(ObservableList<SalesData> value) {
    _$chartData1Atom.reportWrite(value, super.chartData1, () {
      super.chartData1 = value;
    });
  }

  late final _$chartData2Atom =
      Atom(name: '_LineChartState.chartData2', context: context);

  @override
  ObservableList<SalesData> get chartData2 {
    _$chartData2Atom.reportRead();
    return super.chartData2;
  }

  @override
  set chartData2(ObservableList<SalesData> value) {
    _$chartData2Atom.reportWrite(value, super.chartData2, () {
      super.chartData2 = value;
    });
  }

  @override
  String toString() {
    return '''
summaryGraphDisabled: ${summaryGraphDisabled},
btcGraphDisabled: ${btcGraphDisabled},
selectedPeriod: ${selectedPeriod},
chartData1: ${chartData1},
chartData2: ${chartData2},
maxValues: ${maxValues},
minValues: ${minValues},
areaSize: ${areaSize}
    ''';
  }
}
