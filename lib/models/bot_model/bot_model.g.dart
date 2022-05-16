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
      workType: $enumDecode(_$BotWorkTypesEnumMap, json['workType']),
      subTypes: (json['subTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$BotSubTypesEnumMap, e))
          .toSet(),
      workMinutes: json['workMinutes'] as int,
      isIncreased: json['isIncreased'] as bool,
    );

Map<String, dynamic> _$$_BotModelToJson(_$_BotModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'botType': _$BotTypesEnumMap[instance.botType],
      'money': instance.money,
      'percent': instance.percent,
      'workType': _$BotWorkTypesEnumMap[instance.workType],
      'subTypes':
          instance.subTypes.map((e) => _$BotSubTypesEnumMap[e]).toList(),
      'workMinutes': instance.workMinutes,
      'isIncreased': instance.isIncreased,
    };

const _$BotTypesEnumMap = {
  BotTypes.FLAT: 'FLAT',
  BotTypes.TREND: 'TREND',
};

const _$BotWorkTypesEnumMap = {
  BotWorkTypes.STANDARD: 'STANDARD',
  BotWorkTypes.RANGE: 'RANGE',
  BotWorkTypes.PUMP: 'PUMP',
};

const _$BotSubTypesEnumMap = {
  BotSubTypes.STOP_LOSS: 'STOP_LOSS',
  BotSubTypes.TAKE_PROFIT: 'TAKE_PROFIT',
  BotSubTypes.TRAILING: 'TRAILING',
};
