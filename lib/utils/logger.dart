import 'dart:developer';

/// A service class for logging messages with different severity levels.
///
/// This class provides static methods for logging informational and error messages.
/// It utilizes Dart's built-in `log` function to record messages with a consistent format.
class LoggerService {
  /// Logs an informational message.
  ///
  /// The [message] parameter is required and represents the information to be logged.
  ///

  static void info(String message) {
    log("INFO: $message", name: "LoggerService");
  }

  /// Logs an error message with optional error details and stack trace.
  ///
  /// The [message] parameter is required and represents the error message.
  /// The optional [error] parameter allows passing an exception or error object.
  /// The optional [stackTrace] parameter records the call stack at the time of logging.
  ///

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    log("ERROR: $message", name: "LoggerService", error: error, stackTrace: stackTrace);
  }
}