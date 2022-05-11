import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/bot_types.dart';

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
  }) = _BotModel;

  factory BotModel.fromJson(Map<String, dynamic> json) =>
      _$BotModelFromJson(json);
}
