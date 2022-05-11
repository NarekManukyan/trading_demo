// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BotModel _$$_BotModelFromJson(Map json) => _$_BotModel(
      from: json['from'] as String,
      to: json['to'] as String,
      botType: $enumDecode(_$BotTypesEnumMap, json['botType']),
      money: (json['money'] as num).toDouble(),
      percent: (json['percent'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BotModelToJson(_$_BotModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'botType': _$BotTypesEnumMap[instance.botType],
      'money': instance.money,
      'percent': instance.percent,
    };

const _$BotTypesEnumMap = {
  BotTypes.FLAT: 'FLAT',
  BotTypes.TREND: 'TREND',
};
