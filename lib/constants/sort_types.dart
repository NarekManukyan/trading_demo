enum SortTypes {
  BOT_PROFILE,
  VALUE,
  ALPHABETICALLY,
}

enum SortTypeDirection {
  UP,
  DOWN,
}

extension SortTypesHelper on SortTypes {
  String get title {
    switch (this) {
      case SortTypes.BOT_PROFILE:
        return 'Bot profit';
      case SortTypes.VALUE:
        return 'Value';
      case SortTypes.ALPHABETICALLY:
        return 'Alphabetically';
    }
  }
}
