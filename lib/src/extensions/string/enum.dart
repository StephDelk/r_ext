extension EnumParser on String {
  T toEnum<T>(List<T> values) {
    return values.firstWhere((e) {
      var s = e.toString();
      var b = this;

      return s == b;
    });
  }
}
