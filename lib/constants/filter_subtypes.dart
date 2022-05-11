enum FilterSubtypes {
  ALL,
  SPOT,
  FEATURES,
}

extension FilterSubtypesHelper on FilterSubtypes {
  String get title {
    switch (this) {
      case FilterSubtypes.SPOT:
        return 'Spot';
      case FilterSubtypes.FEATURES:
        return 'Futures';
      case FilterSubtypes.ALL:
        return 'All';
    }
  }
}
