import 'package:intl/intl.dart';

extension StringExtension on String {
  String get withSymbols {
    final NumberFormat oCcy;
    oCcy = NumberFormat("#,###", "vi_VN");

    double a = double.parse(this);

    return oCcy.format(a).toString();
  }
}
