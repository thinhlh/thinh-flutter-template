import 'package:logger/logger.dart';

abstract class LoggerUtils {
  static final Logger logger = Logger(printer: SimplePrinter());
}
