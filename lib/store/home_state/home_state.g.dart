// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeState on _HomeState, Store {
  Computed<ObservableList<BotModel>>? _$gridBotsComputed;

  @override
  ObservableList<BotModel> get gridBots => (_$gridBotsComputed ??=
          Computed<ObservableList<BotModel>>(() => super.gridBots,
              name: '_HomeState.gridBots'))
      .value;
  Computed<ObservableList<BotModel>>? _$dcaBotsComputed;

  @override
  ObservableList<BotModel> get dcaBots => (_$dcaBotsComputed ??=
          Computed<ObservableList<BotModel>>(() => super.dcaBots,
              name: '_HomeState.dcaBots'))
      .value;

  late final _$pageAtom = Atom(name: '_HomeState.page', context: context);

  @override
  double get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(double value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$isBotProfitSelectedAtom =
      Atom(name: '_HomeState.isBotProfitSelected', context: context);

  @override
  bool get isBotProfitSelected {
    _$isBotProfitSelectedAtom.reportRead();
    return super.isBotProfitSelected;
  }

  @override
  set isBotProfitSelected(bool value) {
    _$isBotProfitSelectedAtom.reportWrite(value, super.isBotProfitSelected, () {
      super.isBotProfitSelected = value;
    });
  }

  late final _$selectedFilterAtom =
      Atom(name: '_HomeState.selectedFilter', context: context);

  @override
  FilterTypes get selectedFilter {
    _$selectedFilterAtom.reportRead();
    return super.selectedFilter;
  }

  @override
  set selectedFilter(FilterTypes value) {
    _$selectedFilterAtom.reportWrite(value, super.selectedFilter, () {
      super.selectedFilter = value;
    });
  }

  late final _$selectedSubFilterAtom =
      Atom(name: '_HomeState.selectedSubFilter', context: context);

  @override
  FilterSubtypes get selectedSubFilter {
    _$selectedSubFilterAtom.reportRead();
    return super.selectedSubFilter;
  }

  @override
  set selectedSubFilter(FilterSubtypes value) {
    _$selectedSubFilterAtom.reportWrite(value, super.selectedSubFilter, () {
      super.selectedSubFilter = value;
    });
  }

  late final _$selectedSortTypeAtom =
      Atom(name: '_HomeState.selectedSortType', context: context);

  @override
  SortTypes get selectedSortType {
    _$selectedSortTypeAtom.reportRead();
    return super.selectedSortType;
  }

  @override
  set selectedSortType(SortTypes value) {
    _$selectedSortTypeAtom.reportWrite(value, super.selectedSortType, () {
      super.selectedSortType = value;
    });
  }

  late final _$selectedSortTypeDirectionAtom =
      Atom(name: '_HomeState.selectedSortTypeDirection', context: context);

  @override
  SortTypeDirection get selectedSortTypeDirection {
    _$selectedSortTypeDirectionAtom.reportRead();
    return super.selectedSortTypeDirection;
  }

  @override
  set selectedSortTypeDirection(SortTypeDirection value) {
    _$selectedSortTypeDirectionAtom
        .reportWrite(value, super.selectedSortTypeDirection, () {
      super.selectedSortTypeDirection = value;
    });
  }

  late final _$circleChartDataAtom =
      Atom(name: '_HomeState.circleChartData', context: context);

  @override
  ObservableList<ChartDataModel> get circleChartData {
    _$circleChartDataAtom.reportRead();
    return super.circleChartData;
  }

  @override
  set circleChartData(ObservableList<ChartDataModel> value) {
    _$circleChartDataAtom.reportWrite(value, super.circleChartData, () {
      super.circleChartData = value;
    });
  }

  late final _$botItemsAtom =
      Atom(name: '_HomeState.botItems', context: context);

  @override
  ObservableList<BotModel> get botItems {
    _$botItemsAtom.reportRead();
    return super.botItems;
  }

  @override
  set botItems(ObservableList<BotModel> value) {
    _$botItemsAtom.reportWrite(value, super.botItems, () {
      super.botItems = value;
    });
  }

  late final _$_HomeStateActionController =
      ActionController(name: '_HomeState', context: context);

  @override
  void sortByBotProfit() {
    final _$actionInfo = _$_HomeStateActionController.startAction(
        name: '_HomeState.sortByBotProfit');
    try {
      return super.sortByBotProfit();
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
isBotProfitSelected: ${isBotProfitSelected},
selectedFilter: ${selectedFilter},
selectedSubFilter: ${selectedSubFilter},
selectedSortType: ${selectedSortType},
selectedSortTypeDirection: ${selectedSortTypeDirection},
circleChartData: ${circleChartData},
botItems: ${botItems},
gridBots: ${gridBots},
dcaBots: ${dcaBots}
    ''';
  }
}
