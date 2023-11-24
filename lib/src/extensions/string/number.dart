extension NumberExt on String {
  int countWords() {
    if (isEmpty) {
      return 0;
    }

    return trim().split(RegExp(r'(\s+)')).length;
  }

  int? toInt() {
    if (isEmpty) {
      return null;
    }

    return int.tryParse(this) ?? double.tryParse(this)?.floor();
  }

  double? toDouble() {
    if (isEmpty) {
      return null;
    }

    return double.tryParse(this);
  }

  String localizeDecimals(bool useComma) {
    if (useComma) {
      return replaceAll('.', ',');
    }

    return this;
  }
}
