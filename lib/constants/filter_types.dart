enum FilterTypes {
  ALL,
  GRID,
  DCA,
}

extension FilterTypesHelper on FilterTypes {
  String get title {
    switch (this) {
      case FilterTypes.GRID:
        return 'Grid';
      case FilterTypes.DCA:
        return 'DCA';
      case FilterTypes.ALL:
        return 'All';
    }
  }
}
