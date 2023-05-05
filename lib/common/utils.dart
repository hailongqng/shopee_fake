import 'package:intl/intl.dart';

// Ex: 1234 => 1,234
String formatNumber(int n) {
  NumberFormat nFormater = NumberFormat.decimalPattern();
  return nFormater.format(n);
}
