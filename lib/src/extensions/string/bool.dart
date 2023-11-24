extension BoolExt on String {
  bool isNumber() {
    if (isEmpty) {
      return false;
    }

    return num.tryParse(this) != null;
  }

  bool? isUrl() {
    if (isEmpty) {
      return false;
    }
    var regex = RegExp(
      r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)',
    );

    return regex.hasMatch(this);
  }

  bool? isMail() {
    if (isEmpty) {
      return false;
    }
    var regex = RegExp(r"(^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)");

    return regex.hasMatch(this);
  }

  bool? isDate() {
    if (isEmpty) {
      return false;
    }
    var regex = RegExp(
      r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$',
    );
    if (regex.hasMatch(this)) {
      return true;
    }

    try {
      DateTime.parse(this);

      return true;
    } on FormatException {
      return false;
    }
  }
}
