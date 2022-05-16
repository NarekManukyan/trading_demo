// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BotModel _$BotModelFromJson(Map<String, dynamic> json) {
  return _BotModel.fromJson(json);
}

/// @nodoc
mixin _$BotModel {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  BotTypes get botType => throw _privateConstructorUsedError;
  double get money => throw _privateConstructorUsedError;
  double get percent => throw _privateConstructorUsedError;
  BotWorkTypes get workType => throw _privateConstructorUsedError;
  Set<BotSubTypes> get subTypes => throw _privateConstructorUsedError;
  int get workMinutes => throw _privateConstructorUsedError;
  bool get isIncreased => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BotModelCopyWith<BotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BotModelCopyWith<$Res> {
  factory $BotModelCopyWith(BotModel value, $Res Function(BotModel) then) =
      _$BotModelCopyWithImpl<$Res>;
  $Res call(
      {String from,
      String to,
      BotTypes botType,
      double money,
      double percent,
      BotWorkTypes workType,
      Set<BotSubTypes> subTypes,
      int workMinutes,
      bool isIncreased});
}

/// @nodoc
class _$BotModelCopyWithImpl<$Res> implements $BotModelCopyWith<$Res> {
  _$BotModelCopyWithImpl(this._value, this._then);

  final BotModel _value;
  // ignore: unused_field
  final $Res Function(BotModel) _then;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? botType = freezed,
    Object? money = freezed,
    Object? percent = freezed,
    Object? workType = freezed,
    Object? subTypes = freezed,
    Object? workMinutes = freezed,
    Object? isIncreased = freezed,
  }) {
    return _then(_value.copyWith(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      botType: botType == freezed
          ? _value.botType
          : botType // ignore: cast_nullable_to_non_nullable
              as BotTypes,
      money: money == freezed
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as double,
      percent: percent == freezed
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      workType: workType == freezed
          ? _value.workType
          : workType // ignore: cast_nullable_to_non_nullable
              as BotWorkTypes,
      subTypes: subTypes == freezed
          ? _value.subTypes
          : subTypes // ignore: cast_nullable_to_non_nullable
              as Set<BotSubTypes>,
      workMinutes: workMinutes == freezed
          ? _value.workMinutes
          : workMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      isIncreased: isIncreased == freezed
          ? _value.isIncreased
          : isIncreased // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_BotModelCopyWith<$Res> implements $BotModelCopyWith<$Res> {
  factory _$$_BotModelCopyWith(
          _$_BotModel value, $Res Function(_$_BotModel) then) =
      __$$_BotModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String from,
      String to,
      BotTypes botType,
      double money,
      double percent,
      BotWorkTypes workType,
      Set<BotSubTypes> subTypes,
      int workMinutes,
      bool isIncreased});
}

/// @nodoc
class __$$_BotModelCopyWithImpl<$Res> extends _$BotModelCopyWithImpl<$Res>
    implements _$$_BotModelCopyWith<$Res> {
  __$$_BotModelCopyWithImpl(
      _$_BotModel _value, $Res Function(_$_BotModel) _then)
      : super(_value, (v) => _then(v as _$_BotModel));

  @override
  _$_BotModel get _value => super._value as _$_BotModel;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? botType = freezed,
    Object? money = freezed,
    Object? percent = freezed,
    Object? workType = freezed,
    Object? subTypes = freezed,
    Object? workMinutes = freezed,
    Object? isIncreased = freezed,
  }) {
    return _then(_$_BotModel(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      botType: botType == freezed
          ? _value.botType
          : botType // ignore: cast_nullable_to_non_nullable
              as BotTypes,
      money: money == freezed
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as double,
      percent: percent == freezed
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      workType: workType == freezed
          ? _value.workType
          : workType // ignore: cast_nullable_to_non_nullable
              as BotWorkTypes,
      subTypes: subTypes == freezed
          ? _value._subTypes
          : subTypes // ignore: cast_nullable_to_non_nullable
              as Set<BotSubTypes>,
      workMinutes: workMinutes == freezed
          ? _value.workMinutes
          : workMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      isIncreased: isIncreased == freezed
          ? _value.isIncreased
          : isIncreased // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BotModel implements _BotModel {
  _$_BotModel(
      {required this.from,
      required this.to,
      required this.botType,
      required this.money,
      required this.percent,
      required this.workType,
      required final Set<BotSubTypes> subTypes,
      required this.workMinutes,
      required this.isIncreased})
      : _subTypes = subTypes;

  factory _$_BotModel.fromJson(Map<String, dynamic> json) =>
      _$$_BotModelFromJson(json);

  @override
  final String from;
  @override
  final String to;
  @override
  final BotTypes botType;
  @override
  final double money;
  @override
  final double percent;
  @override
  final BotWorkTypes workType;
  final Set<BotSubTypes> _subTypes;
  @override
  Set<BotSubTypes> get subTypes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_subTypes);
  }

  @override
  final int workMinutes;
  @override
  final bool isIncreased;

  @override
  String toString() {
    return 'BotModel(from: $from, to: $to, botType: $botType, money: $money, percent: $percent, workType: $workType, subTypes: $subTypes, workMinutes: $workMinutes, isIncreased: $isIncreased)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BotModel &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to) &&
            const DeepCollectionEquality().equals(other.botType, botType) &&
            const DeepCollectionEquality().equals(other.money, money) &&
            const DeepCollectionEquality().equals(other.percent, percent) &&
            const DeepCollectionEquality().equals(other.workType, workType) &&
            const DeepCollectionEquality().equals(other._subTypes, _subTypes) &&
            const DeepCollectionEquality()
                .equals(other.workMinutes, workMinutes) &&
            const DeepCollectionEquality()
                .equals(other.isIncreased, isIncreased));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(to),
      const DeepCollectionEquality().hash(botType),
      const DeepCollectionEquality().hash(money),
      const DeepCollectionEquality().hash(percent),
      const DeepCollectionEquality().hash(workType),
      const DeepCollectionEquality().hash(_subTypes),
      const DeepCollectionEquality().hash(workMinutes),
      const DeepCollectionEquality().hash(isIncreased));

  @JsonKey(ignore: true)
  @override
  _$$_BotModelCopyWith<_$_BotModel> get copyWith =>
      __$$_BotModelCopyWithImpl<_$_BotModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BotModelToJson(this);
  }
}

abstract class _BotModel implements BotModel {
  factory _BotModel(
      {required final String from,
      required final String to,
      required final BotTypes botType,
      required final double money,
      required final double percent,
      required final BotWorkTypes workType,
      required final Set<BotSubTypes> subTypes,
      required final int workMinutes,
      required final bool isIncreased}) = _$_BotModel;

  factory _BotModel.fromJson(Map<String, dynamic> json) = _$_BotModel.fromJson;

  @override
  String get from => throw _privateConstructorUsedError;
  @override
  String get to => throw _privateConstructorUsedError;
  @override
  BotTypes get botType => throw _privateConstructorUsedError;
  @override
  double get money => throw _privateConstructorUsedError;
  @override
  double get percent => throw _privateConstructorUsedError;
  @override
  BotWorkTypes get workType => throw _privateConstructorUsedError;
  @override
  Set<BotSubTypes> get subTypes => throw _privateConstructorUsedError;
  @override
  int get workMinutes => throw _privateConstructorUsedError;
  @override
  bool get isIncreased => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BotModelCopyWith<_$_BotModel> get copyWith =>
      throw _privateConstructorUsedError;
}
