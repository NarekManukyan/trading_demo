import 'package:flutter/material.dart';

import '../utils/assets.dart';

enum BotTypes {
  FLAT,
  TREND,
}

extension FilterTypesHelper on BotTypes {
  Image get icon {
    switch (this) {
      case BotTypes.FLAT:
        return Assets.iconsFlatBot.png;
      case BotTypes.TREND:
        return Assets.iconsTrendBot.png;
    }
  }
}
