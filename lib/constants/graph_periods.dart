enum GraphPeriods {
  H24,
  D7,
  D30,
  ALL,
}

extension GraphPeriodsHelper on GraphPeriods {
  String get title {
    switch (this) {
      case GraphPeriods.H24:
        return '24h';
      case GraphPeriods.D7:
        return '7d';
      case GraphPeriods.D30:
        return '30d';
      case GraphPeriods.ALL:
        return 'All';
    }
  }
}
