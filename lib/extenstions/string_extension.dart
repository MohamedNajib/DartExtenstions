import 'package:intl/intl.dart' as intl;

extension StringExtension on String {
  /// print('First'.concatWithSpace('other'))
  String concatWithSpace(String other) => '$this $other';

  /// print('First' & 'other')
  String operator &(String other) => '$this $other';

  ///Returns first letter of the string as Caps eg -> Flutter
  ///print('first'.firstLetterUpperCase); >>>>> First
  String get firstLetterUpperCase => length > 1
      ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}"
      : this;

  /// Return a bool if the string is null or empty
  bool get isEmptyString => trimLeft().isEmpty;

  /// if the string is empty perform an action
  /// 'name'.ifEmpty(() {
  ///     print('Name is empty');
  ///   });
  String? ifEmpty(Function action) => isEmpty ? action() : this;

  ///Capitalize all words inside a string
  ///print('first string'.allWordsCapitalize); >>> First String
  String get allWordsCapitalize => toLowerCase().split(' ').map((word) {
        final String leftText =
            (word.length > 1) ? word.substring(1, word.length) : '';
        return word[0].toUpperCase() + leftText;
      }).join(' ');

  /// Format numeric currency
  /// print('5'.numCurrency); >>>> 5.00
  String get numCurrency =>
      intl.NumberFormat.currency(customPattern: "#,##0.00")
          .format(double.tryParse(this))
          .toString();

  /// Format numeric currency with provided locale
  // String numCurrencyWithLocale({String locale = "en_US"}) =>
  //     intl.NumberFormat.currency(
  //       locale: locale,
  //     ).format(double.tryParse(this)).toString();

  /// check if the string is an IP
  bool get isIP {
    return new RegExp(
      r"^(?!0)(?!.*\.$)((1?\d?\d|25[0-5]|2[0-4]\d)(\.|$)){4}$",
      caseSensitive: false,
      multiLine: false,
    ).hasMatch(this);
  }

  /// Validation Methods
  ///
  /// Uses regex to check if the provided string is a valid email address or not
  ///
  bool get isValidateEmail => RegExp(
          r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$")
      .hasMatch(this);

  /// Check if String is Right to Left Language
  bool get isRtlLanguage {
    final _rtlLocaleRegex = RegExp(
        r'^(ar|dv|he|iw|fa|nqo|ps|sd|ug|ur|yi|.*[-_]'
        r'(Arab|Hebr|Thaa|Nkoo|Tfng))(?!.*[-_](Latn|Cyrl)($|-|_))'
        r'($|-|_)',
        caseSensitive: false);

    final bool _rtlCheck = _rtlLocaleRegex.hasMatch(this);

    return _rtlCheck;
  }

  ///print('Numeric  ${'22222223344556677'}'); >>> true
  bool get isNumeric => new RegExp(r'^-?[0-9]+$').hasMatch(this);

  bool get isNumber => RegExp("[1-9]").hasMatch(this);

  bool get isLetter => RegExp("[A-Za-z]").hasMatch(this);

  // print('?'.isSymbol()); >> true >> ?><_)(*&^%$#@!
  bool isSymbol() {
    const String pattern =
        "[`~!@#\$%^&*()_\-+=<>?:\"{}|,.//\/;'\\[\]·~！@#￥%……&*（）——\-+={}|《》？：“”【】、；‘’，。、]";
    for (int i = 0; i < length; i++) {
      if (pattern.contains(this[i])) {
        return true;
      }
    }
    return false;
  }
}
