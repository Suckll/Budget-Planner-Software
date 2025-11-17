import 'package:intl/intl.dart';

String fmt(double v, {String symbol = '\$'}) {
  final f = NumberFormat.currency(symbol: symbol, decimalDigits: 2);
  return f.format(v);
}
