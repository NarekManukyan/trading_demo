import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/bot_sub_types.dart';
import '../../constants/bot_types.dart';
import '../../constants/bot_work_type.dart';

part 'bot_model.freezed.dart';
part 'bot_model.g.dart';

@freezed
class BotModel with _$BotModel {
  factory BotModel({
    required String from,
    required String to,
    required BotTypes botType,
    required double money,
    required double percent,
    required BotWorkTypes workType,
    required Set<BotSubTypes> subTypes,
    required int workMinutes,
    required bool isIncreased,
  }) = _BotModel;

  factory BotModel.fromJson(Map<String, dynamic> json) =>
      _$BotModelFromJson(json);
}
