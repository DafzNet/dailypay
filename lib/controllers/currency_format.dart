import 'package:intl/intl.dart';
String formatAsMoney(dynamic amount) {
  double? amt;
  amount = amount.toString();
  amt = double.parse(amount);
  final formatter = NumberFormat.currency(locale: 'en_US', symbol: '');
  return "₦"+formatter.format(amt);
}