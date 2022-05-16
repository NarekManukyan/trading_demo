import 'package:flutter/material.dart';

import '../utils/assets.dart';

enum BotSubTypes {
  STOP_LOSS,
  TAKE_PROFIT,
  TRAILING,
}

extension BotSubTypesHelper on BotSubTypes {
  Image get icon {
    switch (this) {
      case BotSubTypes.STOP_LOSS:
        return Assets.iconsStopLoss.png;
      case BotSubTypes.TAKE_PROFIT:
        return Assets.iconsTakeProfit.png;
      case BotSubTypes.TRAILING:
        return Assets.iconsTrailing.png;
    }
  }
}
