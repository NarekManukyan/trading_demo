import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assets {
  Assets._();

  static const String iconsAdd = 'assets/icons/add.png';
  static const String iconsAngleDown = 'assets/icons/angle_down.png';
  static const String iconsAppBarBackground =
      'assets/icons/app_bar_background.png';
  static const String iconsArrowDown = 'assets/icons/arrow_down.png';
  static const String iconsArrowUp = 'assets/icons/arrow_up.png';
  static const String iconsAutorenew = 'assets/icons/autorenew.png';
  static const String iconsBinance = 'assets/icons/binance.png';
  static const String iconsBriefcase = 'assets/icons/briefcase.png';
  static const String iconsCheck = 'assets/icons/check.png';
  static const String iconsEdit = 'assets/icons/edit.png';
  static const String iconsFilter = 'assets/icons/filter.png';
  static const String iconsFlatBot = 'assets/icons/flat_bot.png';
  static const String iconsGraph = 'assets/icons/graph.png';
  static const String iconsList = 'assets/icons/list.png';
  static const String iconsLock = 'assets/icons/lock.png';
  static const String iconsNotifications = 'assets/icons/notifications.png';
  static const String iconsShowChart = 'assets/icons/show_chart.png';
  static const String iconsSort = 'assets/icons/sort.png';
  static const String iconsStopLoss = 'assets/icons/stop_loss.png';
  static const String iconsTakeProfit = 'assets/icons/take_profit.png';
  static const String iconsTimeSchedule = 'assets/icons/time_schedule.png';
  static const String iconsTrailing = 'assets/icons/trailing.png';
  static const String iconsTrendBot = 'assets/icons/trend_bot.png';
  static const String iconsUser = 'assets/icons/user.png';
  static const String iconsWarning = 'assets/icons/warning.png';
  static const String iconsSortList = 'assets/icons/sort_list.png';
}

extension AssetsHelper on String {
  SvgPicture svg({
    Color? color,
    double? height,
    double? width,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      this,
      color: color,
      height: height,
      width: width,
      fit: fit,
    );
  }

  Image pngColored({
    Color? color,
    double? height,
    double? width,
    BoxFit fit = BoxFit.scaleDown,
  }) {
    return Image.asset(
      this,
      color: color,
      height: height,
      width: width,
      fit: fit,
    );
  }

  Image get png => Image.asset(this);
}
