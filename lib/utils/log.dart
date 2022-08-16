import 'package:logger/logger.dart';

class Log {
  static bool logEnable = true;
  static var logger = Logger();
  static void debug(String title, dynamic log) {
    if (logEnable) logger.d(log, title);
  }

  static void print(dynamic log) {
    if (logEnable) logger.d(log);
  }

  static void error(String title, dynamic log) {
    if (logEnable) logger.e(log, null, StackTrace.fromString(title));
  }
}
