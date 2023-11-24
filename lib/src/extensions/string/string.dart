extension StringExt on String {
  String? capitalize() {
    if (isEmpty) {
      return this;
    }

    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String capitalsWords() {
    if (isEmpty) {
      return this;
    }

    final List<String> words = split(' ');
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        return word.capitalize();
      }

      return '';
    });

    return capitalizedWords.join(' ');
  }

  String? toCamelCase() {
    if (isEmpty) {
      return this;
    }

    var words = trim().split(RegExp(r'(\s+)'));
    var result = words.first.toLowerCase();

    for (var i = 1; i < words.length; i++) {
      result += words[i].capitalize()!;
    }

    return result;
  }

  String? reverse() {
    if (isEmpty) {
      return this;
    }
    var letters = split('').toList().reversed;

    return letters.reduce((current, next) => current + next);
  }

  String? removeNumbers() {
    if (isEmpty) {
      return this;
    }
    var regex = RegExp(r'(\d+)');

    return replaceAll(regex, '');
  }

  String? onlyLetters() {
    if (isEmpty) {
      return this;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([^a-zA-Z]+)');

    return replaceAll(regex, '');
  }

  String? onlyNumbers() {
    if (isEmpty) {
      return this;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([^0-9]+)');

    return replaceAll(regex, '');
  }

  String? ellipse(int? length) {
    if (isEmpty) {
      return this;
    }

    if (length == null) {
      return this;
    }

    if (this.length < length) {
      return this;
    }

    return '${String.fromCharCodes(runes.toList().sublist(0, length))} ...';
  }
}
