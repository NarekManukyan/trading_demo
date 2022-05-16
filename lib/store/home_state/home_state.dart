import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../constants/bot_sub_types.dart';
import '../../constants/bot_types.dart';
import '../../constants/bot_work_type.dart';
import '../../constants/filter_subtypes.dart';
import '../../constants/filter_types.dart';
import '../../constants/sort_types.dart';
import '../../models/bot_model/bot_model.dart';
import '../../models/chart_data/chart_data_model.dart';
import '../../themes/app_colors.dart';

part 'home_state.g.dart';

class HomeState = _HomeState with _$HomeState;

abstract class _HomeState with Store {
  _HomeState() {
    circleChartData = [
      ChartDataModel('BTC', 53, AppColors.yellow),
      ChartDataModel('ETH', 34, AppColors.blue),
      ChartDataModel('USDT', 13, AppColors.green),
      ChartDataModel('XLM', 13, AppColors.color4),
      ChartDataModel('Other', 2, AppColors.dopGray)
    ].asObservable();

    botItems = List.generate(20, (index) {
      return BotModel(
        from: fromList[Random().nextInt(fromList.length)],
        to: toList[Random().nextInt(toList.length)],
        botType: BotTypes.values[Random().nextInt(2)],
        money: Random().nextDouble() * 120,
        percent: Random().nextDouble() * 100,
        workMinutes: Random().nextInt(100),
        isIncreased: Random().nextBool(),
        workType:
            BotWorkTypes.values[Random().nextInt(BotWorkTypes.values.length)],
        subTypes: index.isEven
            ? {
                BotSubTypes.values[Random().nextInt(BotSubTypes.values.length)],
                BotSubTypes.values[Random().nextInt(BotSubTypes.values.length)],
              }
            : {},
      );
    }).asObservable();
    sortByBotProfit();
  }

  final fromList = ['BTC', 'ETH', 'NEO', 'OKB', 'SUSHI', 'SC'];
  final toList = ['ETH', 'USDT'];

  @observable
  double page = 0;
  @observable
  bool isBotProfitSelected = false;
  @observable
  FilterTypes selectedFilter = FilterTypes.ALL;
  @observable
  FilterSubtypes selectedSubFilter = FilterSubtypes.ALL;
  @observable
  SortTypes selectedSortType = SortTypes.BOT_PROFILE;
  @observable
  SortTypeDirection selectedSortTypeDirection = SortTypeDirection.UP;
  @observable
  ObservableList<ChartDataModel> circleChartData =
      <ChartDataModel>[].asObservable();
  @observable
  ObservableList<BotModel> botItems = <BotModel>[].asObservable();

  @computed
  ObservableList<BotModel> get gridBots => botItems
      .where((element) => element.botType == BotTypes.FLAT)
      .toList()
      .asObservable();

  @computed
  ObservableList<BotModel> get dcaBots => botItems
      .where((element) => element.botType == BotTypes.TREND)
      .toList()
      .asObservable();

  @action
  void sortByBotProfit() {
    switch (selectedSortType) {
      case SortTypes.BOT_PROFILE:
        botItems.sort((a, b) => b.money.compareTo(a.money));
        break;
      case SortTypes.VALUE:
        botItems.sort((a, b) => b.percent.compareTo(a.percent));
        break;
      case SortTypes.ALPHABETICALLY:
        botItems.sort((a, b) => a.from.compareTo(b.from));
        break;
    }
    if (selectedSortTypeDirection == SortTypeDirection.DOWN) {
      botItems = botItems.reversed.toList().asObservable();
    }
  }
}
