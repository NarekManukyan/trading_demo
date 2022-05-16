import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

enum BotWorkTypes {
  STANDARD,
  RANGE,
  PUMP,
}

extension BotWorkTypesHelper on BotWorkTypes {
  String get title {
    switch (this) {
      case BotWorkTypes.STANDARD:
        return '';
      case BotWorkTypes.RANGE:
        return 'Range';
      case BotWorkTypes.PUMP:
        return 'Pump';
    }
  }

  Color get color {
    switch (this) {
      case BotWorkTypes.STANDARD:
        return Colors.transparent;
      case BotWorkTypes.RANGE:
        return AppColors.color4;
      case BotWorkTypes.PUMP:
        return AppColors.color3;
    }
  }
}
