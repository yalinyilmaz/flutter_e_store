import 'package:intl/intl.dart';

class MoneyFormatter {
  const MoneyFormatter._();
  static final _formatter = NumberFormat("#,##0", "tr_TR");
  static final _formatterAll = NumberFormat("#,##0.00", "tr_TR");

  static String formatPartOfint(double money) {
    final String? value =
        money.toStringAsFixed(2).split('.').elementAtOrNull(0);

    if (value == null) {
      return '';
    }

    return _formatter.format(double.parse(value));
  }

  /// This method is used to format the part of the double value
  /// For example, if the value is 123.45, the method will return 45
  static String formatPartOfdouble(double money) {
    double value = (money * 100).floor() / 100;

    final String? valueString = value.toString().split('.').elementAtOrNull(1);

    return valueString ?? '';
  }

  static String formatAll(double money) {
    return _formatterAll.format(money);
  }

  /// For example, if the [money] is 12345, the method will return 12.345
  static String formatDoubleAndInt(String money) {
    if (money.contains(',')) {
      final int intPart =
          int.parse(money.split(',').elementAtOrNull(0)!.replaceAll('.', ''));

      money =
          '${NumberFormat.currency(locale: 'eu', symbol: '').format(intPart).split(',').elementAtOrNull(0)},${money.split(',').elementAtOrNull(1)}';
    } else {
      if (money != '') {
        money = NumberFormat.currency(locale: 'eu', symbol: '')
                .format(int.parse(money.replaceAll('.', '')))
                .split(',')
                .elementAtOrNull(0) ??
            '';
      }
    }

    return money;
  }
}
